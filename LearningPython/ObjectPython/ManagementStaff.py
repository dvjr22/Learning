# Python Object Oriented demo
# Python3
# ManagementStaff Class subclass of Staff

# import Staff super class
from Staff import Staff

class ManagementStaff(Staff):

	# Class initializer
	def __init__ (self, pName, pPay, pAllowance, pBonus):

		# call method in parent class
		# Don't need to pass a value for self
		super().__init__('Manager', pName, pPay)
		# instance variables for ManagementStaff class
		self.allowance = pAllowance
		self.bonus = pBonus

	def calculatePay(self):

		# call to method in parent class and assign value to local var
		basicPay = suber().calculatePay()
		# add results to instance variable
		self.pay = basicPay + self.allowance
		return self.pay

	def calculatePerfBonus(self):

		prompt = 'Enter performance grade %s: ' %(self.name)
		grade = input(prompt)
		if (grade == 'A'):
			self.bonus = 1000
		else:
			self.bonus = 0
		return self.bonus
