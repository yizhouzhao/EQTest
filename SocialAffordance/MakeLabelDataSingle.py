from MotionGPT import *
from datetime import datetime

RENDER_EMOTION = True

if __name__ == "__main__":
    now = datetime.now()
    date_time = now.strftime("%Y_%m_%d_%H_%M_%S" + "_nr")
    print("date and time:", date_time)

    print("G_INTEACT_KEY_WORDS number:", len(G_INTEACT_KEY_WORDS))
    print(os.getcwd())

    maker = FBXDataMaker(12345, radian=True)
    print("has finger? ", maker.has_finger, "   has root translate? ", maker.has_translate)

    maker.sceenshots_folder = "E:/researches/EQTest/SocialAffordance/sceenshots"

    maker.mc.UndoToBeginning(10000)
    print(maker.GetModelNameSpace())
    print(maker.GetTranslateScale())

    if RENDER_EMOTION:
        maker.image_sizes = [[1024, 1024]]
        maker.camera_list = ["camera2"]
        maker.EmotionPCA()

        basic_emotions = list(maker.emotion2vad.keys())[:20]
        print(basic_emotions)
        exit()

        for i in range(len(basic_emotions)):
            # for j in range(len(basic_emotions)):
            start_emotion = basic_emotions[i]
            #     end_emotion = basic_emotions[j]
            #
            #     print("emotion: ", start_emotion, end_emotion)

            maker.GenerateMayaFace(maker.emotion2vad[start_emotion], 0)

            maker.TakeSceenShots(1, maker.camera_list, maker.image_sizes, start_emotion, make_folder=False)

    else:
        maker.image_sizes = [[512, 1024]]
        maker.camera_list = ["camera1"]

        # loader
        loader = FBXDataLoader("FBXDataStand", radian=True, has_translate=True, has_finger=True)
        loader.LoadData()
        loader.PrepareTrainingData(12)

        maker.SetLoader(loader)

        for keyword in ["Acknowledging", "Agreeing", "Angry", "Head Shake", "Bash", #0
                       "Kiss", "Bored", "Idle", "Charge", "Clapping", #5
                       "Cocky", "Crazy", "Crying", "Defeat", "Disappointed", #10
                       "Dismissing", "Dizzy", "Drunk", "Dwarf", "Excited", #15w
                       "Fist", "Focus", "Forward", "Happy", "Head Nod", #20
                       "Joyful", "Kneeling", "Laughing", "Look", "Loser", #25
                       "Neck", "Nervously", "Offensive", "Pain", "Pointing", #30
                       "Pouting", "Praying", "Bow", "Reaching", "Rejected", #35
                       "Relieved", "Roar", "Sad", "Salute", "Sarcastic", #40
                       "Shaking", "Rubbing", "Shrugging", "Singing", "Arguing", #45
                       "Greeting", "Taunt", "Thumbs", "Stomping", "Strong"]:
            steps = maker.SetSceneByKeyWord(keyword)
            maker.TakeSceenShots(steps, maker.camera_list, maker.image_sizes, keyword)

    #maker.mc.UndoToBeginning(10000)

    now = datetime.now()
    date_time = now.strftime("%Y_%m_%d_%H_%M_%S" + "_nr")
    print("date and time:", date_time)