from MotionGPT import *

from Params import G_INTEACT_KEY_WORDS

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

        #data loader
        self.loader: FBXDataLoader = None
        self.keyword2index = {}

        #sceen shots
        self.sceenshots_folder = "E:/researches/EQTest/SocialAffordance/sceenshots"
        self.time_diff = 0
        self.distance = 2

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

    def SetLoader(self, loader: FBXDataLoader):
        self.loader = loader
        for keyword in G_INTEACT_KEY_WORDS:
            self.keyword2index[keyword] = []
            for i in range(len(loader.all_files) // 2): #only generate left side
                if keyword in loader.all_files[i]:
                    self.keyword2index[keyword].append(i)

    def SetReletiveDistance(self, z=2):
        c1_main = self.character1 + self.namespace_symbol + "FitSkeleton"
        c2_main = self.character2 + self.namespace_symbol + "FitSkeleton"

        self.distance = z

        self.mc.SetObjectWorldTransform(c1_main, [0, 0, z])
        self.mc.SetObjectWorldTransform(c2_main, [0, 0, -z])

    def SetSceneByKeyWords(self, word1: str, word2: str, td=0)->int:
        '''
        Set up animation to take scene shots in maya
        :param word1: key word 1
        :param word2: key word 2
        :param td: time difference
        :return: total number of sceen shots to take
        '''

        #--------set up time diff----------------------------
        self.time_diff = td

        if td == 0:
            start_time1 = frame_gap * 2 * td
            start_time2 = 0
        elif td == 1:
            start_time1 = 0
            start_time2 = frame_gap * 2 #delay start one second
        else:
            start_time1 = frame_gap * 2
            start_time2 = 0
        #------first character-----------------
        sample_idx1 = np.random.choice(self.keyword2index[word1])

        sample1 = torch.FloatTensor(self.loader.all_data[sample_idx1])
        sample1 = sample1.unsqueeze(1)
        #print(sample.shape)

        #sample1_mask = torch.LongTensor([[1]] * sample1.size(0))
        #print(sample_mask.shape)

        #sample1 = sample1.to(self.model.device)
        #sample1_mask = sample1_mask.to(self.model.device)


        self.SetCurrentCharacter(1)
        for i in range(min(8, len(sample1))):
            self.GenerateMayaPose(sample1[i][0], i * frame_gap + start_time1, translate_scale=self.translate_scales[0])

        #------second character-----------------
        sample_idx2 = np.random.choice(self.keyword2index[word2])

        sample2 = torch.FloatTensor(self.loader.all_data[sample_idx2])
        sample2 = sample2.unsqueeze(1)
        # print(sample.shape)

        #sample2_mask = torch.LongTensor([[1]] * sample2.size(0))
        # print(sample_mask.shape)

        #sample2 = sample2.to(self.model.device)
        #sample2_mask = sample2_mask.to(self.model.device)

        self.SetCurrentCharacter(2)
        for i in range(min(8, len(sample2))):
            self.GenerateMayaPose(sample2[i][0], i * frame_gap + start_time2, translate_scale=self.translate_scales[1])

        return min(min(8, len(sample1)) - 2 * td, min(8, len(sample2)) + 2 * td)


    def TakeSceenShots(self, sceen_shots: int, camera_list: list, keyword1, keyword2):
        folder = self.sceenshots_folder + "/" + keyword1 + "_" + keyword2 + "_" + \
                    str(self.time_diff) + "_" + str(self.distance)
        if not os.path.exists(folder):
            os.mkdir(folder)
            print("make new folder: ", folder)
        for i in range(sceen_shots):
            frame = i * frame_gap
            self.mc.SetCurrentTimeFrame(frame)

            for camera in camera_list:
                file_name = folder + "/" + camera + "_" + str(frame) + ".png"
                self.mc.ScreenShot(file_name, camera=camera)

    def MakeLabelingDataSet(self, keyword1, keyword2):
        distance_list = [2, 4, 8]
        time_diff_list = [-1, 0, 1]
        cameras = ["persp", "camera1", "camera2"]
        for dist in distance_list:
            for td in time_diff_list:
                self.SetReletiveDistance(dist)
                self.TakeSceenShots(self.SetSceneByKeyWords(keyword1, keyword2, td), cameras, keyword1, keyword2)

                self.mc.UndoToBeginning(20000)












