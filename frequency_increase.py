import os
path = r'C:\Users\Safat\OneDrive\Documents\matcode'
os.chdir(path)
import csv

with open('smooth_back_x_bandpass.csv' , 'r') as file :
    csv_reader = csv.reader(file)
    lists_from_csv = []
    for row in csv_reader:
        lists_from_csv.append(row)

new_lists = []

for i,j in enumerate(lists_from_csv):
    if i%4 != 0:
        new_lists.append(j)

with open('tmp.txt', 'w') as writefile:
    for item in new_lists:
        writefile.write("{}\n".format(item))
        
