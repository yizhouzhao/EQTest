from Raven.BuildTree import *
from Params import *

from DataAPI import *

g_body_part_to_joint_identifiers = {"head": ["FKNeck_M"],
                                    "chest": ["FKChest_M", "FKRoot_M", "FKSpine1_M"],
                                    "arm": ["FKShoulder_L", "FKShoulder_R", "FKElbow_L", "FKElbow_R",
                                            "FKWrist_L", "FKWrist_R"],
                                    "foot": ["FKHip_L", "FKHip_R", "FKKnee_L", "FKKnee_R",
                                             "FKAnkle_L", "FKAnkle_R", "FKToes_L", "FKToes_R"],
                                    "hand": ["Fingers_L", "Fingers_R"]}

g_face_part_to_ctrl_identifiers = {"eye": ["ctrlEye_R", "ctrlEye_L"],
                                   "eyebrow": ["ctrlBrow_R", "ctrlBrow_L"],
                                   "mouth": ["ctrlMouth_M"],
                                   "cheek": ["ctrlMouthCorner_R", "ctrlMouthCorner_L"]}

class AnimationBuilder(object):
    def __init__(self, tree_builder=None, PORT=12345):
        self.maya_controller = MayaController(PORT)
        self.tree: AoTNode = None
        self.pg: AoTNode = None

        if tree_builder:
            self.tree = tree_builder()
        else:
            self.tree  = build_single_person_scene_one_pose()

    def BuildScene(self):
        self.pg = self.tree.sample()

    def BuildTransform(self, transform_node: RelativeTransform):
        '''
        Build transform to initial character
        :param transform_node: Relative Transform AoT Node
        :return:
        '''
        position = transform_node.position_leaf.relativePosition
        self.maya_controller.SetObjectLocalTransform("Main",[position[0], 0, position[1]])

        rotation = transform_node.rotation_leaf.relativeRotation
        self.maya_controller.SetObjectLocalRotation("Main", [0, rotation, 0])

        scale = transform_node.scale_leaf.relativeScale
        self.maya_controller.SetObjectAttribute("Main", "scaleX", scale)
        self.maya_controller.SetObjectAttribute("Main", "scaleY", scale)
        self.maya_controller.SetObjectAttribute("Main", "scaleZ", scale)

    def BuildDefaultFrame(self):
        '''
        Build the starting position as stand pose & neutral face
        :return:
        '''
        assert self.pg is not None

        # build pose
        self.maya_controller.SetCurrentTimeFrame(0)
        self.BuildBodyFromFile(g_default_pose_file_path, "whole")

        ## build transform
        #transform_node = self.pg.node_dict["relative transform"]
        #self.BuildTransform(transform_node)

        #build emotion
        emotion_node = self.pg.node_dict["init emotion"]

        emotion_node.neutralize()

        self.BuildEmotion(emotion_node)

        # key frame
        self.maya_controller.SetCurrentKeyFrameForPositionAndRotation("Main")
        self.SetKey()

    def BuildFrame(self, frame: RegularFrame):
        pose_node = None
        for child_node in frame.children:
            if isinstance(child_node, Pose):
                pose_node = child_node
                break

        assert pose_node is not None

        emotion_node = pose_node.children[0] if isinstance(pose_node.children[0], Emotion) else pose_node.children[1]
        body_node = pose_node.children[0] if isinstance(pose_node.children[0], Body) else pose_node.children[1]

        self.BuildEmotion(emotion_node)
        self.BuildBody(body_node)

        self.SetKey()


    def BuildBody(self, body_node: Body):
        '''
        Build body pose
        :param body_node: Body AoT Node
        :return:
        '''
        head_leaf = body_node.head_leaf
        head_file = head_leaf.selected_file
        if head_file:
            self.BuildBodyFromFile(head_file, "head")

        chest_leaf = body_node.chest_leaf
        chest_file = chest_leaf.selected_file
        if chest_file:
            self.BuildBodyFromFile(chest_file, "chest")

        arm_leaf = body_node.arm_leaf
        arm_file = arm_leaf.selected_file
        if arm_file:
            self.BuildBodyFromFile(arm_file, "arm")

        # TO DOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
        # foot_leaf = body_node.foot_leaf
        # foot_file = foot_leaf.selected_file
        # if foot_file:
        #     self.BuildBodyFromFile(foot_file, "foot")

        hand_leaf = body_node.hand_leaf
        hand_file = hand_leaf.selected_file
        if hand_file:
            self.BuildBodyFromFile(hand_file, "hand")

    def BuildBodyFromFile(self, file_path, part="whole"):
        '''
        Build body pose from file
        :param file_path: json path
        :param part: body part or "whole"
        :return:
        '''
        if part != "whole":
            assert part in g_body_part_to_joint_identifiers.keys()
            identifiers = g_body_part_to_joint_identifiers[part]
            self.maya_controller.GenerateSceneFromPoseWithIdentifiers(file_path, identifiers)
        else:
            self.maya_controller.GenerateSceneFromPose(file_path, "", False)

    def BuildEmotion(self, emotion_node: Emotion):
        '''
        Build emotion for Maya
        :param emotion_node: emotion node from AoT
        :return:
        '''
        eye_leaf = emotion_node.eye_leaf
        if eye_leaf.selected_file is not None:
            self.maya_controller.GenerateSceneFromPoseWithIdentifiers(eye_leaf.selected_file,
                                                                      g_face_part_to_ctrl_identifiers["eye"])
        else:
            for controller in g_face_part_to_ctrl_identifiers["eye"]:
                self.maya_controller.SetObjectAttribute(controller, "translateX", eye_leaf.valueX)
                self.maya_controller.SetObjectAttribute(controller, "translateY", eye_leaf.valueY)
                self.maya_controller.SetObjectAttribute(controller, "blink", eye_leaf.blink_value)

        eyebrow_leaf = emotion_node.eyebrow_leaf
        if eyebrow_leaf.selected_file is not None:
            self.maya_controller.GenerateSceneFromPoseWithIdentifiers(eyebrow_leaf.selected_file,
                                                                      g_face_part_to_ctrl_identifiers["eyebrow"])
        else:
            for controller in g_face_part_to_ctrl_identifiers["eyebrow"]:
                self.maya_controller.SetObjectAttribute(controller, "translateX", eyebrow_leaf.valueX)
                self.maya_controller.SetObjectAttribute(controller, "translateY", eyebrow_leaf.valueY)

        mouth_leaf = emotion_node.mouth_leaf
        if mouth_leaf.selected_file is not None:
            self.maya_controller.GenerateSceneFromPoseWithIdentifiers(mouth_leaf.selected_file,
                                                                      g_face_part_to_ctrl_identifiers["mouth"])
        else:
            for controller in g_face_part_to_ctrl_identifiers["mouth"]:
                self.maya_controller.SetObjectAttribute(controller, "translateX", mouth_leaf.valueX)
                self.maya_controller.SetObjectAttribute(controller, "translateY", mouth_leaf.valueY)

        cheek_leaf = emotion_node.cheek_leaf
        if cheek_leaf.selected_file is not None:
            self.maya_controller.GenerateSceneFromPoseWithIdentifiers(cheek_leaf.selected_file,
                                                                      g_face_part_to_ctrl_identifiers["cheek"])
        else:
            for controller in g_face_part_to_ctrl_identifiers["cheek"]:
                self.maya_controller.SetObjectAttribute(controller, "translateX", cheek_leaf.valueX)
                self.maya_controller.SetObjectAttribute(controller, "translateY", cheek_leaf.valueY)


        #self.SetObjectAttribute(joints, attr_name, value["value"])

    def SetKey(self):
        for part in g_body_part_to_joint_identifiers:
            for joint in g_body_part_to_joint_identifiers[part]:
                if part == "hand":
                    fingers = ["index", "middle", "ring", "pinky", "thumb"]
                    for finger in fingers:
                        self.maya_controller.SetCurrentKeyFrameForAttribute(joint, finger+"Curl")
                else:
                    self.maya_controller.SetCurrentKeyFrameForPositionAndRotation(joint)

        for part in g_face_part_to_ctrl_identifiers:
            for controller in g_face_part_to_ctrl_identifiers[part]:
                self.maya_controller.SetCurrentKeyFrameForAttribute(controller, "translateX")
                self.maya_controller.SetCurrentKeyFrameForAttribute(controller, "translateY")

                if part == "eye":
                    self.maya_controller.SetCurrentKeyFrameForAttribute(controller, "blink")

    def __del__(self):
        self.maya_controller.Close()