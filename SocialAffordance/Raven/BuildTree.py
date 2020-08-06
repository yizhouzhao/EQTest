from Raven.AoT import *

import os

def build_single_person_scene_one_pose():
    '''
    Test for pose build for one pose in the initial frame
    :return:
    '''
    #Init AOG
    scene = Scene("scene", is_pg=False)
    animation = Animation("animation", is_pg=False)
    initFrame = RegularFrame("init frame", is_pg=False)
    relativeTransform = RelativeTransform("relative transform", is_pg=False)
    initPose = Pose("init pose", is_pg=False)
    relation = Relation("relation", is_pg=False)
    body = Body("init body", is_pg=False)
    emotion = Emotion("init emotion", is_pg=False)

    #build connections
    scene.insert(animation)
    animation.insert(initFrame)
    initFrame.insert(relativeTransform)
    initFrame.insert(relation)
    initFrame.insert(initPose)
    initPose.insert(body)
    initPose.insert(emotion)

    #load data
    load_relation(relation)

    load_entity_pose(body.head_leaf, "Head")
    load_entity_pose(body.arm_leaf, "Arm")
    load_entity_pose(body.hand_leaf, "Hand")
    load_entity_pose(body.chest_leaf, "Body")
    load_entity_pose(body.foot_leaf, "Foot")

    return scene

def build_single_person_scene_two_poses():
    '''
    Test for pose build for one pose in the initial frame
    :return:
    '''
    #Init AOG
    scene = Scene("scene", is_pg=False)
    animation = Animation("person one animation", is_pg=False)
    initFrame = RegularFrame("init frame", is_pg=False)
    relativeTransform = RelativeTransform("relative transform", is_pg=False)
    initPose = Pose("init pose", is_pg=False)
    relation = Relation("relation", is_pg=False)
    initBody = Body("init body", is_pg=False)
    initEmotion = Emotion("init emotion", is_pg=False)

    endFrame = RegularFrame("end frame", is_pg=False)
    endPose = Pose("end pose", is_pg=False)
    endBody = Body("end body", is_pg=False)
    endEmotion = Emotion("end emotion", is_pg=False)

    #build connections
    scene.insert(animation)

    animation.insert(initFrame)
    initFrame.insert(relativeTransform)
    initFrame.insert(relation)
    initFrame.insert(initPose)
    initPose.insert(initBody)
    initPose.insert(initEmotion)

    animation.insert(endFrame)
    endFrame.insert(endPose)
    endPose.insert(endBody)
    endPose.insert(endEmotion)

    #load data
    load_relation(relation)

    load_entity_pose(endBody.head_leaf, "Head")
    load_entity_pose(endBody.arm_leaf, "Arm")
    load_entity_pose(endBody.hand_leaf, "Hand")
    load_entity_pose(endBody.chest_leaf, "Body")
    load_entity_pose(endBody.foot_leaf, "Foot")

    return scene

def load_relation(relation_node: Relation):
    '''
    Set up social relations
    :param relation_node:
    :return:
    '''
    relation_node.relation_pool = ["family", "society"]
    relation_node.generation_pool = ["elder", "same", "younger"]
    relation_node.sex_pool = ["same", "different"]

def load_entity_pose(entity_node: EntityLeaf, tipo="Head",  data_path= "../StudioLibrary/Poses/"):
    '''
    Load pose files into pool
    :param pose_node:
    :param tipo:
    :param data_path:
    :return:
    '''

    tipo_path = data_path + tipo
    tipo_pose_list = os.listdir(tipo_path)
    for tipo_pose in tipo_pose_list:
        if not tipo_pose.endswith(".mirror"):
            file = tipo_path + "/" + tipo_pose + "/" + "pose.json"
            entity_node.file_pool.append(file)








