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
Boar = cbind(Month, Len, Tb)
Boar
nrow(Boar) #Number of rows
ncol(Boar) #Number of cols
Boar[ , 1] #Row 1
Boar[ , 2] #Row 2
Boar[ , 3] #Row 3

#ex3
#We continue with the deer from Exercise 1. Instead of the cfunction that you
#used in Exercise 2 to combine the Tb data, can you do the same with the
#vectorfunction? Give the vector a different name, for example, Tb2.

Tb2 = vector(length = 7) 
Tb2[1] = 0
Tb2[2] = 0 # ... Tb[7] = 0
Tb2 = Tb #This is better, or...
Tb2 = c(0, 0, 1, NA, 0, 0, 0)
Tb2
Tb
is.vector(Tb2)
is.vector(Tb)

#ex4
#Create the following matrix in R and determine its transpose, its inverse, and
#multiple D with its inverse (the outcome should be the identity matrix).

Mat = matrix(nrow = 3, ncol = 3)
Mat[1, ] = c(1,2,3)
Mat[2, ] = c(4,2,1)
Mat[3, ] = c(2,3,0)
Mat
library(MASS)
#Transpose
t(Mat)
#Inverse
MatInv = ginv(Mat)
#Muliply matrix by inverse
Mat * MatInv

#ex5
#We continue with the deer from Exercises 1 to 3. Make a data frame that
#contains all the data presented in the table in Exercise 1. Suppose that you
#decide to square root transform the length data. Add the square root trans-
#formed data to the data frame. Do the same exercise with a list instead of a
#data.frame.What are the differences?

#Complete Boar Data
Farm = c("MO", "MO", "MO", "MO", "LN", "SE", "QM")
Month = c(11, 07, 07, NA, 09, 09, 11)
Year = c(00,00,01,NA,03,03,02)
Sex = c(1,2,2,2,1,2,2)
LenClass = rep(1, each = 7)
LenCt = c(75, 85, 91.6, 95, NA, 105.5, 106)
Ecervi = rep(0, each = 7)
Ecervi[4] = NA
Tb = c(0, 0, 1, NA, 0, 0, 0)
#Create Dataframe
Boar.DF = data.frame(Farm = Farm, Month = Month, Year = Year, Sex = Sex, LenClass = LenClass, LenCt = LenCt, Ecervi = Ecervi, Tb = Tb)
Boar.DF
#Create sqrt LenCt column
SqrLen = sqrt(LenCt)
#Add to dataframe
Boar.DF$SqrLen = SqrLen
Boar.DF

#List
Boar.List = list(Farm = Farm, Month = Month, Year = Year, Sex = Sex, LenClass = LenClass, LenCt = LenCt, Ecervi = Ecervi, Tb = T, SqrLen = SqrLen)
Boar.List

#Access
Boar.DF$Farm
Boar.List$Farm

#ex6
#The file ISIT.xls contains the bioluminescent data that were used to make Fig. 1.6.
#See the paragraph above this graph for a description. Prepare the spreadsheet (there
#are 4–5 problems you will need to solve) and export the data to an ascii file. Import
#the data into R using first the read.table function and then the scan function.
#Use two different names under which to store the data. What is the difference
#between them? Use the is.matrix and is.data.frame functions to answer
#this question.

#setwd("/home/diego/Learning/LearningR")
Isit.dataframe = read.table(file = "RBook/ISIT.txt", header = TRUE) #Read using read.table
Isit.vector = scan(file = "RBook/ISIT.txt", skip = 1) #Read using scan, skipping header row

#Check data construction
is.data.frame(Isit.dataframe)
is.data.frame(Isit.vector)

is.matrix(Isit.dataframe)
is.matrix(Isit.vector)

is.vector(Isit.dataframe)
is.vector(Isit.vector)

#ex7
Deer.dataframe = read.table(file = "RBook/Deer.txt", header = TRUE)
Deer.dataframe







