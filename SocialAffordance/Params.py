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
     'RightLeg', 'RightFoot', 'RightToeBase', 'RightToe_End'] #61

G_TRAINING_JOINTS_INDEX = [0, 1, 2, 3, 4, 7, 8, 9, 10, 31, 32, 33, 34, 55, 56, 57, 58, 60, 61, 62, 63]
G_TRAINING_FINGERS_INDEX = [11 + 1, 15, 19, 35 + 1, 39, 43]


g_position_x_range = [5, 10]

# Root path: Social Affordacne
g_default_pose_file_path = '../StudioLibrary/Poses/Body/Stand.pose/pose.json'


# Data
frame_gap = 12
data_file = "FBXDataStand"
radian = True
fix_translate_scale = 5.0
consider_root_translate = True
consider_finger = True

# Train
h_dim = 128
z_dim = 10
n_layers = 2
batch_size = 32
n_epochs = 300
clip = 10
learning_rate = 2e-4
print_every = 10

#Animation
G_INTEACT_KEY_WORDS = ["Acknowledging", "Agreeing", "Angry", "Head Shake", "Bash", #0
                       "Kiss", "Bored", "Idle", "Charge", "Clapping", #5
                       "Cocky", "Crazy", "Crying", "Defeat", "Disappointed", #10
                       "Dismissing", "Dizzy", "Drunk", "Dwarf", "Excited", #15w
                       "Fist", "Focus", "Forward", "Happy", "Head Nod", #20
                       "Joyful", "Kneeling", "Laughing", "Look", "Loser", #25
                       "Neck", "Nervously", "Offensive", "Pain", "Pointing", #30
                       "Pouting", "Praying", "Bow", "Reaching", "Rejected", #35
                       "Relieved", "Roar", "Sad", "Salute", "Sarcastic", #40
                       "Shaking", "Rubbing", "Shrugging", "Singing", "Arguing", #45
                       "Greeting", "Taunt", "Thumbs", "Stomping", "Strong", #50
                       "Surprised", "Talking", "Telling", "Terrified", "Thankful", #55
                       "Thinking", "Thoughtful", "Threatening", "Victory", "Waving", #60
                       "Whatever", "Wiping", "Yawn", "Yelling"] #65

G_BASIC_EMOTIONS = ['Happy', 'Excited', 'Surprise', 'Curious', 'Sad', 'Tired', 'Scared', 'Angry', 'Neutral',
                    'Confused', 'Embarrased', 'Disgust', 'Frustrated', 'Delight', 'Concerned', 'Madness', 'Mock',
                    'Dissatisfied', 'Hate', 'Annoyed']


