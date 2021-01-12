# load survey from record
from MotionGPT import *
from Params import *
from VRNN import *
from Raven.BuildTree2 import *

import torch
import numpy as np

def load_survey(label_path):
    survey = []
    with open(label_path, "r") as f:
        for c, line in enumerate(f.readlines()):
            line_info = line.strip().split(",")
            # print(c)
            sample_info = line_info[0].split("_")
            # print(sample_info)
            if len(sample_info) < 8:
                continue
            item = {"m1": sample_info[0], "e11": sample_info[1], "e12": sample_info[2],
                    "m2": sample_info[3], "e21": sample_info[4], "e22": sample_info[5],
                    "d": sample_info[6], "t": sample_info[7]}
            label_info = line_info[1].split("_")
            item["quality"] = label_info[0]
            item["dominance"] = label_info[1]
            item["intimacy"] = label_info[2]

            survey.append(item)

    return survey

class AnimationSampler():
    def __init__(self):
        #load
        self.loader = None
        self.get_loader()

        #set device
        self.device = torch.device("cpu")  # device

        #model
        self.model = None
        self.get_model()

        #survey
        self.survey = None
        self.get_survey()

        # scene parse graph (pg)
        self.scene = build_scene()

        # training
        self.lr = 0.1 # learning rate
        self.thetas = None # energy parameters


    def get_loader(self, path="FBXDataStand//"):
        loader = FBXDataLoader(path, has_translate=True)
        loader.LoadData()
        loader.PrepareTrainingData(training_joint_index=[i for i in range(len(G_MIXAMO_JOINTS))])

        self.loader = loader

    def get_model(self, path=""):
        input_dim = len(self.loader.train_data[0][1])
        self.model = VRNN(input_dim, h_dim, z_dim, n_layers, self.device)

    def get_survey(self):
        survey = load_survey("../data/label2.txt")
        survey2 = load_survey("../data/label2_12_8.csv")
        self.survey = survey + survey2

    def find_motion_encode(self, motion_name):
        motion_tensor, pad_tensor = self.loader.get_sample_from_name(motion_name)
        kld_loss, mse_loss, (all_enc_mean, all_enc_std), (all_dec_mean, all_dec_std) = self.model(motion_tensor, pad_tensor)
        return all_enc_mean[-1].data.numpy()

    def train_parameters(self, iterations=100):
        thetas = torch.randn(7)
        for i in range(iterations):
            while True:
                expert_sample = np.random.choice(self.survey)
                if expert_sample['quality'] == "Good":
                    break

            pg = self.scene.sample()
            s_pg = torch.Tensor(get_pg_score_list(pg))
            s_survey = torch.Tensor(get_survey_score_list(expert_sample))
            thetas = thetas + self.lr * (s_pg - s_survey)

        self.thetas = thetas

    def get_survey_item_score(self, survey_item):
        return np.sum(self.thetas.data.numpy() * get_survey_score_list(survey_item))





