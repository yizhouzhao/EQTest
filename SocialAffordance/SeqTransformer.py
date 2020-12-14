from transformers import BertConfig, EncoderDecoderConfig, BertModel
from transformers.modeling_bert import BertEncoder, BertPooler

import torch
import torch.nn as nn

seq_hidden_encode_dim = 32
seq_hidden_dim = 8
seq_num_attention_heads = 6

class SeqBertEmbeddings(nn.Module):
    def __init__(self, config):
        super().__init__()
        self.word_embeddings = nn.Linear(config.input_dim, config.hidden_size)
        #self.word_embeddings = nn.Embedding(config.vocab_size, config.hidden_size)

        self.position_embeddings = nn.Embedding(config.max_position_embeddings, config.hidden_size)
        #self.token_type_embeddings = nn.Embedding(config.type_vocab_size, config.hidden_size)

        # self.LayerNorm is not snake-cased to stick with TensorFlow model variable name and be able to load
        # any TensorFlow checkpoint file
        self.LayerNorm = nn.LayerNorm(config.hidden_size, eps=config.layer_norm_eps)
        self.dropout = nn.Dropout(config.hidden_dropout_prob)

        # position_ids (1, len position emb) is contiguous in memory and exported when serialized
        self.register_buffer("position_ids", torch.arange(config.max_position_embeddings).expand((1, -1)))

    def forward(self, input_ids=None, token_type_ids=None, position_ids=None, inputs_embeds=None):
        if input_ids is not None:
            input_shape = input_ids.size()
        else:
            input_shape = inputs_embeds.size()[:-1]

        seq_length = input_shape[1]

        if position_ids is None:
            position_ids = self.position_ids[:, :seq_length]

        #if token_type_ids is None:
        #    token_type_ids = torch.zeros(input_shape, dtype=torch.long, device=self.position_ids.device)

        if inputs_embeds is None:
            inputs_embeds = self.word_embeddings(input_ids)

        position_embeddings = self.position_embeddings(position_ids)
        #token_type_embeddings = self.token_type_embeddings(token_type_ids)
        #print(inputs_embeds.shape, position_embeddings.shape, token_type_embeddings.shape)

        embeddings = inputs_embeds + position_embeddings #+ token_type_embeddings
        embeddings = self.LayerNorm(embeddings)
        embeddings = self.dropout(embeddings)
        return embeddings

class SeqEncoderDecoder(nn.Module):
    def __init__(self, config):
        super().__init__()
        self.encoder_embedding = SeqBertEmbeddings(config.encoder)
        self.encoder = BertEncoder(config.encoder)

        self.decoder_embedding = SeqBertEmbeddings(config.decoder)
        self.decoder = BertEncoder(config.decoder)

        self.linear = nn.Sequential(
            nn.Linear(config.decoder.hidden_size, 128),
            nn.ReLU(),
            nn.Linear(128, config.decoder.input_dim),
        )

    def forward(self, input_mov, output_mov,
                input_attention_mask=None,
                output_attention_mask=None,
                cross_attention_mask=None
                ):
        '''
        :param input_mov: B x L x N_ movement [1-T]
        :param output_mov: B x L x N_ movement [0-(T-1)]
        :return:
        '''
        input_shape = input_mov.size()[:-1]
        device = input_mov.device

        input_embedding = self.encoder_embedding(input_mov) # [B, L ,N]

        if input_attention_mask is None:
            input_attention_mask = torch.ones(input_shape, device=device)

        # [B,None,L,L]
        extended_attention_mask = self.get_extended_attention_mask(attention_mask=input_attention_mask,
                                                                   input_shape=input_shape,
                                                                   device=device
                                                                   )

        input_encoded = self.encoder(input_embedding,
                                     attention_mask=extended_attention_mask,
                                     encoder_hidden_states=None,
                                     encoder_attention_mask=None,
                                     )#([B, L ,N])

        output_shape = output_mov.size()[:-1]

        output_embedding = self.decoder_embedding(output_mov)# [B, L ,N]

        if output_attention_mask is None:
            output_attention_mask = torch.ones(output_shape, device=device)

        out_extended_attention_mask = self.get_extended_attention_mask(attention_mask=output_attention_mask,
                                                                   input_shape=output_shape,
                                                                   device=device
                                                                   )

        if cross_attention_mask is None:
            cross_attention_mask = torch.ones(input_shape, device=device)

        cross_extended_attention_mask = self.get_extended_attention_mask(attention_mask=cross_attention_mask,
                                                                       input_shape=output_shape,
                                                                       device=device
                                                                       )

        output_encoded = self.decoder(output_embedding,
                                      attention_mask=out_extended_attention_mask,
                                      encoder_hidden_states=input_encoded[0],
                                      encoder_attention_mask=cross_extended_attention_mask
                                      ) #([B, L ,N])

        output = self.linear(output_encoded[0])

        print("extended_attention_mask", extended_attention_mask, extended_attention_mask.shape)
        print("out_extended_attention_mask", out_extended_attention_mask, out_extended_attention_mask.shape)
        print("cross_extended_attention_mask", cross_extended_attention_mask, cross_extended_attention_mask.shape)

        return output

    def get_extended_attention_mask(self, attention_mask, input_shape, device, is_causal=True):
        """
        Makes broadcastable attention and causal masks so that future and masked tokens are ignored.

        Arguments:
            attention_mask (:obj:`torch.Tensor`):
                Mask with ones indicating tokens to attend to, zeros for tokens to ignore.
            input_shape (:obj:`Tuple[int]`):
                The shape of the input to the model.
            device: (:obj:`torch.device`):
                The device of the input to the model.

        Returns:
            :obj:`torch.Tensor` The extended attention mask, with a the same dtype as :obj:`attention_mask.dtype`.
        """
        # We can provide a self-attention mask of dimensions [batch_size, from_seq_length, to_seq_length]
        # ourselves in which case we just need to make it broadcastable to all heads.
        if attention_mask.dim() == 3:
            extended_attention_mask = attention_mask[:, None, :, :]
        elif attention_mask.dim() == 2:
            # Provided a padding mask of dimensions [batch_size, seq_length]
            # - if the model is a decoder, apply a causal mask in addition to the padding mask
            # - if the model is an encoder, make the mask broadcastable to [batch_size, num_heads, seq_length, seq_length]
            if is_causal:
                batch_size, seq_length = input_shape
                seq_ids = torch.arange(seq_length, device=device)
                causal_mask = seq_ids[None, None, :].repeat(batch_size, seq_length, 1) <= seq_ids[None, :, None]
                # in case past_key_values are used we need to add a prefix ones mask to the causal mask
                # causal and attention masks must have same type with pytorch version < 1.3
                causal_mask = causal_mask.to(attention_mask.dtype)

                if causal_mask.shape[1] < attention_mask.shape[1]:
                    prefix_seq_len = attention_mask.shape[1] - causal_mask.shape[1]
                    # causal_mask = torch.cat(
                    #     [
                    #         torch.ones(
                    #             (batch_size, seq_length, prefix_seq_len), device=device, dtype=causal_mask.dtype
                    #         ),
                    #         causal_mask,
                    #     ],
                    #     axis=-1,
                    # )

                    causal_mask = torch.cat(
                        [
                            causal_mask,
                            torch.zeros(
                                (batch_size, seq_length, prefix_seq_len), device=device, dtype=causal_mask.dtype
                            ),
                        ],
                        axis=-1,
                    )

                extended_attention_mask = causal_mask[:, None, :, :] * attention_mask[:, None, None, :]
            else:
                extended_attention_mask = attention_mask[:, None, None, :]
        else:
            raise ValueError(
                "Wrong shape for input_ids (shape {}) or attention_mask (shape {})".format(
                    input_shape, attention_mask.shape
                )
            )

        # Since attention_mask is 1.0 for positions we want to attend and 0.0 for
        # masked positions, this operation will create a tensor which is 0.0 for
        # positions we want to attend and -10000.0 for masked positions.
        # Since we are adding it to the raw scores before the softmax, this is
        # effectively the same as removing these entirely.
        # extended_attention_mask = extended_attention_mask.to(dtype=attention_mask.dtype)  # fp16 compatibility
        extended_attention_mask = (1.0 - extended_attention_mask) * -10000.0
        return extended_attention_mask

class SeqVAE(nn.Module):
    def __init__(self, config):
        super().__init__()
        self.config = config
        self.encoder_embedding = SeqBertEmbeddings(config.encoder)
        self.encoder = BertEncoder(config.encoder)

        #--------------------------VAE-------------------------------
        # encoder
        self.enc = nn.Sequential(
            nn.Linear(self.encoder.config.hidden_size, seq_hidden_encode_dim),
            nn.ReLU())
        self.enc_mean = nn.Linear(seq_hidden_encode_dim, seq_hidden_dim)
        self.enc_std = nn.Sequential(
            nn.Linear(seq_hidden_encode_dim, seq_hidden_dim),
            nn.Softplus())

        # prior
        self.prior = nn.Sequential(
            nn.Linear(self.encoder.config.hidden_size, seq_hidden_encode_dim),
            nn.ReLU())
        self.prior_mean = nn.Linear(seq_hidden_encode_dim, seq_hidden_dim)
        self.prior_std = nn.Sequential(
            nn.Linear(seq_hidden_encode_dim, seq_hidden_dim),
            nn.Softplus())

        # decoder
        self.dec = nn.Sequential(
            nn.Linear(seq_hidden_dim, seq_hidden_encode_dim),
            nn.ReLU(),
            nn.Linear(seq_hidden_encode_dim, self.encoder.config.hidden_size),
            nn.ReLU(),
        )

        #----------------------------------------------------------

        self.decoder_embedding = SeqBertEmbeddings(config.decoder)
        self.decoder = BertEncoder(config.decoder)

        self.linear = nn.Sequential(
            nn.Linear(config.decoder.hidden_size, 128),
            nn.ReLU(),
            nn.Linear(128, config.decoder.input_dim),
        )


    def forward(self, encoder_mov, decoder_mov,
                input_attention_mask=None,
                output_attention_mask=None,
                cross_attention_mask=None
                ):
        '''
        :param encoder_mov: B x L x N_ movement [1-T]
        :param decoder_mov: B x L x N_ movement [0-(T-1)]
        :return:
        '''
        input_shape = encoder_mov.size()[:-1]
        device = encoder_mov.device

        input_embedding = self.encoder_embedding(encoder_mov) # [B, L ,N]

        if input_attention_mask is None:
            input_attention_mask = torch.ones(input_shape, device=device)

        # [B,None,L,L]
        extended_attention_mask = self.get_extended_attention_mask(attention_mask=input_attention_mask,
                                                                   input_shape=input_shape,
                                                                   device=device
                                                                   )

        input_encoded = self.encoder(input_embedding,
                                     attention_mask=extended_attention_mask,
                                     encoder_hidden_states=None,
                                     encoder_attention_mask=None,
                                     )[0] #([B, L ,N])


        #----------------------------------------VAE part---------------------------
        # encoder
        enc_t = self.enc(input_encoded)
        enc_mean_t = self.enc_mean(enc_t)
        enc_std_t = self.enc_std(enc_t)

        pad_zero = torch.zeros((input_encoded.size()[0], 1, input_encoded.size()[2]),
                               device=input_encoded.device, dtype=input_encoded.dtype)

        input_encoded_pad_zero = torch.cat([pad_zero, input_encoded.data], dim=1)

        # prior
        prior_t = self.prior(input_encoded_pad_zero[:, :-1, :])
        prior_mean_t = self.prior_mean(prior_t)
        prior_std_t = self.prior_std(prior_t)

        # sampling and reparameterization
        #z_t = self._reparameterized_sample(enc_mean_t, enc_std_t)
        z_t = self._reparameterized_sample(prior_mean_t, prior_std_t)

        phi_z_t = self.dec(z_t)

        #---------------------------------------------------------------------------



        output_shape = decoder_mov.size()[:-1]

        output_embedding = self.decoder_embedding(decoder_mov)# [B, L ,N]

        if output_attention_mask is None:
            output_attention_mask = torch.ones(output_shape, device=device)

        out_extended_attention_mask = self.get_extended_attention_mask(attention_mask=output_attention_mask,
                                                                   input_shape=output_shape,
                                                                   device=device
                                                                   )

        if cross_attention_mask is None:
            cross_attention_mask = torch.ones(input_shape, device=device)

        cross_extended_attention_mask = self.get_extended_attention_mask(attention_mask=cross_attention_mask,
                                                                       input_shape=output_shape,
                                                                       device=device
                                                                       )

        output_encoded = self.decoder(output_embedding,
                                      attention_mask=out_extended_attention_mask,
                                      encoder_hidden_states=phi_z_t,
                                      encoder_attention_mask=cross_extended_attention_mask
                                      ) #([B, L ,N])

        output = self.linear(output_encoded[0])

        # print("extended_attention_mask", extended_attention_mask.shape)
        # print("out_extended_attention_mask", out_extended_attention_mask.shape)
        # print("cross_extended_attention_mask", cross_extended_attention_mask.shape)

        return output, (prior_mean_t, prior_std_t, enc_mean_t, enc_std_t)

    def get_extended_attention_mask(self, attention_mask, input_shape, device, is_causal=True):
        """
        Makes broadcastable attention and causal masks so that future and masked tokens are ignored.

        Arguments:
            attention_mask (:obj:`torch.Tensor`):
                Mask with ones indicating tokens to attend to, zeros for tokens to ignore.
            input_shape (:obj:`Tuple[int]`):
                The shape of the input to the model.
            device: (:obj:`torch.device`):
                The device of the input to the model.

        Returns:
            :obj:`torch.Tensor` The extended attention mask, with a the same dtype as :obj:`attention_mask.dtype`.
        """
        # We can provide a self-attention mask of dimensions [batch_size, from_seq_length, to_seq_length]
        # ourselves in which case we just need to make it broadcastable to all heads.
        if attention_mask.dim() == 3:
            extended_attention_mask = attention_mask[:, None, :, :]
        elif attention_mask.dim() == 2:
            # Provided a padding mask of dimensions [batch_size, seq_length]
            # - if the model is a decoder, apply a causal mask in addition to the padding mask
            # - if the model is an encoder, make the mask broadcastable to [batch_size, num_heads, seq_length, seq_length]
            if is_causal:
                batch_size, seq_length = input_shape
                seq_ids = torch.arange(seq_length, device=device)
                causal_mask = seq_ids[None, None, :].repeat(batch_size, seq_length, 1) <= seq_ids[None, :, None]
                # in case past_key_values are used we need to add a prefix ones mask to the causal mask
                # causal and attention masks must have same type with pytorch version < 1.3
                causal_mask = causal_mask.to(attention_mask.dtype)

                if causal_mask.shape[1] < attention_mask.shape[1]:
                    prefix_seq_len = attention_mask.shape[1] - causal_mask.shape[1]
                    # causal_mask = torch.cat(
                    #     [
                    #         torch.ones(
                    #             (batch_size, seq_length, prefix_seq_len), device=device, dtype=causal_mask.dtype
                    #         ),
                    #         causal_mask,
                    #     ],
                    #     axis=-1,
                    # )

                    causal_mask = torch.cat(
                        [
                            causal_mask,
                            torch.zeros(
                                (batch_size, seq_length, prefix_seq_len), device=device, dtype=causal_mask.dtype
                            ),
                        ],
                        axis=-1,
                    )

                extended_attention_mask = causal_mask[:, None, :, :] * attention_mask[:, None, None, :]
            else:
                extended_attention_mask = attention_mask[:, None, None, :]
        else:
            raise ValueError(
                "Wrong shape for input_ids (shape {}) or attention_mask (shape {})".format(
                    input_shape, attention_mask.shape
                )
            )

        # Since attention_mask is 1.0 for positions we want to attend and 0.0 for
        # masked positions, this operation will create a tensor which is 0.0 for
        # positions we want to attend and -10000.0 for masked positions.
        # Since we are adding it to the raw scores before the softmax, this is
        # effectively the same as removing these entirely.
        # extended_attention_mask = extended_attention_mask.to(dtype=attention_mask.dtype)  # fp16 compatibility
        extended_attention_mask = (1.0 - extended_attention_mask) * -10000.0
        return extended_attention_mask

    def _reparameterized_sample(self, mean, std):
        """using std to sample"""
        eps = torch.FloatTensor(std.size()).normal_()
        eps = nn.Parameter(eps, requires_grad=False).to(mean.device)
        return eps * std + mean

def calculate_kld_gauss(mean_1, std_1, mean_2, std_2, mask):
    """Using std to compute KLD"""

    kld_element = (2 * torch.log(std_2) - 2 * torch.log(std_1) +
                   (std_1.pow(2) + (mean_1 - mean_2).pow(2)) /
                   std_2.pow(2) - 1)
    return torch.mean(0.5 * torch.sum(kld_element, dim=-1) * mask)

def calculate_mse_loss(pred_x, ori_x, mask, weight=None):
    """calculate mean square error for reconstruction"""
    '''
    pred_x: predicted value
    ori_x: ground_truth
    mask: mask/weight
    weight: [Batch x Length x Dim]
    '''
    if weight is None:
        weight = torch.ones_like(pred_x)

    #print("Transformer", pred_x.shape)
    batch_seq_mse = torch.sum((pred_x - ori_x)**2 * weight, dim=-1) * mask

    return torch.mean(batch_seq_mse)

def build_seq_transformer(input_dim:int):
    '''
    Help build Transformer
    :param input_dim: dimension of joint data
    :return: a encoder-decoder model
    '''
    config_encoder = BertConfig()
    config_decoder = BertConfig()
    config = EncoderDecoderConfig.from_encoder_decoder_configs(config_encoder, config_decoder)
    config.encoder.update({"input_dim": input_dim})
    config.decoder.update({"input_dim": input_dim})

    return SeqEncoderDecoder(config)

def build_seq_vae(input_dim:int, num_hidden_layer=2):
    '''
    Help build Transformer VAE
    :param input_dim: dimension of joint data
    :return: a encoder-decoder model
    '''
    config_encoder = BertConfig()
    config_encoder.num_hidden_layers = num_hidden_layer
    config_encoder.num_attention_heads = seq_num_attention_heads
    config_encoder.hidden_size = seq_num_attention_heads * seq_hidden_encode_dim

    #config_decoder = BertConfig()
    #config_decoder.num_hidden_layers = num_hidden_layer

    config = EncoderDecoderConfig.from_encoder_decoder_configs(config_encoder, config_encoder)
    config.encoder.update({"input_dim": input_dim})
    config.decoder.update({"input_dim": input_dim})

    return SeqVAE(config)

if __name__ == "__main__":
    #unit test

    #test 1: embedding
    # config = BertConfig()
    # input_dim = 66 * 3
    # config.update({"input_dim": input_dim})
    #
    # sbe = SeqBertEmbeddings(config)
    # a_input = torch.randn(5, 15, input_dim) #B x L x H
    # # b_input = torch.tensor([[  101,  7592,  1010,  2026,  3899,  2003, 10140,   102],
    # #     [  101,  7592,  1010,  2026,  3899,  2003, 10140,   102]])
    #
    # print(sbe(a_input).shape)

    # Train

    import numpy as np
    from datetime import datetime
    from tqdm.auto import tqdm
    from torch.utils.tensorboard import SummaryWriter

    #Record hyper parameters
    date_time_start = datetime.now().strftime("%Y_%m_%d_%H_%M_%S")
    print("date and time:", date_time_start)

    writer = SummaryWriter("runs/" + date_time_start)
    input_dim = 198
    batch_size = 16

    notice = "This is model that get sampled from prior with teaching force."

    params_dict = {
        "joint_input_dim": input_dim,
        "seq_hidden_encode_dim": seq_hidden_encode_dim,
        "seq_hidden_dim": seq_hidden_dim,
        "seq_num_attention_heads": seq_num_attention_heads,
        "batch_size": batch_size,
        "notice": notice
    }
    writer.add_hparams(params_dict, {})

    #build model
    model = build_seq_vae(input_dim, num_hidden_layer=2)

    # calculate number of parameters
    model_parameters = filter(lambda p: p.requires_grad, model.parameters())
    params = sum([np.prod(p.size()) for p in model_parameters])
    print("Total number of parameters:", params)

    #load data
    from MotionGPT import *
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")  # device
    loader = FBXDataLoader("FBXDataStand/", has_translate=True)
    loader.LoadData()

    # print(len(loader.raw_data), len(loader.raw_data[0]), len(loader.raw_data[0][0]), len(loader.raw_data[0][0][0]))
    print("translate offset:", loader.translate_scale)
    loader.PrepareTrainingData(training_joint_index=[i for i in range(len(G_MIXAMO_JOINTS))])

    #print(len(loader.all_data), len(loader.all_data[0]), len(loader.all_data[0][0]))
    #print(len(loader.all_data), len(loader.all_data[-1]), len(loader.all_data[-1][0]))

    # build model for training
    if torch.cuda.is_available():
        model = model.cuda()

    optim = torch.optim.Adam(model.parameters(), lr=1e-3)

    #Train start
    epochs = 10
    for epoch in tqdm(range(epochs)):
        model.train()
        loss_epoch_mse_train = []
        loss_epoch_kld_train = []
        for batch_x, batch_mask in loader.next_batch(batch_size=batch_size):
            if len(batch_x[0]) < 2:
                continue

            batch_x = batch_x.to(device)
            batch_mask = batch_mask.to(device)

            batch_x_decoder_input = batch_x[:, 1:, :]  # Batch x (Length - 1) x Dim
            batch_x_encoder_input = batch_x[:, :-1, :]  # Batch x (Length - 1) x Dim

            batch_mask_encoder_input = batch_mask[:, 1:]  # Batch x (Length - 1)

            batch_output, gaussian_params = model(batch_x_encoder_input, batch_x_decoder_input)

            mse_loss = calculate_mse_loss(batch_output, batch_x_decoder_input, batch_mask_encoder_input)

            kld_loss = calculate_kld_gauss(*gaussian_params, batch_mask_encoder_input)

            total_loss = mse_loss + kld_loss

            optim.zero_grad()
            total_loss.backward()
            optim.step()

            loss_epoch_mse_train.append(mse_loss.item())
            loss_epoch_kld_train.append(kld_loss.item())

        mean_mse_loss = np.mean(loss_epoch_mse_train)
        mean_kld_loss = np.mean(loss_epoch_kld_train)
        print("Epoch {} MSE {:.3f} KLD {:.3f}".format(epoch, mean_mse_loss, mean_kld_loss))
        writer.add_scalar('MSE Train loss', mean_mse_loss, epoch)
        writer.add_scalar('KL Train loss', mean_kld_loss, epoch)

        model.eval()
        loss_epoch_mse_test = []
        loss_epoch_kld_test = []
        for batch_x, batch_mask in loader.next_batch(batch_size=batch_size, train_mode=False):
            if len(batch_x[0]) < 2:
                continue

            batch_x = batch_x.to(device)
            batch_mask = batch_mask.to(device)

            batch_x_decoder_input = batch_x[:, 1:, :]  # Batch x (Length - 1) x Dim
            batch_x_encoder_input = batch_x[:, :-1, :]  # Batch x (Length - 1) x Dim

            batch_mask_encoder_input = batch_mask[:, 1:]  # Batch x (Length - 1)

            batch_output, gaussian_params = model(batch_x_encoder_input, batch_x_decoder_input)

            mse_loss = calculate_mse_loss(batch_output, batch_x_decoder_input, batch_mask_encoder_input)

            kld_loss = calculate_kld_gauss(*gaussian_params, batch_mask_encoder_input)

            loss_epoch_mse_test.append(mse_loss.item())
            loss_epoch_kld_test.append(kld_loss.item())

        mean_mse_loss = np.mean(loss_epoch_mse_test)
        mean_kld_loss = np.mean(loss_epoch_kld_test)
        print("Test {} MSE {:.3f} KLD {:.3f}".format(epoch, mean_mse_loss, mean_kld_loss))
        writer.add_scalar('MSE Test loss', mean_mse_loss, epoch)
        writer.add_scalar('KL Test loss', mean_kld_loss, epoch)



    #Close and save

    writer.close()
    torch.save(model, "record/" + date_time_start + ".pt")

    date_time_end = datetime.now().strftime("%Y_%m_%d_%H_%M_%S")
    print("date and time:", date_time_start)
