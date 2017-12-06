# Python Object Oriented demo
# static and class methods
# Rarely used, in Python instance methods are all that is required

class MethodDemo:

	a = 1

	# Class methods must be defined with class method decorator
	# Class methods must have a class object as the 1st parameter
	# Used to assess class variables
	@classmethod
	def classM(cls):
		print ("Class Method. cls.a = ", cls.a)

	# Static methods must be defined with static method decorator
	# Doesn't take self or cls parameter
	@staticmethod
	def staticM():
		print("Static method")



