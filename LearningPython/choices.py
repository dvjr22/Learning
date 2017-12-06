# needs to run in python2.x b/c the lack of () in print functions

print "Making dem choices\n"

userInput = input('enter 1 or 2: ')

# if else statements
# no braces, use indents...
if userInput == 1:
	print "Hello World"
	print "How are you?"
elif userInput == 2:
	print "Python Rocks!"
	print "I love Python"
else:
	print "You did not enter a valid number"

# Variations of if elif
num1 = 12 if userInput == 1 else 13
print num1
print "This is task A\n" if userInput == 1 else "This is task B\n"

# for loop
pets = ['cats', 'dogs', 'rabbits', 'hamsters']
# Works like a foreach loop
for myPets in pets:
	print myPets

print

# Display the index
for index, myPets in enumerate(pets):
	print index, myPets

print

# Loop through dictionary
age = {
	'Peter'		:	5,
	'John'		:	7
}

print

for i in age:
	print i

# Loop through and get the key
for i in age:
	print "Name = %s, Age = %d" %(i, age[i])

print 

for i in age:
	print i, age[i]

print 

# Loop through a string
message = 'Hello'

for i in message:
	print i

print

# Range
print range(5)
print range(3, 10)
print range(4, 10, 2)

print

# Lets see if I can use range in a for loop
for i in range(4):
	print pets[i]

print

# while loops
counter = 5

while counter > 0:
	print "Counter = ", counter
	# counter = counter - 1
	counter -= 1

print

# break
j = 0

for i in range(5):
	j += 2
	print 'i = ', i, ', j = ', j
	if j == 6:
		break

print

# Continue?
j = 0

for i in range(5):
	j += 2
	print 'i = ', i, ', j = ', j
	if j == 6:
		continue
	print "I will be skipped over if j = 6"

print

# try and except
try:
	answer = 12/0
	print answer
except:
	print "An error occurred"

print "\nAnd now for some more complex stuff"

try:
	# This needs to be raw_input to trigger the ValueError
	num = int(raw_input("Please enter a number: "))
	num2 = int(raw_input("Please enter another number: "))
	answer = num/num2
	print "The answer is ", answer
	file = open("missing.txt", 'r')
# These are predefined error types in Python
except ValueError:
	print "Error: you did not enter a number"
except ZeroDivisionError:
	print "Error: Cannot divide by zero"
except IOError as e:
	print "Error: Cannot open file"
	print "This is the default error: ", e
except Exception as e:
	print "Unknown error: ", e












