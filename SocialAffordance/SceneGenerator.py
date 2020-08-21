from MotionGPT import *

class SceneMaker(FBXDataMaker):
    def __init__(self, character1: str, character2: str,
                 PORT=12345, radian=True,
                 has_translate=True, has_finger=True):
        super(SceneMaker, self).__init__(PORT, radian, has_translate=has_translate, has_finger=has_finger)
        self.character1 = character1
        self.character2 = character2
        self.radian = radian
        self.namespace_symbol = "_"

        self.model = None

        self.translate_scales = [1.0, 1.0]
        self.ori_translate = [[0,0,0], [0,0,0]]

    def GetTranslateScales(self):
        hip1 = self.character1 + self.namespace_symbol + "Hips"
        hip1_translate = self.mc.GetObjectWorldTransform(hip1)

        spine1 = self.character1 + self.namespace_symbol + "Spine"
        spine1_translate = self.mc.GetObjectWorldTransform(spine1)

        scale1 = np.sqrt((hip1_translate[0] - spine1_translate[0])**2 +
                         (hip1_translate[1] - spine1_translate[1])**2 +
                         (hip1_translate[2] - spine1_translate[2])**2)

        local_scale1 = self.mc.GetObjectAttribute(self.character1 + self.namespace_symbol + "FitSkeleton", "scaleX")
        print("SceneGenerator: ", local_scale1)

        self.translate_scales[0] = scale1 / local_scale1[0]

        hip2 = self.character2 + self.namespace_symbol + "Hips"
        hip2_translate = self.mc.GetObjectWorldTransform(hip2)

        spine2 = self.character2 + self.namespace_symbol + "Spine"
        spine2_translate = self.mc.GetObjectWorldTransform(spine2)

        scale2 = np.sqrt((hip2_translate[0] - spine2_translate[0]) ** 2 +
                         (hip2_translate[1] - spine2_translate[1]) ** 2 +
                         (hip2_translate[2] - spine2_translate[2]) ** 2)

        local_scale2 = self.mc.GetObjectAttribute(self.character2 + self.namespace_symbol + "FitSkeleton", "scaleX")
        print("SceneGenerator: ", local_scale2)
        self.translate_scales[1] = scale2 / local_scale2[0]

    def SetCurrentCharacter(self, idx: int):
        self.namespace = self.character1 if idx == 1 else self.character2
