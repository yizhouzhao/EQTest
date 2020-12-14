import maya.cmds as cmds


def interpolate_object_all_time_attr(prefix, object_name, object_attr, interval=12):
    max_time = int(cmds.playbackOptions(maxTime=0, query=True))
    min_time = int(cmds.playbackOptions(minTime=0, query=True))

    for i in range(min_time, max_time, interval):
        cmds.currentTime(i)
        ori_attr_value = cmds.getAttr(prefix + object_name + "." + object_attr)
        cmds.setAttr(object_name + "." + object_attr, ori_attr_value)
        cmds.setKeyframe(object_name, attribute=object_attr)


# print(get_object_all_time_attr("mixamorig:Hips", "rotateX"))

prefix = "mixamorig:"
object_name = "Hips"
object_attr = "rotateX"


# interpolate_object_all_time_attr(prefix, object_name, object_attr)

def get_object_all_time_attr(object_name, object_attr):
    max_time = int(cmds.playbackOptions(maxTime=0, query=True))
    min_time = int(cmds.playbackOptions(minTime=0, query=True))

    ret = []
    for i in range(min_time, max_time):
        cmds.currentTime(i)
        ret.append(cmds.getAttr(object_name + "." + object_attr))

    return ret


print(get_object_all_time_attr(prefix + object_name, object_attr))
print(get_object_all_time_attr(object_name, object_attr))

