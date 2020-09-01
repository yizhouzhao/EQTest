from Raven.AoT2 import *
from Params import *
import os

def build_scene():
    '''
    Test for pose build for one pose in the initial frame
    :return:
    '''
    #Init AOG
    scene = Scene("scene", is_pg=False)
    init_frame = RegularFrame("init frame", is_pg=False)
    relative_transform = RelativeTransform("transform", is_pg=False)
    relation = Relation("relation", is_pg=False)

    animation1 = Animation("animation1", is_pg=False)
    motion1 = Motion("motion1", is_pg=False)
    emotion1 = Emotion("emotion1", is_pg=False)

    animation2 = Animation("animation2", is_pg=False)
    motion2 = Motion("motion2", is_pg=False)
    emotion2 = Emotion("emotion2", is_pg=False)

    #build connections
    scene.insert(init_frame)
    init_frame.insert(relative_transform)
    init_frame.insert(relation)

    scene.insert(animation1)
    animation1.insert(motion1)
    animation1.insert(emotion1)

    scene.insert(animation2)
    animation1.insert(motion2)
    animation1.insert(emotion2)

    #load data
    load_relation(relation)
    load_motion_and_emotion(motion1, emotion1)
    load_motion_and_emotion(motion2, emotion2)

    return scene


def load_relation(relation_node: Relation):
    '''
    Set up social relations
    :param relation_node:
    :return:
    '''
    relation_node.relation_pool = ["family", "friend", "society"]
    relation_node.generation_pool = ["elder", "same", "younger"]
    relation_node.sex_pool = ["same", "different"]

def load_motion_and_emotion(motion_node: Motion, emotion_node: Emotion):
    '''
    Set up file pool for motion and emotion
    :param motion_node:
    :param emotion_node:
    :return:
    '''
    motion_node.file_pool = G_INTEACT_KEY_WORDS
    emotion_node.file_pool = G_BASIC_EMOTIONS


def get_time_scores(pg: Scene, mu_list: list, sigma_list: list):
    '''
    Get the likelihood of normal distribution as time scores
    :param pg:
    :return:
    '''
    assert pg.is_pg
    motion1 = pg.node_dict['motion1'].start_emotion
    emotion1 = pg.node_dict['emotion1'].start_emotion
    motion2 = pg.node_dict['motion2'].start_emotion
    emotion2 = pg.node_dict['emotion2'].start_emotion

    score_me1 = log_normal_likelihood(motion1.start_time - emotion1.start_time, mu_list[0], sigma_list[0])
    score_me2 = log_normal_likelihood(motion2.start_time - emotion2.start_time, mu_list[1], sigma_list[1])

    score_m12 = log_normal_likelihood(motion1.start_time - motion2.start_time, mu_list[2], sigma_list[2])
    score_e12 = log_normal_likelihood(emotion1.start_time - emotion2.start_time, mu_list[3], sigma_list[3])

    return [score_me1, score_me2, score_m12, score_e12]


def get_relation_emotion_scores(pg: Scene, emotion2vad: dict):
    assert pg.is_pg
    emotion1: Emotion = pg.node_dict['emotion1']
    emotion2: Emotion = pg.node_dict['emotion2']
    rrelation: Relation = pg.node_dict['relation']

    emotion1_start_vad = emotion2vad[emotion1.start_emotion]
    emotion1_end_vad = emotion2vad[emotion1.end_emotion]
    delta_emotion1 = np.asarray(emotion1_end_vad, dtype=float) - np.asarray(emotion1_start_vad, dtype=float)

    emotion2_start_vad = emotion2vad[emotion2.start_emotion]
    emotion2_end_vad = emotion2vad[emotion2.end_emotion]
    delta_emotion2 = np.asarray(emotion2_end_vad, dtype=float) - np.asarray(emotion2_start_vad, dtype=float)

    relation_i_d = np.asarray([G_RELATION2INTIMACY[rrelation.relation], G_GENERATION2DOMINANCE[rrelation.generation]], dtype=float)
    delta_i_d1 = np.asarray([delta_emotion1[0]**2 + delta_emotion1[1]**2, delta_emotion1[2]], dtype=float)
    delta_i_d2 = np.asarray([delta_emotion2[0] ** 2 + delta_emotion2[1] ** 2, delta_emotion2[2]], dtype=float)

    score_re1 = delta_i_d1.dot(relation_i_d)
    score_re2 = delta_i_d2.dot(relation_i_d)

    return [score_re1, score_re2]

def get_relation_motion_scores(pg: Scene, motion2vad: dict):
    assert pg.is_pg
    motion1: Motion = pg.node_dict['motion1']
    motion2: Motion = pg.node_dict['motion2']
    rrelation: Relation = pg.node_dict['relation']

    motion1_vad = np.asarray(motion2vad[motion1.selected_motion])
    motion2_vad = np.asarray(motion2vad[motion2.selected_motion])

    relation_i_d = np.asarray([G_RELATION2INTIMACY[rrelation.relation], G_GENERATION2DOMINANCE[rrelation.generation]],
                              dtype=float)

    motion1_i_d = np.asarray([motion1_vad[0] ** 2 + motion1_vad[1] ** 2, motion1_vad[2]], dtype=float)
    motion2_i_d = np.asarray([motion2_vad[0] ** 2 + motion2_vad[1] ** 2, motion2_vad[2]], dtype=float)

    score_rm1 = motion1_i_d.dot(relation_i_d)
    score_rm2 = motion2_i_d.dot(relation_i_d)

    return [score_rm1, score_rm2]

def get_motion_emotion_scores(pg: Scene, motion2vad: dict, emotion2vad: dict):
    assert pg.is_pg
    motion1: Motion = pg.node_dict['motion1']
    motion2: Motion = pg.node_dict['motion2']

    motion1_vad = np.asarray(motion2vad[motion1.selected_motion])
    motion2_vad = np.asarray(motion2vad[motion2.selected_motion])

    emotion1: Emotion = pg.node_dict['emotion1']
    emotion2: Emotion = pg.node_dict['emotion2']

    emotion1_start_vad = emotion2vad[emotion1.start_emotion]
    emotion1_end_vad = emotion2vad[emotion1.end_emotion]
    delta_emotion1 = np.asarray(emotion1_end_vad, dtype=float) - np.asarray(emotion1_start_vad, dtype=float)

    emotion2_start_vad = emotion2vad[emotion2.start_emotion]
    emotion2_end_vad = emotion2vad[emotion2.end_emotion]
    delta_emotion2 = np.asarray(emotion2_end_vad, dtype=float) - np.asarray(emotion2_start_vad, dtype=float)

    score_me1 = motion1_vad.dot(delta_emotion1)
    score_me2 = motion2_vad.dot(delta_emotion2)

    return [score_me1, score_me2]


def log_normal_likelihood(x, mu, sigma):
    return -np.log(2*np.pi*(sigma**2))/2 - ((x-mu)**2)/(2 * (sigma**2))





