import os
import pandas as pd
'''
Generates csv matching image file paths in Google Cloud Storage
with its respective label.
'''

data_folders = ['akiec',
               'bcc',
               'bkl',
               'df',
               'mel',
               'nv',
               'vasc']

filenames = [os.listdir(f) for f in data_folders]
files_dict = dict(zip(data_folders, filenames))
base_gcs_path = 'gs://dermacure-vcm/HAM10000_images/'
data_array = []

for (dict_key, files_list) in files_dict.items():
    for filename in files_list:
        if '.jpg' not in filename: 
            continue # don't include non-photos

        label = dict_key
        data_array.append((base_gcs_path + dict_key + '/' + filename , label))

dataframe = pd.DataFrame(data_array)
dataframe.to_csv('labeled_data.csv', index=False, header=False)

os.system("gsutil cp labeled_data.csv " + base_gcs_path)