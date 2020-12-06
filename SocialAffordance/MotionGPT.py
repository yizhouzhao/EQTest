from DataAPI import *
from Params import frame_gap, fix_translate_scale, G_MIXAMO_JOINTS, \
    G_TRAINING_JOINTS_INDEX, G_TRAINING_FINGERS_INDEX, G_INTEACT_KEY_WORDS

import os
from tqdm.auto import tqdm
import numpy as np
import random
import copy

import pandas as pd
from sklearn.decomposition import PCA
import torch
from torch.utils.data.dataset import Dataset

# Blend Faces
def BF_ListToJson(data):
    return {"Morpher":
        {"Blink": data[0]
        ,"EyelidUp": data[1]
        ,"A": data[2]
        ,"E": data[3]
        ,"O": data[4]
        ,"MouthOpen": data[5]
        ,"FV": data[6]
        ,"M": data[7]
        ,"MouthUp": data[8]
        ,"MouthWide": data[9]
        ,"MouthWide2": data[10]
        ,"MouthDown": data[11]
        ,"MouthOneSideUp": data[12]
        ,"EyebrowInDown": data[13]
        ,"EyebrowOutDown": data[14]
        ,"EyebrowUp": data[15]
        ,"EyebrowSwag": data[16]
        }
    }


class FBXDataMaker():
    def __init__(self, PORT=12345, radian=True, has_translate=True, has_finger=True):
        self.mc = MayaController(PORT=PORT)
        self.namespace = None
        self.namespace_symbol = ":"
        self.fbx_folder = None
        self.fbx_name_list = []

        self.has_translate = has_translate
        self.has_finger = has_finger
        self.radian = radian

        self.model = None #model

        self.root_translate0 = [0.0,0.0,0.0] # original position of
        self.translate_scale = 1.0 #model scale

        # data loader
        self.loader: FBXDataLoader = None
        self.keyword2index = {}

        # sceen shots
        self.sceenshots_folder = "E:/researches/EQTest/SocialAffordance/sceenshots"
        self.camera_list = ["camera1", "camera2"]
        self.image_sizes = [[512, 1024], [1024, 1024]]

        # emtion pca
        self.lstsq_result = None
        self.pca_components = None
        self.emotion2vad = {}


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
                joint = self.namespace + self.namespace_symbol + G_MIXAMO_JOINTS[i]
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

    def GetTranslateScale(self):
        hip1 = self.namespace + self.namespace_symbol + "Hips"
        print(hip1)
        hip1_translate = self.mc.GetObjectWorldTransform(hip1)

        spine1 = self.namespace + self.namespace_symbol + "Spine"
        spine1_translate = self.mc.GetObjectWorldTransform(spine1)

        scale1 = np.sqrt((hip1_translate[0] - spine1_translate[0]) ** 2 +
                         (hip1_translate[1] - spine1_translate[1]) ** 2 +
                         (hip1_translate[2] - spine1_translate[2]) ** 2)

        local_scale1 = self.mc.GetObjectAttribute(self.namespace + self.namespace_symbol + "FitSkeleton", "scaleX")

        self.translate_scale = scale1 / local_scale1[0]
        print("scale: ", self.translate_scale)

    def LoadModel(self, model_path: str):
        self.model = torch.load(model_path)
        self.model.eval()

    # ---------------------------Set-------------------------------
    def SetLoader(self, loader):
        self.loader = loader
        for keyword in G_INTEACT_KEY_WORDS:
            self.keyword2index[keyword] = []
            for i in range(len(loader.all_files) // 2): #only generate left side
                if keyword in loader.all_files[i]:
                    self.keyword2index[keyword].append(i)

    def SetSceneByKeyWord(self, word):
        #sample_idx1 = np.random.choice(self.keyword2index[word])
        sample_idx1 = self.keyword2index[word][0]

        sample1 = torch.FloatTensor(self.loader.all_data[sample_idx1])
        sample1 = sample1.unsqueeze(1)

        for i in range(min(8, len(sample1))):
            self.GenerateMayaPose(sample1[i][0], i * frame_gap, translate_scale=self.translate_scale)

        return min(8, len(sample1))

    def TakeSceenShots(self, sceen_shots: int, camera_list: list, size_list: list, keyword, make_folder=True):
        folder = self.sceenshots_folder + "/" + keyword
        if (not os.path.exists(folder)) and make_folder:
            os.mkdir(folder)
            print("make new folder: ", folder)
        for i in range(sceen_shots):
            frame = i * frame_gap
            self.mc.SetCurrentTimeFrame(frame)

            for j in range(len(camera_list)):
                camera = camera_list[j]
                if make_folder:
                    #file_name = folder + "/" + camera + "_" + str(j) + ".png"
                    file_name = folder + "/" + str(i) + ".png"
                else:
                    file_name = folder + ".png"
                self.mc.ScreenShot(file_name, camera=camera, width=self.image_sizes[j][0], height=self.image_sizes[j][1])


    def GenerateMayaPose(self, joint_info, frame: int, translate_scale=1.0, modify_y=True):
        self.mc.SetCurrentTimeFrame(frame)

        offset = 1 if self.has_translate else 0

        for i in range(len(G_TRAINING_JOINTS_INDEX)):
            if i == 0:
                continue
            rotateX = joint_info[3 * (i + offset) + 0].item()
            rotateY = joint_info[3 * (i + offset) + 1].item()
            rotateZ = joint_info[3 * (i + offset) + 2].item()

            if self.radian:
                rotateX *= 180.0 / np.pi
                rotateY *= 180.0 / np.pi
                rotateZ *= 180.0 / np.pi

            joint_name = self.namespace + self.namespace_symbol + G_MIXAMO_JOINTS[G_TRAINING_JOINTS_INDEX[i]]
            #print(joint_name, [rotateX, rotateY, rotateZ])
            self.mc.SetObjectAttribute(joint_name, "rotateX", rotateX)
            self.mc.SetObjectAttribute(joint_name, "rotateY", rotateY)
            self.mc.SetObjectAttribute(joint_name, "rotateZ", rotateZ)

            self.mc.SetCurrentKeyFrameForPositionAndRotation(joint_name)

        #Set up finger curl
        if self.has_finger:
            for j in range(len(G_TRAINING_FINGERS_INDEX)):
                finger_name = self.namespace + self.namespace_symbol + G_MIXAMO_JOINTS[G_TRAINING_FINGERS_INDEX[j]]
                rotateX = joint_info[-6 + j].item()
                if self.radian:
                    rotateX *= 180.0 / np.pi

                #First finger joint
                #print(finger_name, rotateX)
                self.mc.SetObjectAttribute(finger_name, "rotateX", rotateX)
                self.mc.SetCurrentKeyFrameForPositionAndRotation(finger_name)


                finger_name2 = self.namespace + self.namespace_symbol + G_MIXAMO_JOINTS[G_TRAINING_FINGERS_INDEX[j] + 1]
                self.mc.SetObjectAttribute(finger_name2, "rotateX", rotateX)
                self.mc.SetCurrentKeyFrameForPositionAndRotation(finger_name2)



                #Not Thumb has another finger joint
                if G_MIXAMO_JOINTS[G_TRAINING_FINGERS_INDEX[j]] != "LeftHandThumb2" \
                    and G_MIXAMO_JOINTS[G_TRAINING_FINGERS_INDEX[j]] != "LeftHandThumb2":
                    finger_name3 = self.namespace + self.namespace_symbol + G_MIXAMO_JOINTS[
                        G_TRAINING_FINGERS_INDEX[j] + 2]
                    self.mc.SetObjectAttribute(finger_name3, "rotateX", 0.618 * rotateX)
                    self.mc.SetCurrentKeyFrameForPositionAndRotation(finger_name3)

                if G_MIXAMO_JOINTS[G_TRAINING_FINGERS_INDEX[j]] == "LeftHandMiddle1" \
                    or G_MIXAMO_JOINTS[G_TRAINING_FINGERS_INDEX[j]] == "RightHandMiddle1":
                    ring_finger1 = self.namespace + self.namespace_symbol + G_MIXAMO_JOINTS[G_TRAINING_FINGERS_INDEX[j] + 4]
                    ring_finger2 = self.namespace + self.namespace_symbol + G_MIXAMO_JOINTS[G_TRAINING_FINGERS_INDEX[j] + 5]
                    ring_finger3 = self.namespace + self.namespace_symbol + G_MIXAMO_JOINTS[G_TRAINING_FINGERS_INDEX[j] + 6]

                    self.mc.SetObjectAttribute(ring_finger1, "rotateX", rotateX)
                    self.mc.SetCurrentKeyFrameForPositionAndRotation(ring_finger1)
                    self.mc.SetObjectAttribute(ring_finger2, "rotateX", rotateX)
                    self.mc.SetCurrentKeyFrameForPositionAndRotation(ring_finger2)
                    self.mc.SetObjectAttribute(ring_finger3, "rotateX", 0.618 * rotateX)
                    self.mc.SetCurrentKeyFrameForPositionAndRotation(ring_finger3)

                    pinky_finger1 = self.namespace + self.namespace_symbol + G_MIXAMO_JOINTS[G_TRAINING_FINGERS_INDEX[j] + 8]
                    pinky_finger2 = self.namespace + self.namespace_symbol + G_MIXAMO_JOINTS[G_TRAINING_FINGERS_INDEX[j] + 9]
                    pinky_finger3 = self.namespace + self.namespace_symbol + G_MIXAMO_JOINTS[G_TRAINING_FINGERS_INDEX[j] + 10]

                    self.mc.SetObjectAttribute(pinky_finger1, "rotateX", rotateX)
                    self.mc.SetCurrentKeyFrameForPositionAndRotation(pinky_finger1)
                    self.mc.SetObjectAttribute(pinky_finger2, "rotateX", rotateX)
                    self.mc.SetCurrentKeyFrameForPositionAndRotation(pinky_finger2)
                    self.mc.SetObjectAttribute(pinky_finger3, "rotateX", 0.618 * rotateX)
                    self.mc.SetCurrentKeyFrameForPositionAndRotation(pinky_finger3)

        if self.has_translate:
            root = self.namespace + self.namespace_symbol + G_MIXAMO_JOINTS[G_TRAINING_JOINTS_INDEX[0]]

            if frame == 0:
                self.root_translate0[0] = self.mc.GetObjectAttribute(root, "translateX")[0]
                self.root_translate0[1] = self.mc.GetObjectAttribute(root, "translateY")[0]
                self.root_translate0[2] = self.mc.GetObjectAttribute(root, "translateZ")[0]

            translateX = joint_info[0].item() * translate_scale * 4 + self.root_translate0[0]
            translateY = joint_info[1].item() * translate_scale * 4 + self.root_translate0[1]
            translateZ = joint_info[2].item() * translate_scale * 4 + self.root_translate0[2]

            self.mc.SetObjectAttribute(root, "translateX", translateX)
            self.mc.SetObjectAttribute(root, "translateY", translateY)
            self.mc.SetObjectAttribute(root, "translateZ", translateZ)

            #print(self.root_translate0, [translateX, translateY, translateZ])

            if modify_y:
                left_toe = self.namespace + self.namespace_symbol + "LeftToe_End"
                left_toe_translate = self.mc.GetObjectWorldTransform(left_toe)

                right_toe = self.namespace + self.namespace_symbol + "RightToe_End"
                right_toe_translate = self.mc.GetObjectWorldTransform(right_toe)

                toe_offset_y = min(left_toe_translate[1], right_toe_translate[1])


                self.mc.MoveObjectWorldRelative(root, [0, -toe_offset_y, 0])

            #print(self.mc.GetObjectAttribute(root, "translateX"))
            #print(self.mc.GetObjectAttribute(root, "translateY"))
            #print(self.mc.GetObjectAttribute(root, "translateZ"))
            self.mc.SetCurrentKeyFrameForPositionAndRotation(root)

    def SampleAnim(self, frame_count, frame_interval=frame_gap, translate_scale=1.0):
        anim_seq = self.model.sample(frame_count) 
        
        #sample = torch.zeros(seq_len, self.x_dim)
        anim_seq = anim_seq.data
        for i in range(frame_count):
            self.GenerateMayaPose(anim_seq[i], i * frame_interval, translate_scale=translate_scale)

    def EmotionPCA(self, displayResult=False):
        # PCA
        df = pd.read_csv("../data/BlendFaces.csv")
        data = df.iloc[:, :].to_numpy()
        y = data[:, 1:4].astype(float)
        x = data[:, 4:].astype(float)
        pca = PCA(n_components=3)
        pca_result = pca.fit_transform(x)
        y_tilda = np.c_[y, np.ones(len(y))]
        result = np.linalg.lstsq(y_tilda, pca_result, rcond=None)[0]

        self.lstsq_result = result
        self.pca_components = pca.components_

        for i in range(len(y)):
            self.emotion2vad[df.iloc[i, 0]] = y[i]


        # if displayResult:
        #     print('Explained variation per principal component: {}'.format(pca.explained_variance_ratio_))
        #     fig = plt.figure()
        #     ax = fig.gca(projection='3d')
        #     ax.scatter(pca_result[:,0], pca_result[:,1], pca_result[:,2], c="darkred")

        #return result, pca.components_

    def GenerateEmotionFromVAD(self, vad: list):
        '''
        Return a prediction of facial attributes from VAD list
        '''
        #result, pca_components = self.EmotionPCA()
        z = np.dot(vad, self.lstsq_result[:3]) + self.lstsq_result[3]
        joints = np.dot(z, self.pca_components)
        joints[joints < -1] = -1
        joints[joints > 1] = 1
        return joints

    def GenerateMayaFace(self, vad_score: list, frame: int):
        self.mc.SetCurrentTimeFrame(frame)
        scores = self.GenerateEmotionFromVAD(vad_score)
        c = BF_ListToJson(scores)
        self.mc.SetMultipleAttributes(c)
        self.mc.SetCurrentKeyFrameForObjects(["Morpher", "face"])

    #---------------------------------------------validation--------------------------------

    def SetOneFrame(self, frame, joints_info_list: list):
        '''
        Validation:
        Set one maya frame from load data
        :param frame:
        :param joints_info_list:
        :return:
        '''
        self.mc.SetCurrentTimeFrame(frame)

        for i in range(len(G_MIXAMO_JOINTS)):
            translateX, translateY, translateZ, rotateX, rotateY, rotateZ = joints_info_list[i]

            joint_name = self.namespace + self.namespace_symbol + G_MIXAMO_JOINTS[i]
            # print(joint_name, [rotateX, rotateY, rotateZ])
            if G_MIXAMO_JOINTS[i] == "Hips":
                self.mc.SetObjectAttribute(joint_name, "translateX", translateX)
                self.mc.SetObjectAttribute(joint_name, "translateY", translateY)
                self.mc.SetObjectAttribute(joint_name, "translateZ", translateZ)

            self.mc.SetObjectAttribute(joint_name, "rotateX", rotateX)
            self.mc.SetObjectAttribute(joint_name, "rotateY", rotateY)
            self.mc.SetObjectAttribute(joint_name, "rotateZ", rotateZ)

            self.mc.SetCurrentKeyFrameForPositionAndRotation(joint_name)

    def SetOneFbx(self, frames_info_list: list, frame_gap=1):
        '''
        Validation
        Set one fbx
        :param frames_info_list:
        :return:
        '''
        for i in tqdm(range(0, len(frames_info_list), frame_gap)):
            self.SetOneFrame(i, frames_info_list[i])




class FBXDataLoader():
    def __init__(self, root_folder: str,
                 relative=False,
                 radian=False,
                 has_translate=False,
                 mirror_data=True,
                 has_finger=False):
        '''
        FBX data loader
        :param root_folder: root folder for fbx file
        :param relative: absolute value of difference(joint rotation and transform)
        '''
        self.root_folder = root_folder
        self.relative = relative
        self.radian = radian
        self.has_translate = has_translate
        self.mirror_data = mirror_data
        self.has_finger = has_finger

        self.raw_files = [] # Files x Frames x Joints x 6
        self.raw_data = [] # Files x Frames x Joints x 6

        self.all_files = [] # No.samples x Length x
        self.all_data = []
        self.train_data = []
        self.test_data = []

        self.translate_scale = 1.0

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
                        translateX, translateY, translateZ = float(translateX), float(translateY), float(translateZ)
                        rotateX, rotateY, rotateZ = float(rotateX), float(rotateY), float(rotateZ)
                        if self.radian:
                            rotateX = float(rotateX) / 180.0 * np.pi
                            rotateY = float(rotateY) / 180.0 * np.pi
                            rotateZ = float(rotateZ) / 180.0 * np.pi

                        joint_data = [translateX, translateY, translateZ, rotateX, rotateY, rotateZ]
                        frame_data.append(joint_data)
                    f.close()
                fbx_data.append(frame_data)
            self.raw_data.append(fbx_data)
            self.raw_files.append(fbx_file_name)

        def _euclidean_distance(x1: list, x2: list) -> float:
            return np.sqrt((x1[0] - x2[0]) ** 2 + (x1[1] - x2[1]) ** 2 + (x1[2] - x2[2]) ** 2)

        dis = 0.0
        for m in range(len(self.raw_data)):
            dis += _euclidean_distance(self.raw_data[m][0][0][0:3], self.raw_data[m][0][1][0:3])

        self.translate_scale = dis / len(self.raw_data)
        print("Hip Spine distance as scale: ", self.translate_scale) #about 3.97

        # calculate fixed translate scale
        self.translate_scale *= fix_translate_scale

        if self.mirror_data:
            raw_data_len = len(self.raw_data)
            for i in range(raw_data_len):
                one_fbx = self.raw_data[i]
                mirror_one_fbx = []
                for j in range(len(one_fbx)):
                    mirror_one_frame = self.MirrorOneFrame(one_fbx[j])
                    mirror_one_fbx.append(mirror_one_frame)

                self.raw_data.append(mirror_one_fbx)
                self.raw_files.append(self.raw_files[i])

    def MirrorOneFrame(self, frame_data):
        '''
        Mirror the joint at frame
        :param frame_data:
        :return:
        '''
        #print("MirrorOneFrame frame_data", len(frame_data), len(frame_data[0]))
        mirror_frame_data = []
        for i in range(len(G_MIXAMO_JOINTS)):
            joint = G_MIXAMO_JOINTS[i]
            if "Left" in joint:
                mirror_joint = joint.replace("Left", "Right")
                mirror_index = G_MIXAMO_JOINTS.index(mirror_joint)
                joint_data = [_ for _ in frame_data[mirror_index]]

                # mirror
                joint_data[0] = -joint_data[0] #translateX
                joint_data[-1] = -joint_data[-1] #rotateZ
                joint_data[-2] = -joint_data[-2] #rotateY

                #print(i, joint, mirror_joint, mirror_index)

                mirror_frame_data.append(joint_data)

            elif "Right" in joint:
                mirror_joint = joint.replace("Right", "Left")
                mirror_index = G_MIXAMO_JOINTS.index(mirror_joint)
                joint_data = [_ for _ in frame_data[mirror_index]]

                # mirror
                joint_data[0] = -joint_data[0]
                joint_data[-1] = -joint_data[-1]
                joint_data[-2] = -joint_data[-2]

                mirror_frame_data.append(joint_data)

            else:
                joint_data = [_ for _ in frame_data[i]]

                # mirror
                joint_data[0] = -joint_data[0]
                joint_data[-1] = -joint_data[-1]
                joint_data[-2] = -joint_data[-2]

                mirror_frame_data.append(joint_data)

        return mirror_frame_data

    def PrepareTrainingData(self, frame_gap = 12,
                            training_joint_index = G_TRAINING_JOINTS_INDEX,
                            training_finger_index = G_TRAINING_FINGERS_INDEX):
        '''
        Prepare training data
        :param frame_gap: 帧差
        :return:
        '''
        for i in tqdm(range(len(self.raw_data))):
            fbx_data = self.raw_data[i]
            fbx_file_name = self.raw_files[i]
            for j in range(frame_gap):
                frame_sequence = []
                original_position = [0.0, 0.0, 0.0] #set the original position
                original_rotation = [0.0, 0.0, 0.0]  # set the original position
                for k in range(j, len(fbx_data), frame_gap):
                    one_frame = fbx_data[k]
                    one_frame_data = []
                    for idx in training_joint_index:
                        if idx == 0:
                            if k == j: #first frame put origin to zero
                                original_position[0] = one_frame[idx][0]
                                original_position[1] = one_frame[idx][1]
                                original_position[2] = one_frame[idx][2]

                                if self.has_translate:
                                    one_frame_data.append(0.0)
                                    one_frame_data.append(0.0)
                                    one_frame_data.append(0.0)

                                one_frame_data.append(one_frame[idx][3])
                                one_frame_data.append(one_frame[idx][4])
                                one_frame_data.append(one_frame[idx][5])
                            else:
                                if self.has_translate:
                                    delta_x = (one_frame[idx][0] - original_position[0]) / self.translate_scale
                                    delta_y = (one_frame[idx][1] - original_position[1]) / self.translate_scale
                                    delta_z = (one_frame[idx][2] - original_position[2]) / self.translate_scale

                                    one_frame_data.append(delta_x)
                                    one_frame_data.append(delta_y)
                                    one_frame_data.append(delta_z)

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

                    if self.has_finger:
                        for idx in training_finger_index:
                            one_frame_data.append(one_frame[idx][3]) #rotateX of Thumb, Index, and Middle fingers

                    frame_sequence.append(one_frame_data)

                if len(frame_sequence) >= 2:
                    #frame_sequence = np.asarray(frame_sequence)
                    self.all_data.append(frame_sequence)
                    self.all_files.append(fbx_file_name)


        #cannot get numpy array because it is of different length
        #self.train_data = np.asarray(self.train_data)
        data_indexes = [i for i in range(len(self.all_data))]
        random.shuffle(data_indexes)
        train_sample_num = int(0.8 * len(self))

        self.train_data = [self.all_data[data_indexes[i]] for i in range(train_sample_num)]
        self.test_data = [self.all_data[data_indexes[i]] for i in range(train_sample_num, len(self.all_data))]

    def next_batch(self, batch_size=16, train_mode=True, batch_first=True):
        if train_mode:
            sample_from_data = self.train_data
        else:
            sample_from_data = self.test_data

        input_dim = len(sample_from_data[0][0])
        random.shuffle(sample_from_data)
        for i in range(0, len(sample_from_data), batch_size):
            #print("i", i)
            end_index = min(len(sample_from_data), i + batch_size)
            batch_data = copy.deepcopy(sample_from_data[i: end_index])
            pad_data = []

            max_length = max([len(_) for _ in batch_data])
            #print("max", max_length)
            for j in range(len(batch_data)):
                pad_data.append([1] * len(batch_data[j]) + [0] * (max_length - len(batch_data[j])))
                #print(pad_data[-1])
                padding = (max_length - len(batch_data[j]))*[[0.0]*input_dim]
                #print(len(batch_data[j]))
                batch_data[j] += padding

            if not batch_first:
                yield torch.FloatTensor(batch_data).transpose(0, 1), torch.LongTensor(pad_data).transpose(0, 1)
            else:
                yield torch.FloatTensor(batch_data), torch.LongTensor(pad_data)

    def __len__(self):
        return len(self.all_data)

    def __getitem__(self, idx):
        return self.all_data[idx]








