# Import everything needed to edit video clips
from moviepy.editor import *
import matplotlib.pyplot as plt
import matplotlib.patches as patches

# TODO: read scene boundaries from MovieGraph/mg_videoinfo
# Load myHolidays.mp4 and select the subclip 00:00:50 - 00:00:60
clip = VideoFileClip("/home/liang/Desktop/test.mp4").subclip(37.955, 125.709)
clip.write_videofile("myHolidays_edited.mp4")
# clip = VideoFileClip("myHolidays_edited.mp4")
im = clip.get_frame(t=76.95)

# Create figure and axes
fig, ax = plt.subplots()
# plt.axis("off")

# Display the image
ax.imshow(im)

# Create a Rectangle patch
# TODO: read bbox from MovieGraph/mg_ftracks/ftracks
rect = patches.Rectangle((2100, 1200),
                         350,
                         300,
                         linewidth=1,
                         edgecolor='r',
                         facecolor='none')
# Add the patch to the Axes
ax.add_patch(rect)

plt.text(2100, 1600, "Professor McGonagall", color='red')
plt.show()