#!/usr/bin/python3

# write python code to extract the digitization variation from the gcard files

import glob

files = glob.glob('*_binaryField.gcard')





def python_code():
	# loop over all the files in the array "files"
	# select the line containing the string DIGITIZATION_VARIATION
	for file in files:
		with open(file, 'r') as f:
			root_filename = file.split('_binaryField.gcard')[0]
			lines = f.readlines()
			for line in lines:
				if 'DIGITIZATION_VARIATION' in line:
					variation = line.split('value')[1].split('"')[1]
					print("        if self.configuration == \"" + root_filename + "\":\n          self.digi_variation = \'" + variation + "\'")

# write html table with the digitization variation
def md_write_html_table():
	# loop over all the files in the array "files"
	# select the line containing the string DIGITIZATION_VARIATION
	print("<ul>")
	for file in files:
		with open(file, 'r') as f:
			root_filename = file.split('_binaryField.gcard')[0]
			lines = f.readlines()
			for line in lines:
				if 'DIGITIZATION_VARIATION' in line:
					variation = line.split('value')[1].split('"')[1]
					print("<li> " + root_filename + " : " + variation + " </li> ")
	print(" </ul>")





# if the option -p is given, run python_code
# if the option -w is given, run md_writeup
if __name__ == "__main__":
	import sys
	if '-p' in sys.argv:
		python_code()
	if '-w' in sys.argv:
		md_write_html_table()
