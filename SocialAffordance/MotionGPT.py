from DataAPI import *

import os
from tqdm.auto import tqdm

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




