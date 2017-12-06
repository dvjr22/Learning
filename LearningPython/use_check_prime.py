# Python3

# import system and add path to import modules
# Only need to do this if not in same folder
import sys
if '/home/valdeslab/LearningPython/PythonModules' not in sys.path:
	sys.path.append('/home/valdeslab/LearningPython/PythonModules')

# import module 
import prime

# do stuff w/ module
answer = prime.checkIfPrime(54)
print (answer)

print (prime.checkIfPrime(13))
