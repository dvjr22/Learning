#Exercises ch 2
#ex 1
#Using the c function, create a variable that contains the length values of the
#seven animals. Also create a variable that contains the Tb values. Include the
#NAs. What is the average length of the seven animals?
Len = c(75, 85, 91.6, 95, NA, 105.5, 106)
Tb = c(0, 0, 1, NA, 0, 0, 0)
?mean
AvgLen = mean(Len, na.rm = TRUE)

#ex 2
#We continue with the deer from Exercise 1. First create variables Farm and
#Month that contain the relevant information. Note that Farm is a string of
#characters. Use the cbind command to combine month, length, and Tb data,
#and store the results in the variable, Boar. Make sure that you can extract rows,
#columns, and elements of Boar. Use the dim, nrow, and ncol functions to
#determine the number of animals and variables in Boar.

Farm = c("MO", "MO", "MO", "MO", "LN", "SE", "QM")
Month = c(11, 07, 07, NA, 09, 09, 11)

