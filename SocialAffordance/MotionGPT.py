from DataAPI import *

class FBXDataMaker():
    def __init__(self, fbx_path: str):
        self.mc = MayaController()
