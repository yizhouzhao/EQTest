from AoT import *

def build_single_person_scene_one_pose():
    '''
    Test for pose build for one pose in the initial frame
    :return:
    '''
    scene = Scene("scene", is_pg=False)
    animation = Animation("animation", is_pg=False)
    initFrame = InitFrame("init frame", is_pg=False)
    relativeTransform = RelativeTransform("relative transform", is_pg=False)
    initPose = Pose("init pose", is_pg=False)
    relation = Relation("relation", is_pg=False)
    body = Body("body", is_pg=False)
    emotion = Emotion("emotion", is_pg=False)






