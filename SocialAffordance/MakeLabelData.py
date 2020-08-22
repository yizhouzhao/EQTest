from SceneGenerator import *

from datetime import datetime

if __name__ == "__main__":
    print("G_INTEACT_KEY_WORDS number:", len(G_INTEACT_KEY_WORDS))

    now = datetime.now()
    date_time = now.strftime("%Y_%m_%d_%H_%M_%S" + "_nr")
    print("date and time:", date_time)

    sm = SceneMaker("woman2_geo_rig_copy", "man5_geo_rig_copy")
    print("has finger? ", sm.has_finger, "   has root translate? ", sm.has_translate)

    sm.mc.UndoToBeginning(10000)
    sm.GetTranslateScales()

    sm.LoadModel("runs/2020_08_21_12_15_47_nr.pth")

    # loader
    loader = FBXDataLoader("FBXDataStand", radian=True, has_translate=True, has_finger=True)
    loader.LoadData()
    loader.PrepareTrainingData(frame_gap)

    sm.SetLoader(loader)

    for keyword1 in tqdm(G_INTEACT_KEY_WORDS):
        for keyword2 in tqdm(G_INTEACT_KEY_WORDS):
            sm.MakeLabelingDataSet(keyword1, keyword1)



