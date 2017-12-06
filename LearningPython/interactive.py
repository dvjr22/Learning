# Python3

print ("Interactive Python\n")

# Use raw_input() f/ strings
myName = input("Please enter your name: ")

# can use normal input() for numbers
# myAge = input("What about your age: ")
# myAge = input("Hi %s, what about your age: " %(myName))
myAge = input("Hi {}, what about your age: ".format(myName))

print ("Hello World, my name is", myName, "and I am", myAge, "years old.")

# Triple quotes
# This will print the quote as written with \n appearing in output
print ('''Hello World.
My name is Diego and 
I am too old to be in college.''')

# Escape characters
# Works like Perl...Java...PHP
print ('hello\tworld')
print ('hello\nworld')
print ('\\')
print ("I am 5'9\" tall")
print ('I am 5\'9" tall')
print (r'hello\tworld')
