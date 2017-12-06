# File IO

# use remove/rename
import os

# f = open ('myfile.txt', 'r')
f = open ('/home/valdeslab/LearningPython/myfile.txt', 'r')

print ("Print one line at a time")

# read in lines
firstline = f.readline()
secondline = f.readline()

# print lines
print (firstline)
print (secondline)
print ("\n")

print ("Print one line at a time w/o spaces")
# print line and set end character, default \n
print (firstline, end= "")
print (secondline, end= "")
print ("\n")
f.close()

# Get the lines in a for loop
print ("Print the entire file in a for loop")
f = open ('myfile.txt', 'r')
for line in f:
	print (line, end = '')
f.close()

# Append to files
f = open ('myfile.txt', 'a')
f.write('\nThis sentence will be appended.')
f.write('\nPython is fun!\n')
f.close

# Reading with a buffer 
#open for reading and writing
inputFile = open ('myfile.txt', 'r')
outputFile = open ('myoutputfile.txt', 'w')

# Read file 10 bytes at a time
msg = inputFile.read(10)

# Check length of variable msg, keep running unless 0
while len(msg):
	# Write to file
	outputFile.write(msg)
	# Proof of writing bytes vs lines
	# outputFile.write(msg + '\n')
	# Read next 10 bytes
	msg = inputFile.read(10)

# Close files
inputFile.close()
outputFile.close()

# Now working with binary files... images and video
inputFile = open ('myimage.jpg', 'rb')
outputFile = open ('myoutputimage.jpg', 'wb')

pic = inputFile.read(10)

# Check length of variable msg, keep running unless 0
while len(pic):
	# Write to file
	outputFile.write(pic)
	# Read next 10 bytes
	pic = inputFile.read(10)

# Close files
inputFile.close()
outputFile.close()

# Delete and rename
os.remove('myfile.txt')
os.rename('myoutputfile.txt', 'myfile.txt')
print ("\nEnd Program\n")










