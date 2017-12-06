# The journey to learn Python continues
# needs to run in python2.x b/c the lack of () in print functions

newString = "Hello world"
print newString
newString.replace("world", "universe")
print newString
newString = newString.replace("world", "why does this one work")
print newString

# functions 
def checkIfPrime(numberToCheck):
	for x in range(2, numberToCheck):
		if (numberToCheck % x == 0):
			return False
	return True

answer = checkIfPrime(13)
print answer

message1 = "Global Variable"

def myFunction():
	print "\nINSINDE THE FUNCTION"
	# Global variables are accessible inside a function
	print message1
	#Declaring a local variable
	message2 = "Local Variable"
	print message2

myFunction()
print "\nOUTSIDE THE FUNCTION"
# Global variables are accessible
print message1
# Local variables are NOT accessible outside function
# print message2

def myFunction2():
	message1 = "Local Variable (shares same name as global variable"
	print "\nINSIDE THE FUNCTION"
	print message1

myFunction2()
# Print message1 outside function
print "\nOUTSIDE THE FUNCTION"
print message1

# Default values
def someFunction(a, b, c = 1, d = 2, e = 3):
	print a, b, c, d, e

someFunction(10, 20)
someFunction(10, 20, 30, 40)

# Unknown number of variables
def addNumbers(*num):
	sum = 0
	for i in num:
		sum = sum + i
	print sum

addNumbers(1, 2, 3, 4, 5)
addNumbers(1, 2, 3, 4, 5, 6, 7, 8)

# keyworded variable length... essentially a dictionary
def printMemberAge(**age):
	for i, j in age.items():
		print "Name = %s, Age = %s" % (i, j)


printMemberAge(Peter = 5, John = 7)
printMemberAge(Peter = 5, John = 7, Yvonee = 10)

# Mixing it all up, must be in this order
def someFunction2(farg, *args, **kwargs):
	return True

# importing and using modules
# Import whole module
import random
x = random.randrange(1, 10)
print x
print random.randrange(2, 20)

# Import and change name for usage
import random as r
print r.randrange(100, 200)

# import specific stuff and no longer use dot notation
from random import randrange, randint
print randrange(50, 60)
print randint(60, 70)






















