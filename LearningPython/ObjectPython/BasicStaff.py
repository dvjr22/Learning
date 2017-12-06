# Python Object Oriented demo
# Python3
# BasicStaff Class subclass of Staff

# import Staff super class
from Staff import Staff

class BasicStaff(Staff):

	def __init__(self, pName, pPay):
		super().__init__('Basic', pName, pPay)
