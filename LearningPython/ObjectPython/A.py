# Python Object Oriented demo
# Name mangling
# A class

class A:

	def __init__(self):

		# Cannot be accessed directly unless using Name mangling
		self.__x = 5
		# Recommended not be accessed directly but can
		self._y = 6
