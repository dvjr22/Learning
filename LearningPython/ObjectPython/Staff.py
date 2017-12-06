# Python Object Oriented demo
# Staff class

class Staff(object):

	# Class initializer
	# Called whenever class is initialized
	def __init__ (self, pPosition, pName, pPay):

		# _variableName is a convention to not access a variable directly
		# self defines instance variables
		self._position = pPosition
		self.name = pName
		self.pay = pPay
		print('Creating Staff object')

	# Special method
	# Create a string representation of object
	def __str__ (self):
		return "Position = %s, Name = %s, Pay = %d" %(self._position, self.name, self.pay)

	# Method to calculate pay
	def calculatePay(self):
		prompt = '\nEnter number of hours worked for %s: ' %(self.name)
		hours = input(prompt)
		prompt = 'Enter the hourly rate for %s: ' %(self.name)
		hourlyRate = input(prompt)
		self.pay = int(hours)*int(hourlyRate)
		return self.pay


	# Decorator
	# Allows alteration of method that follows
	# Whenever a user tries to use this method, the one that follows will be used
	@property
	def position(self):
		print("Getter Method")
		return self._position

	# Allows setting the value in the object like a variable
	@position.setter
	def position(self, value):
		if value == 'Manager' or value == 'Basic':
			self._position = value
		else:
			print('Position is invalid. No changes Made.')
