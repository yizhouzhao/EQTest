from MotionGPT import *
from Params import *
from VRNN import *

from datetime import datetime
from torch.utils.tensorboard import SummaryWriter


if __name__ == "__main__":
    now = datetime.now()
    date_time = now.strftime("%Y_%m_%d_%H_%M_%S" + "_nr")
    print("date and time:", date_time)

    writer = SummaryWriter("runs/" + date_time)

    loader = FBXDataLoader(data_file, radian=radian, has_translate=consider_root_translate) #has_finger=consider_finger
    loader.LoadData()
    loader.PrepareTrainingData(training_joint_index=[i for i in range(len(G_MIXAMO_JOINTS))], frame_gap=frame_gap)

    params_dict = {
        "data file": data_file,
        "radian or degree": "radian" if radian else "degree",
        "frame interval": frame_gap,
        "all data num": len(loader),
        "hidden dim": h_dim,
        "z dim": z_dim,
        "n layers": n_layers,
        "batch size": batch_size,
        "n_epochs": n_epochs,
        "gradient clip": clip,
        "learning_rate": learning_rate,
        "print_every": print_every,
        "consider_root_translate": consider_root_translate,
        "consider_finger": consider_finger
    }

    writer.add_hparams(params_dict, {})

    input_dim = len(loader.train_data[0][1])
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")  # device

    print("Training data dim:", input_dim)
    print("Training on device: ", device)
    #Build model
    model = VRNN(input_dim, h_dim, z_dim, n_layers, device)
    model.to(device)
    optimizer = torch.optim.Adam(model.parameters(), lr=learning_rate)

    kld_loss_list = []
    mse_loss_list = []

    #Train
    for epoch in range(n_epochs):
        batch_idx = 0
        model.train()
        for batch_data, pad_data in loader.next_batch(batch_size, batch_first=False):
            batch_idx += 1

            batch_data = batch_data.to(device)
            pad_data = pad_data.to(device)

            optimizer.zero_grad()

            kld_loss, mse_loss, _, _ = model(batch_data, pad_data)
            kld_loss = kld_loss / len(pad_data)
            mse_loss = mse_loss / len(pad_data)

            #print(torch.sum(pad_data))
            #print(torch.sum(pad_data))

            loss = kld_loss + mse_loss
            loss.backward()

            # grad norm clipping, only in pytorch version >= 1.10
            torch.nn.utils.clip_grad_norm_(model.parameters(), clip)
            optimizer.step()

            kld_loss_list.append(kld_loss.data)
            mse_loss_list.append(mse_loss.data)

            if len(kld_loss_list) > 10:
                kld_loss_list.pop(0)

            if len(mse_loss_list) > 10:
                mse_loss_list.pop(0)


            # printing
            if batch_idx % print_every == 0:
                print('Train Epoch: {} [{}/{} ({:.0f}%)]\t KLD Loss: {:.6f} \t NLL Loss: {:.6f}'.format(
                    epoch, batch_idx * len(batch_data), len(loader.train_data),
                       100. * batch_idx / (len(loader.train_data) // batch_size),
                       kld_loss.data,
                       mse_loss.data))

                #print(torch.sum(pad_data).data)

        writer.add_scalar('kld_loss loss',
                          sum(kld_loss_list) / len(kld_loss_list),
                          epoch) #* len(loader.train_data) // batch_size + batch_idx

        writer.add_scalar('mse_loss loss',
                          sum(mse_loss_list) / len(mse_loss_list),
                          epoch)


        #test
        model.eval()
        test_kld_loss_list = []
        test_mse_loss_list = []

        for batch_data, pad_data in loader.next_batch(batch_size, train_mode=False):
            batch_data = batch_data.to(device)
            pad_data = pad_data.to(device)

            kld_loss, mse_loss, _, _ = model(batch_data, pad_data)
            kld_loss = kld_loss / torch.sum(pad_data)
            mse_loss = mse_loss / torch.sum(pad_data)

            test_kld_loss_list.append(kld_loss.data)
            test_mse_loss_list.append(mse_loss.data)

        # for i in range(len(loader.test_data)):
        #     test_sample = torch.FloatTensor(loader.test_data[i])
        #     test_sample = test_sample.unsqueeze(1)
        #     test_sample_mask = torch.LongTensor([[1]]*test_sample.size(0))
        #
        #     batch_data = test_sample.to(device)
        #     batch_mask = test_sample_mask.to(device)
        #
        #
        #     kld_loss, mse_loss, _, _ = model(batch_data, batch_mask)
        #
        #     test_kld_loss_list.append(kld_loss.data / len(test_sample))
        #     test_mse_loss_list.append(mse_loss.data / len(test_sample))


        writer.add_scalar('test kld_loss loss',
                          sum(test_kld_loss_list) / len(test_kld_loss_list),
                          epoch)

        writer.add_scalar('test mse_loss loss',
                          sum(test_mse_loss_list) / len(test_mse_loss_list),
                          epoch)

    #save model
    writer.close()
    torch.save(model, "runs/" + date_time + ".pth")

    date_time = now.strftime("%Y_%m_%d_%H_%M_%S" + "_nr")
    print("date and time:", date_time)