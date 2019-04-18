import os
import shutil
import csv
import pandas as pd

'''
Moves images into labeled directories to assist in labelling
in AutoML
'''
disease_type = "nv"
RootDir = r'/Users/yoel/DermaCure/HAM10000_images_part_1'
TargetFolder = r'/Users/yoel/DermaCure/' + disease_type + "/"
df = pd.read_csv(disease_type + '/' + disease_type + ".csv")
photo_names = df.image_id
count = 0

for root, dirs, files in os.walk(RootDir):
    for name in files:
        if name[0:12] in photo_names.tolist():
            count = count + 1
            print(count)
            SourceFolder = os.path.join(root,name)
            shutil.copy(SourceFolder, TargetFolder)