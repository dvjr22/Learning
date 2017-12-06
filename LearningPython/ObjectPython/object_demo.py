#Python3

# import statements in various flavors
from Staff import Staff
import A as a
import ProgStaff
from MethodDemo import MethodDemo

from MyClass import SomeClass, SomeOtherClass

# import child class of Staff
from ManagementStaff import ManagementStaff
from BasicStaff import BasicStaff

officeStaff1 = Staff('Basic', 'Yvonne', 0)

print ("name")
print (officeStaff1.name)

print ("position")
print (officeStaff1.position)

print ("set to test")
officeStaff1.position = 'Test'
print ("set to Mngr")
officeStaff1.position = 'Manager'

print ("position")
print (officeStaff1.position)

print ("pay")
print (officeStaff1.pay)

officeStaff1.calculatePay()

print ("pay")
print (officeStaff1.pay)

print (officeStaff1)

# Name mangling demo
print ("A's turn")

A = a.A()

# This can be accessed directly even though it shouldn't be
print (A._y)

# This cannot and will cause an error
# print (A.__x)

# To access __x it must be accessed:
print (A._A__x)

# Self demo
print ("Self demo")

peter = ProgStaff.ProgStaff(2500)
john = ProgStaff.ProgStaff(2500)

print (peter.companyName)
print (ProgStaff.ProgStaff.companyName)

print ("changing the name of the school")
ProgStaff.ProgStaff.companyName = 'ProgrammingSchool'

print (peter.companyName)
print (ProgStaff.ProgStaff.companyName)

print ("Updating salary")
peter.salary = 2700
john.salary = 2400

print (peter.salary)
print (john.salary)

print ("instance method")
john.printInfo()
peter.printInfo()

print ("instance method using class name")
ProgStaff.ProgStaff.printInfo(john)

print ("Static and Class methods demo")
MethodDemo.classM()

print ("Create the object")
md1 = MethodDemo()
md1.classM()

print ("Static methods")
md1.staticM()
MethodDemo.staticM()

print ("MyClass...with extras")
sc = SomeClass()
sc.someMethod(100)
soc = SomeOtherClass()


print ("Here comes the sub class")
peter = BasicStaff('Peter', 0)
john = ManagementStaff('John', 0, 1000, 0)
print (peter)
print (john)

print ('Peter\'s pay = ', peter.calculatePay())
print ('John\'s performance bonus = ', john.calculatePerfBonus())













