import os
path = r'C:\Users\Safat\OneDrive\Documents\matcode'
os.chdir(path)
import csv

with open('Smooth_front_x_final_bandpass.csv' , 'r') as file :
    csv_reader = csv.reader(file)
    lists_from_csv = []
    for row in csv_reader:
        lists_from_csv.append(row)

inner_list = []

for inside_list in lists_from_csv:
    inner_out_list = []
    for string in inside_list:
        inner_out_list.append(float(string))
    inner_list.append(inner_out_list)

tmp = []
final_list = []

for i in inner_list:
    for j in i:
        final_list.append(j)

print(final_list[:10])
main_list = []

for i in range(len(final_list)-1):
	if i==0:
		main_list.append(final_list[i])
	elif i%3 != 0:
		main_list.append(final_list[i])
	else:
		main_list.append(final_list[i])
		main_list.append((final_list[i] + final_list[i+1])/ 2)

print(len(main_list))
print(len(final_list))

with open('tmp.txt' , 'w') as file:
    for item in main_list:
        file.write('{}\n'.format(item))
