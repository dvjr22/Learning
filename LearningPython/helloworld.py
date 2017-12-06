#Prints the words "hello world"
# needs to run in python2.x b/c the lack of () in print functions

print ("Hello World")

userAge, userName = 30, 'Peter'

print userAge
print userName
print userAge, userName
print userName, "is ", userAge
print (userName, "is", userAge)


# Math
x, y = 5, 2

print "x =", x
print "y =", y
print "Addition", x + y
print "Subtraction", x - y
print "Subtraction again", y - x
print "Multiplication", x * y
print "Division", x/y
print "Division again", y/x
print "Floor division", x//y
print "Modulus", x%y
print "Exponent", x**y
x += 2
y += 3
print "increment x", x
print "increment y", y

# Strings
print "\n"
peter = "Peter"
lee = "lee"
name = peter + lee
print peter, "'s last name is", lee, "making his full name:", name
name = peter + " " + lee
print peter, "'s last name is", lee, "making his full name:", name

peter = peter.upper()
print peter

test = '\n%d days and %d nights' % (40, 40)
print test

brand = 'Apple'
exchangeRate = 1.235235245

# %s is a string
# %d is an integer, can add a number between, ie: %5d
# %f is a float, where numbers are total length and decimal places
print "\n% stuff"
message = 'The price of this %s laptop is %d USD and the exhange rate is %4.2f USD to 1 EUR' % (brand, 1299, exchangeRate)
print message

# Using format()
# braces are formatted w/ position : format w/o any spaces
print "\nUsing format() w & w/o variables"
message = 'The price of this {0:s} laptop is {1:d} USD and the exchange rate is {2:4.2f} USD to 1 EUR' .format('Apple', 1299, 1.235235245)
print message

message = 'The price of this {0:s} laptop is {1:d} USD and the exchange rate is {2:4.2f} USD to 1 EUR' .format(brand, 1299, exchangeRate)
print message

print "\nLet the compiler do the work"
message = 'The price of this {} laptop is {} USD and the exchange rate is {} USD to 1 EUR' .format(brand, 1299, exchangeRate)
print message

# More formatting
print "\nMore formatting"
message1 = '{0} is easier than {1}' .format('Python', 'Java')
message2 = '{1} is easier than {0}' .format('Python', 'Java')
message3 = '{:10.2f} and {:d}' .format(1.234234234, 12)
message4 = '{}' .format(1.234234234)

print message1
print message2
print message3
print message4

print "\nLet's test this out\n"
print message1, "\n", message2, "\n", message3, "\n", message4

# Conversions
print "\nConversions"
x = 1.23
print x
# Convert float to int
y = int(x)
print y

# Convert int to float
x = float(y)
print x

#strings
print "Numbers as strings"
a = "1"
b = "2.365465"
print a, b
print "Add that together"
print a+b

# Convert strings to float/int
c = float(b)
d = int(a)
e = int(3.265)
print c, d
print "Add that together"
print c + d
print e

print "\nMore conversions, int float to string"
num = str(c)
num2 = str(d)
num3 = str(e)
print num, num2, num3

# Lists
print "\nLists"
# Create a list
userAge = [21, 22, 23, 24, 25]
userAge2 = userAge
# Grab the list from index 2 - (4-1)
userAge3 = userAge[2:4]
userAge4 = userAge[2:5]
# Grab the list from 0 - (5-1) skipping by 2
userAge5 = userAge[0:5:2]
print userAge
print userAge2
print userAge3
print userAge4
print userAge5

print "\nLists basically work just like they do in every other\nC based language"
userAge[1] = 5
userAge[0] = "This is a test"
userAge[2] = 12.365
print userAge
print "Back to normal"
userAge = userAge2
print userAge
print "\nWoo, woo, woo, that wasn't supposed to happen"
print "Reset for real"
userAge = [21, 22, 23, 24, 25]
userAge2 = userAge
print userAge
print userAge2
print "Set userAge"
userAge[1] = 5
userAge[0] = "This is a test"
userAge[2] = 12.365
# Changes made to userAge are applied to userAge2
print "Both lists"
print userAge
print userAge2
# But not to the lists that took a slice
print userAge3
print userAge4
print userAge5

# Append / Delete
print "\nAppend and delete"
print userAge3
userAge3.append(100)
print userAge3
del userAge3[1]
print userAge3

# Print stuff
print "\nPrint stuff"
print userAge
print userAge[1]
print userAge[-1]
print userAge[0:3]
print userAge[0:5:2]
userAge.append("Yeah, buddy, YEAH!")
print userAge
del userAge[0]
print userAge
del userAge[0:5]
print userAge

# Tuples
print "\nTuples are like static final variables"
monthsOfYear = ("Jan", "Feb", "Mar", "Apr",
		"May", "Jun", "Jul", "Aug",
		"Sep", "Oct", "Nov", "Dec")

print monthsOfYear
print "My birthday is in", monthsOfYear[4]

# Dictionary
print "\nDictionary, baby, what can you do fo' me"
print "Well, basically, this mofo is like a hashmap complete with keys and data"
print "That basically works just like an array can be made to work in php or a hashmap in perl"

myDictionary = {
	"Peter"		:	38,
	"John"		:	51,
	"Betty"		:	21,
	"Alex"		:	13
}
print myDictionary

# Different declarations
print "I do declare, I can vary my declares"
ages = dict(
	Peter = 38,
	John =	51,
	Betty = 21,
	Alex = 13
)
print ages
print "\nNow for accessing"
# Keys must be in quotes and are case sensitive
print "Peter is", myDictionary["Peter"]
print "Peter is still", ages["Peter"], "in the other dictionary\n"

# Changing the dictionary
print ages
print "Changing all the data"
ages["Peter"] = 39
ages["John"] = 52
ages["Betty"] = 22
ages["Alex"] = 14
print ages
print "Add Bruce"
ages["Bruce"] = 32
print ages
print "Add Diana"
ages["Diana"] = 152
print ages
print "Remove John and Betty"
del ages["Betty"], ages["John"]
print ages

# Types can be different for keys and data
myDict = {
	"one"	:	1.35,
	2.5	:	"Two point five",
	3	:	7.92
}
print myDict
