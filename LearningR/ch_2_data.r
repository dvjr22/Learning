#Chapter 2
#Topics:
# c(), cbind(), rbind()
# rep(), seq()
# vector()
# matrix(), data.frame(), list()


#Set data to variables
a = 59
b = 55
c = 53.5
d = 55
e = 52.5

Wing1 = a
Wing2 = b
Wing3 = c
Wing4 = d
Wing5 = e

#Math with variables
sqrt(Wing1)
2 * Wing1
Wing1 + Wing2
Wing1 + Wing2 + Wing3 + Wing4 + Wing5
(Wing1 + Wing2 + Wing3 + Wing4 + Wing5)/5

SQ.wing1 = sqrt(Wing1)
mul.w1 = 2 * Wing1
Sum.12 = Wing1 + Wing2
SUM12345 = Wing1 + Wing2 + Wing3 + Wing4 + Wing5
Av = (Wing1 + Wing2 + Wing3 + Wing4 + Wing5)/5

#Brackets to show value
(SQ.wing2 = sqrt(Wing2))

#Concatenate values with c() to create a vector of data
Wingcrd = c(a, b, c, d, e, 57.5, 53, 55)
Wingcrd
#Access data just like array
#Index start at 1
Wingcrd[1]
#Select a range
Wingcrd[1 : 5]
#Exclude nth value
Wingcrd[-2]
#Exclude range
Wingcrd[-2 : -5]

#Addition and assignment of new values
sum(Wingcrd)
s.win = sum(Wingcrd)
s.exclude = sum(Wingcrd[-2: -6])
s.win
s.exclude

#Test data
#Capital letters for Vars
Tarsus <- c(22.3, 19.7, 20.8, 20.3, 20.8, 21.5, 20.6, 21.5)
Head <- c(31.2, 30.4, 30.6, 30.3, 30.3, 30.8, 32.5, NA) #NA may cause issues for some functions
Wt <- c(9.5, 13.8, 14.8, 15.2, 15.5, 15.6, 15.6, 15.7)

#Functions like sum, min, and max will return NA
sum(Head)
?sum #Read documentation to solve
sum(Head, na.rm = TRUE)

#Combining variables
BirdData = c(Wingcrd, Tarsus, Head, Wt)
BirdData

Id <- c(1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4)
Id
#repeat()
#Produces the same vector as above
Id = rep(c(1, 2, 3, 4), each = 8)
Id
#And simplified using a range
Id = rep(1 : 4, each = 8)
Id

#seq()
#Produces a sequence
a = seq(from = 1, to = 4, by = 1)
a

#combine the two
a = seq(from = 1, to = 4, by = 1)
a
a = rep(a, each = 8)
a

VarNames = c("Wingcrd", "Tarsus", "Head", "Wt")
VarNames

Id2 = rep(VarNames, each = 8)
Id2

Id2NoEach = rep(VarNames, 8)
Id2NoEach

#cbind()
#Contains original varibles in columns
Z = cbind(Wingcrd, Tarsus, Head, Wt)
Z
#Access Z
#Var[row, column] where row/column can be a range
Z[ , 1] #column 1
Z[1:8, 1] #column 1
Z[2, ] #row 2
Z[2, 1:4] #row2

#Experiments with access
Z[1, 1] #row 1, column 1
Z[ , 2:3] #column 2 and 3
X = Z[4, 4] #row4, column4
X
Y = Z[ , 4] #column 4
Y
W = Z[ , -3] #exclude column 3
W
D = Z[ , c(1, 3, 4)] #column 1, 3, 4
D
E = Z [ , c(-1, -3)] #exclude column 1 and 3
E
#dimensions of Z
dim(Z) # returns row columns
Zrow = nrow(Z) #assign row to var
Zcol = ncol(Z) #assign col to var

#rbind()
#Arrange var in rows
Z2 = rbind(Wingcrd, Tarsus, Head, Wt)
Z2

?edit
?fix

#vector()
#Create a vector...yay!
W = vector(length = 8)
W #Will return vecotr of FALSE
W[1] = 59
W[2] = 55
W[3] = 53.5
W[4] = 55
W[5] = 52.5
W[6] = 57.5
W[7] = 53
W[8] = 55
W
#Access of vector
W[1]
W[1:4]
W[2:6]
W[-2]
W[c(1,2,3)]

#matrix()
#Create a matrix with dimensions
Dmat = matrix(nrow = 8, ncol = 4)
Dmat
#Load data
Dmat[ , 1] = Wingcrd
Dmat[ , 2] = c(22.3, 19.7, 20.8, 20.3, 20.8, 21.5, 20.6, 21.5) #Tarsus
Dmat[ , 3] = Head
Dmat[ , 4] = Wt
Dmat
#Add column names
colnames(Dmat) = VarNames #colnames(Dmat) = c("Wingcrd", "Tarsus", "Head","Wt")
Dmat
#Fill by element
Dmat[1, 1] = 59.0 #Row 1, Col 1
Dmat[1, 2] = 22.3 #Row 1, Col 2
Dmat
#More efficient way to create matrix
Dmat2 = as.matrix(cbind(Wingcrd, Tarsus, Head, Wt))
#Both matrix are the same
Dmat  
Dmat2
#Check if is a matrix
is.matrix(Dmat)
is.matrix(Wingcrd)
#Transpose a matrix
t(Dmat)
#Matrix multiplication
Dmat * Dmat2

#data.frame()
#Combine data of same lenght
#Allows for changes to data with affecting original.
Dfrm = data.frame(WC = Wingcrd, TS = Tarsus, HD = Head, W = Wt)
Dfrm
#Combine original with transformed data
Dfrm = data.frame(WC = Wingcrd, TS = Tarsus, HD = Head, W = Wt, Wsq = sqrt(Wt)) #sqrt of Wt data as new data
Dfrm

#Prove variables in new objects are seprate from var that created them.
Wt
rm(Wt)
Wt #Gives error
Dfrm$W #returns data in frame that was deleted
Wt = Dfrm$W #Bring it back

#list()
#Can hold a variety of data in varying formats
x1 = c(1, 2, 3)
x2 = c("a", "b", "c", "d")
x3 = 3
x4 = matrix(nrow = 2, ncol =2)
x4[ , 1] = c(1, 2)
x4[ , 2] = c(3, 4)
Y = list(x1 = x1, x2 = x2, x3 = x3, x4 = x4)
Y
#Access elements in list
Y$x2
Y$x1

#Apply linear regression to see list output
M = lm(WC ~ Wt, data = Dfrm)
#See data
M
names(M)
#Access values
M$coefficients
M$residuals

#Store all bird data in a list
AllData = list(BirdData = BirdData, Id = Id2, Z = Z, VarNames = VarNames)
AllData

#Entering Data
#Best to use a col = var, row = sample format
#Import data
#Read tab delimited data and store in a dataframe
#header = TRUE means first row has headings
Squid = read.table(file = "/home/valdeslab/Learning/LearningR/RBook/squid.txt", header = TRUE)
#To use a different delimeter
#Squid = read.table(file = "/home/valdeslab/Learning/LearningR/RBook/squid.txt", header = TRUE, dec = ",")
Squid
#Set wd and get data
setwd("/home/valdeslab/Learning/LearningR") #This resets with every session
Test = read.table(file = "RBook/squid.txt", header = TRUE)
rm(Test)
#scan() will import numerical data into a matrix
?scan
Test = scan("RBook/squid.txt", skip = 1)
Test
rm(Test)

#Accessing data from other statistical packages
library(foreign)
?read.mtp #read data from Minitab files

#Can also import data directly from db
#This package has to be installed and requires drivers. 
#See pg 52 in A Beginners Guide to R
#Packages exist for Oracle and MySQL
#library(RODBC)







