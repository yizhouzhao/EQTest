import torch

g_position_x_range = [5, 10]

# Root path: Social Affordacne
g_default_pose_file_path = '../StudioLibrary/Poses/Body/Stand.pose/pose.json'


# Data
frame_gap = 12
data_file = "FBXDataStand"
radian = True

# Train
h_dim = 128
z_dim = 10
n_layers = 2
batch_size = 16
n_epochs = 50
clip = 10
learning_rate = 5e-4
print_every = 10
