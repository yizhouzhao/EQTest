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
                       "Dismissing", "Dizzy", "Drunk", "Dwarf", "Excited", #15
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

G_MOTION2VAD = {"Acknowledging": [0.786, 0.37, 0.661], "Agreeing": [0.854, 0.48, 0.557], "Angry": [0.122, 0.83, 0.604],
                "Head Shake": [0.885, 0.539, 0.618] #greet
                "Bash": [0.385, 0.546, 0.463], "Kiss": [0.967, 0.813, 0.63], "Bored": [0.153, 0.167, 0.196],
                "Idle": [0.179, 0.167, 0.112], "Charge": [0.51, 0.633, 0.785], "Clapping": [0.823, 0.894, 0.686],
                "Cocky": [0.26, 0.784, 0.519], "Crazy": [0.156, 0.843, 0.321], "Crying": [0.153, 0.704, 0.208],
                "Defeat": [0.092, 0.5, 0.224], "Disappointed": [0.071, 0.472, 0.241], "Dismissing": [0.167, 0.541, 0.509],
                "Dizzy": [0.199, 0.582, 0.193], "Drunk": [0.194, 0.8, 0.25], "Dwarf": [0.37, 0.34, 0.288],
                "Excited": [0.908, 0.931, 0.709], "Fist": [0.333, 0.686, 0.481], "Focus" : [0.69, 0.382, 0.648],
                "Forward": [0.873, 0.412, 0.75], "Happy": [1.0, 0.735, 0.772],
                "Head Nod": [0.59, 0.367, 0.427] #nod,
                "Joyful": [0.99, 0.74, 0.667], "Kneeling": [0.245, 0.435, 0.144], "Laughing": [0.906, 0.596, 0.534],
                "Look": [0.719, 0.429, 0.615], "Loser": [0.083, 0.51, 0.155], "Neck": [0.541, 0.245, 0.345],
                "Nervously": [0.235, 0.82, 0.213], "Offensive": [0.135, 0.882, 0.6], "Pain": [0.012, 0.765, 0.395],
                "Pointing": [0.49, 0.193, 0.431], "Pouting": [0.263, 0.471, 0.27], "Praying": [0.646, 0.235, 0.415],
                "Bow": [0.53, 0.306, 0.408], "Reaching": [0.719, 0.625, 0.69], "Rejected": [0.102, 0.48, 0.25],
                "Relieved": [0.896, 0.314, 0.391], "Roar": [0.427, 0.816, 0.675], "Sad": [0.225, 0.333, 0.149],
                "Salute": [0.833, 0.542, 0.681], "Sarcastic": [0.397, 0.781, 0.298], "Shaking": [0.275, 0.849, 0.255],
                "Rubbing": [0.406, 0.569, 0.44], "Shrugging": [0.208, 0.296, 0.278], "Singing": [0.885, 0.594, 0.528],
                "Arguing": [0.093, 0.798, 0.525], "Greeting": [0.854, 0.556, 0.51], "Taunt": [0.083, 0.696, 0.355],
                "Thumbs": [0.673, 0.271, 0.361], "Stomping": [0.365, 0.565, 0.438], "Strong": [0.912, 0.745, 0.895],
                "Surprised": [0.784, 0.855, 0.539], "Talking": [0.833, 0.346, 0.594], "Telling": [0.551, 0.35, 0.457],
                "Terrified": [0.09, 0.902, 0.387], "Thankful": [0.969, 0.344, 0.714], "Thinking": [0.72, 0.308, 0.595],
                "Thoughtful": [0.667, 0.29, 0.527], "Threatening": [0.071, 0.875, 0.652], "Victory": [0.938, 0.735, 0.931],
                "Waving": [0.622, 0.491, 0.49],
                "Whatever": [0.255, 0.431, 0.125] #careless
                "Wiping": [0.663, 0.427, 0.551], "Yawn": [0.385, 0.12, 0.139], "Yelling": [0.323, 0.939, 0.565]
                }


G_BASIC_EMOTIONS = ['Happy', 'Excited', 'Surprise', 'Curious', 'Sad', 'Tired', 'Scared', 'Angry', 'Neutral',
                    'Confused', 'Embarrased', 'Disgust', 'Frustrated', 'Delight', 'Concerned', 'Madness', 'Mock',
                    'Dissatisfied', 'Hate', 'Annoyed']


G_GENERATION2DOMINANCE = {"younger": -1.0, "same": 0.0, "elder": 1.0}
G_RELATION2INTIMACY = {"society": -1.0, "friend": 0.0, "family": 1.0}

G_EMOTION2VAD = {"Happy": [1, 0.735, 0.772],  "Excited": [0.908, 0.931, 0.709],  "Surprise": [0.784, 0.855, 0.539],
            "Curious": [0.635, 0.6, 0.483],  "Sad": [0.225, 0.335, 0.149],  "Tired": [0.125, 0.317, 0.191],
            "Scared": [0.146, 0.828, 0.185],  "Angry": [0.122, 0.83, 0.604],  "Neutral": [0.469, 0.184, 0.357],
            "Confused": [0.22, 0.65, 0.179],  "Embarrased": [0.184, 0.56, 0.246],  "Disgust": [0.052, 0.775, 0.317],
            "Frustrated": [0.08, 0.651, 0.255],  "Delight": [0.949, 0.666, 0.647],  "Concerned": [0.292, 0.698, 0.35],
            "Madness": [0.104, 0.804, 0.44],  "Mock": [0.36, 0.606, 0.618],  "Dissatisfied": [0.042, 0.561, 0.291],
            "Hate": [0.03, 0.802, 0.43],  "Annoyed": [0.104, 0.783, 0.345]}

