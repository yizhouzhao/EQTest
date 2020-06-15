import socket
import os
import collections
import numpy as np

#Joint Type
# https://docs.microsoft.com/en-us/previous-versions/windows/kinect/dn758663(v=ieb.10)?redirectedfrom=MSDN
G_Joint_Name_Dic = {"JointType_SpineBase": 0,
"JointType_SpineMid": 1,
"JointType_Neck": 2,
"JointType_Head": 3,
"JointType_ShoulderLeft": 4,
"JointType_ElbowLeft": 5,
"JointType_WristLeft": 6,
"JointType_HandLeft": 7,
"JointType_ShoulderRight": 8,
"JointType_ElbowRight": 9,
"JointType_WristRight": 10,
"JointType_HandRight": 11,
"JointType_HipLeft": 12,
"JointType_KneeLeft": 13,
"JointType_AnkleLeft": 14,
"JointType_FootLeft": 15,
"JointType_HipRight": 16,
"JointType_KneeRight": 17,
"JointType_AnkleRight": 18,
"JointType_FootRight": 19,
"JointType_SpineShoulder": 20,
"JointType_HandTipLeft": 21,
"JointType_ThumbLeft": 22,
"JointType_HandTipRight": 23,
"JointType_ThumbRight": 24}

#Map joint index to Maya
G_Joint_Maya_Advanced_Skeleton = {
    0: "FKRoot_M",
    1: "FKSpine1_M",
    2: "FKNeck_M",
    3: "FKHead_M",
    4: "FKShoulder_L",
    5: "FKElbow_L",
    6: "FKWrist_L",
    7: "Fingers_L", #Probablemente equivocado
    8: "FKShoulder_R",
    9: "FKElbow_R",
    10: "FKWrist_R",
    11: "Fingers_R",  # Probablemente equivocado
    12: "FKHip_L",
    13: "FKKnee_L",
    14: "FKAnkle_L",
    15: "FKToes_L",
    16: "FKHip_R",
    17: "FKKnee_R",
    18: "FKAnkle_R",
    19: "FKToes_R",
    20: "FKChest_M", #????
    21: "FKCup_L", # Probablemente equivocado
    22: "FKThumbFinger1_L", # Probablemente equivocado
    23: "FKCup_R",  # Probablemente equivocado
    24: "FKThumbFinger1_R",  # Probablemente equivocado
}

#acción
G_Soicial_Actions = ["Hand_Over","High_Five","Pull_Up","Shake_Hands","Throw_Catch"]

##
class SkeletionVideo:
    def __init__(self, action_index : int, video_index : int):
        '''
        :param action_index: action_index from G_Soicial_Actions
        :param video_index: video index from 1-10
        '''
        self.action_name = G_Soicial_Actions[action_index]
        self.video_index = video_index
        self.skeleton_file_path =  os.getcwd() + "/Data/" + G_Soicial_Actions[action_index] + \
                              "/Skeletons_" + self.action_name + "/" + str(video_index)
        print("load file: ",  self.skeleton_file_path)
        self.skeleton_data = {}

    def LoadData(self):
        for skeleton_file_name in os.listdir(self.skeleton_file_path):
            _, skeleton_frame_num, skeleton_agent_index = skeleton_file_name.split(".")[0].split("_")
            skeleton_agent_index = int(skeleton_agent_index)
            skeleton_frame_num = int(skeleton_frame_num)
            if skeleton_agent_index not in self.skeleton_data:
                self.skeleton_data[skeleton_agent_index] = {}

            with open(self.skeleton_file_path + "/" + skeleton_file_name) as f:
                #joint_dict = self.skeleton_data[skeleton_agent_index]
                joint_dict = {}
                for i, line in enumerate(f.readlines()):
                    # print(i, line)
                    if i == 0:  # Skip the first line
                        continue
                    if i > 25:
                        break
                    joint_id, x, y, z, tracking_state, x_2d, y_2d, x_depth, y_depth = line.split(" ")
                    joint_id = int(joint_id)
                    transform = [float(x), float(y), float(z)]
                    transform2d = [float(x_2d), float(y_2d)]
                    depth = [float(x_depth), float(y_depth)]

                    joint_dict[joint_id] = {"transform": transform,
                                                                "transform2d": transform2d, "depth" : depth}

                #joint_dict = collections.OrderedDict(sorted(joint_dict.items()))
                self.skeleton_data[skeleton_agent_index][skeleton_frame_num] = joint_dict

    def GetSkeletonTransform(self, agent_index : int, frame_index: int, joint_index: int):
        '''
        :param agent_index: agent index in this video sample
        :param frame_index: frame index
        :param joint_index: joint index
        :return: Transform3d: vector3d of the position of the joint
        '''
        return self.skeleton_data[agent_index][frame_index][joint_index]["transform"]


##
class MayaController:
    def __init__(self):
        # connect to Maya server
        HOST = '127.0.0.1'  # Symbolic name meaning the local host
        PORT = 12345  # Arbitrary non-privileged port

        ADDR = (HOST, PORT)

        self.client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.client.connect(ADDR)

    def SendCommand(self, command: str):
        # client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        # client.connect(ADDR)
        command = command.encode()  # the command from external editor to maya

        my_message = command
        self.client.send(my_message)
        data = self.client.recv(1024)  # receive the result info
        # client.close()
        # print(data)
        # ret = str(data.decode(encoding="ASCII"))
        ret = data.decode("utf-8")
        return ret

    def Close(self):
        self.client.close()

    #--------------------------------SET-----------------------------------------
    def SetCurrentTimeFrame(self, time_frame: int):
        send_message = "currentTime -edit" + " " + str(time_frame) + ";"
        recv_message = self.SendCommand(send_message)

    def SetObjectWorldTransform(self, object_name: str, location: list):
        '''
        Set world absolute location for object with location [x, y, z]
        '''
        send_message = "select -replace " + object_name + ";"
        send_message += "move -absolute " + str(location[0]) + " " + str(location[1]) + " " + str(location[2]) + ";"
        recv_message = self.SendCommand(send_message)

    def SetObjectLocalTransform(self, object_name: str, location: list):
        '''
        Set world absolute location for object with location [x,y] or [x, y, z]
        '''
        send_message = "select -replace " + object_name + ";" + "move -relative "
        for value in location:
            send_message += str(value) + " "

        send_message += ";"
        recv_message = self.SendCommand(send_message)

    def SetObjectLocalRotation(self, object_name: str, rotation: list):
        '''
        Set world absolute location for object with rotation [x,y] or [x, y, z] in degree
        '''
        send_message = "select -replace " + object_name + ";" + "rotate -relative "
        for value in rotation:
            send_message += str(value) + "deg "

        send_message += ";"
        recv_message = self.SendCommand(send_message)

    def SetCurrentKeyFrameForAttribute(self, object_name: str, attr_name: str):
        send_message = "select -r " + object_name + ";"
        send_message += "setKeyframe -at " + attr_name + ";"
        recv_message = self.SendCommand(send_message)

    def SetCurrentKeyFrameForTransformAndRotation(self, object_name: str):
        send_message = "select -r " + object_name + ";"
        send_message += "setKeyframe -at translate;"
        send_message += "setKeyframe -at rotate;"
        recv_message = self.SendCommand(send_message)

    def SetObjectAttribute(self, object_name: str, attr_name: str, value: float):
        send_message = "setAttr " + object_name + "." + attr_name + " " + str(value) + ";"
        recv_message = self.SendCommand(send_message)

    #---------------------------GET-----------------------------------
    def GetObjectWorldTransform(self, object_name: str):
        '''
        Get Object world location
        return: cordindate [x,y,z]
        '''
        send_message = "xform -q -t -ws " + object_name + ";"
        recv_message = self.SendCommand(send_message)
        recv_message = recv_message.rstrip('\x00').rstrip('\n').split('\t')
        return [np.around(float(_), decimals=2) for _ in recv_message]

    def GetObjectAttribute(self, object_name: str, attr_name: str):
        '''
        Get attribute value
        return [float]
        '''
        send_message = "getAttr " + object_name + "." + attr_name + ";"
        recv_message = self.SendCommand(send_message)
        recv_message = recv_message.rstrip('\x00').rstrip('\n').split('\t')
        return [np.around(float(_), decimals=2) for _ in recv_message]

    def GetBodyInformation(self, joint_list: list):
        '''
        :param joint_list: a list of joint names
        :return: a list with joint positions
        '''
        BODY_INFO_DIC = {}
        for joint_name in joint_list:
            info_dict = {}
            world_transform = self.GetObjectWorldTransform(joint_name)
            info_dict["world_transform"] = world_transform

            local_transform = self.GetObjectAttribute(joint_name, "translate")
            info_dict["local_transform"] = local_transform

            local_rotation = self.GetObjectAttribute(joint_name, "rotate")
            info_dict["local_rotation"] = local_rotation

            BODY_INFO_DIC[joint_name] = info_dict

        return BODY_INFO_DIC

    #--------------------------UTIL-------------------------------------
    def GetAdvancedSkeletonJointNameFromIndex(self, joint_index: int):
        '''
        :param joint_index:
        :return: advanced skeleton joint name
        '''
        return G_Joint_Maya_Advanced_Skeleton[joint_index]

