from DataAPI import *

import os
from tqdm.auto import tqdm
import numpy as np
import random
import copy

import torch
from torch.utils.data.dataset import Dataset

G_MIXAMO_JOINTS = ['Hips', 'Spine', 'Spine1', 'Spine2', 'Neck', #0
     'Head', 'HeadTop_End', 'LeftShoulder', 'LeftArm', 'LeftForeArm', 'LeftHand', #5
     'LeftHandThumb1', 'LeftHandThumb2', 'LeftHandThumb3', 'LeftHandThumb4', #11
     'LeftHandIndex1', 'LeftHandIndex2', 'LeftHandIndex3', 'LeftHandIndex4', #15
     'LeftHandMiddle1', 'LeftHandMiddle2', 'LeftHandMiddle3', 'LeftHandMiddle4', #19
     'LeftHandRing1', 'LeftHandRing2', 'LeftHandRing3', 'LeftHandRing4', #23
     'LeftHandPinky1', 'LeftHandPinky2', 'LeftHandPinky3', 'LeftHandPinky4', #27
     'RightShoulder', 'RightArm', 'RightForeArm', 'RightHand', #31
     'RightHandThumb1', 'RightHandThumb2', 'RightHandThumb3', 'RightHandThumb4', #35
     'RightHandIndex1', 'RightHandIndex2', 'RightHandIndex3', 'RightHandIndex4', #39
     'RightHandMiddle1', 'RightHandMiddle2', 'RightHandMiddle3', 'RightHandMiddle4', #43
     'RightHandRing1', 'RightHandRing2', 'RightHandRing3', 'RightHandRing4', #47
     'RightHandPinky1', 'RightHandPinky2', 'RightHandPinky3', 'RightHandPinky4', #51
     'LeftUpLeg', 'LeftLeg', 'LeftFoot', 'LeftToeBase', 'LeftToe_End', 'RightUpLeg', #55
     'RightLeg', 'RightFoot', 'RightToeBase', 'RightToe_End'] #62

G_TRAINING_JOINTS_INDEX = [0, 1, 2, 3, 4, 7, 8, 9, 10, 31, 32, 33, 34, 55, 56, 57, 58, 61, 62, 63, 64]

class FBXDataMaker():
    def __init__(self):
        self.mc = MayaController()
        self.namespace = None
        self.fbx_folder = None
        self.fbx_name_list = []

    def LoadFBXModelNames(self, folder: str):
        '''
        Load fbx model names
        :param folder:
        :return:
        '''
        self.fbx_folder = folder
        for file_name in os.listdir(folder):
            self.fbx_name_list.append(file_name)

    def FBXLoaderForMAYA(self, fbx_file_name: str):
        '''
        :param fbx_file_name: FBX file name
        :return:
        '''
        send_message  = "FBXImport -file \"" + fbx_file_name + "\";"
        recv_message = self.mc.SendCommand(send_message)
        print("MotionGPT:", recv_message)


    def GetModelNameSpace(self):
        '''
        Get the namespace or model rigs
        :return:
        '''
        scene_objects = self.mc.GetAllObjects()
        for obj in scene_objects:
            if obj.startswith("mixamo"):
                self.namespace = obj.split(":")[0]
                return


    def WriteOneFrame(self, file_name):
        '''
        write the joint information at one frame to file
        :param file_name: write file name
        :return:
        '''
        with open(file_name, "w") as f:
            for i in range(len(G_MIXAMO_JOINTS)):
                joint = self.namespace + ":" + G_MIXAMO_JOINTS[i]
                translate = self.mc.GetObjectWorldTransform(joint)
                rotation = self.mc.GetObjectLocalRoation(joint)

                f.write(str(i) + " " + str(translate[0]) + " " + str(translate[1]) + " " + str(translate[2]))
                f.write(" " + str(rotation[0]) + " " + str(rotation[1]) + " " + str(rotation[2]) + "\n")

            f.close()

    def WriteOneFBX(self, folder_name: str):
        '''
        write joint information for all fbx
        :param folder_name: folder to write files
        :return:
        '''
        time_range = self.mc.GetTimeSliderRange()
        for i in range(time_range[0], time_range[1]):
            file_name = folder_name + "/" + str(i) + ".txt"
            self.mc.SetCurrentTimeFrame(i)
            self.WriteOneFrame(file_name)

    def WriteAllFBX(self, root_folder_name: str):
        '''
        :param root_folder_name: root folder to save all animations
        :return:
        '''

        for fbx_model in tqdm(self.fbx_name_list):
            self.mc.SetNewScene()
            self.FBXLoaderForMAYA(self.fbx_folder + "/" + fbx_model)
            self.GetModelNameSpace()

            folder_name = root_folder_name + "/" + fbx_model.split(".")[0]
            print(folder_name)
            os.mkdir(folder_name)
            self.WriteOneFBX(folder_name)


class FBXDataLoader():
    def __init__(self, root_folder: str, relative=False):
        '''
        FBX data loader
        :param root_folder: root folder for fbx file
        :param relative: absolute value of difference(joint rotation and transform)
        '''
        self.root_folder = root_folder
        self.relative = relative
        self.raw_data = []

        self.all_data = []
        self.train_data = []
        self.test_data = []

    def LoadData(self):
        '''
        Load raw data from root folder
        :return:
        '''
        print("FBXDataLoader loading data...")
        for fbx_file_name in tqdm(os.listdir(self.root_folder)):
            fbx_file_folder = self.root_folder + "/" + fbx_file_name
            fbx_data = []
            for fbx_frame_file_idx in range(len(os.listdir(fbx_file_folder))):
                fbx_frame_file = str(fbx_frame_file_idx) + ".txt"
                frame_data = []
                with open(fbx_file_folder + "/" + fbx_frame_file, "r") as f:
                    for line in f.readlines():
                        line = line.strip()
                        joint_id, translateX, translateY, translateZ, rotateX, rotateY, rotateZ = line.split(" ")
                        joint_data = [translateX, translateY, translateZ, rotateX, rotateY, rotateZ]
                        joint_data = [float(_) for _ in joint_data]
                        frame_data.append(joint_data)
                    f.close()
                fbx_data.append(frame_data)
            self.raw_data.append(fbx_data)



    def PrepareTrainingData(self, frame_gap = 12):
        '''
        Prepare training data
        :param frame_gap: 帧差
        :return:
        '''
        for i in tqdm(range(len(self.raw_data))):
            fbx_data = self.raw_data[i]
            for j in range(frame_gap):
                frame_sequence = []
                original_position = [0.0, 0.0, 0.0] #set the original position
                original_rotation = [0.0, 0.0, 0.0]  # set the original position
                for k in range(j, len(fbx_data), frame_gap):
                    one_frame = fbx_data[k]
                    one_frame_data = []
                    for idx in G_TRAINING_JOINTS_INDEX:
                        if idx == 0:
                            if k == j: #first frame put origin to zero
                                original_position[0] = one_frame[idx][0]
                                original_position[1] = one_frame[idx][1]
                                original_position[2] = one_frame[idx][2]

                                one_frame_data.append(0.0)
                                one_frame_data.append(0.0)
                                one_frame_data.append(0.0)

                                one_frame_data.append(one_frame[idx][3])
                                one_frame_data.append(one_frame[idx][4])
                                one_frame_data.append(one_frame[idx][5])
                            else:
                                one_frame_data.append(one_frame[idx][0] - original_position[0])
                                one_frame_data.append(one_frame[idx][1] - original_position[1])
                                one_frame_data.append(one_frame[idx][2] - original_position[2])

                                one_frame_data.append(one_frame[idx][3])
                                one_frame_data.append(one_frame[idx][4])
                                one_frame_data.append(one_frame[idx][5])

                                if self.relative:
                                    original_position[0] = one_frame[idx][0]
                                    original_position[1] = one_frame[idx][1]
                                    original_position[2] = one_frame[idx][2]
                        else:
                            one_frame_data.append(one_frame[idx][3])
                            one_frame_data.append(one_frame[idx][4])
                            one_frame_data.append(one_frame[idx][5])
                    frame_sequence.append(one_frame_data)

                if len(frame_sequence) >= 2:
                    #frame_sequence = np.asarray(frame_sequence)
                    self.all_data.append(frame_sequence)

        #cannot get numpy array because it is of different length
        #self.train_data = np.asarray(self.train_data)
        random.shuffle(self.all_data)
        train_sample_num = int(0.8 * len(self))

        self.train_data = self.all_data[:train_sample_num]
        self.test_data = self.all_data[train_sample_num:]

    def next_batch(self, batch_size=16, return_tensor=True):
        input_dim = len(self.train_data[0][0])
        for i in range(0, len(self.train_data), batch_size):
            #print("i", i)
            end_index = min(len(self.train_data), i + batch_size)
            batch_data = copy.deepcopy(self.train_data[i: end_index])
            pad_data = []

            max_length = max([len(_) for _ in batch_data])
            #print("max", max_length)
            for j in range(len(batch_data)):
                pad_data.append([1] * len(batch_data[j]) + [0] * (max_length - len(batch_data[j])))
                #print(pad_data[-1])
                padding = (max_length - len(batch_data[j]))*[[0.0]*input_dim]
                #print(len(batch_data[j]))
                batch_data[j] += padding


            yield torch.FloatTensor(batch_data), torch.LongTensor(pad_data)

    def __len__(self):
        return len(self.all_data)

    def __getitem__(self, idx):
        return self.all_data[idx]










