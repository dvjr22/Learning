# Python Object Oriented self demo
# ProgStaff class

class ProgStaff:

	# Class variable
	companyName = 'ProgrammingLab'

	def __init__(self, pSalary):

		#instance variable
		self.salary = pSalary

	# Instance method
	# Has self as one of the parameters
	# self must always be first parameter
	def printInfo(self):
		
		# Access class variable
		print ("Company name is", ProgStaff.companyName)
		# Access instance variable
		print ("Salary is", self.salary)


