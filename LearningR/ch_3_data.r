#Chapter 3
#Topics:
# Variable access, conditional selection
# str()
# attach(), detach()
# unique()
# order()
# merge()
# factor()

#setwd("/home/diego/Learning/LearningR")
Squid = read.table(file = "RBook/squid.txt", header = TRUE)
names(Squid) #See names of dataframe
# [1] "Sample"   "Year"     "Month"    "Location" "Sex"      "GSI"   
str(Squid) #Structure of the dataframe and status of each variable

#Read data and deliminate incorrectly
#Bad.Squid = read.table(file = "RBook/squidGSI.txt", dec = ",")
#str(Bad.Squid)

GSI #Variable in data.frame not recognized
#Exampl lm assignment
#data = Squid tells R where the variables live
#Not all functions support data option
M1 = lm(GSI ~ factor(Location) + factor(Year), data = Squid)
boxplot(GSI ~ factor(Location), data = Squid) #Create a box plot

#Access GSI
Squid$GSI
Squid[ , 6]
Squid[ , "GSI"]
#Average of GSI data
mean(Squid$GSI)
mean(Squid[ , 6])

#attach()
#rm(BoarData) Done to not cause confusion with same var names in Squid
#rm(Month)
#rm(Year)
#rm(Sex)
attach(Squid) #allows access of var inside data.frame 
boxplot(GSI)
mean(GSI)
detach(Squid) #remove variable access

#Subsets
Squid$Sex
unique(Squid$Sex) #Returns unique values
#1 = male, 2 = female
#access male data
Sel = Squid$Sex == 1 #Boolean vector, TRUE 1, FALSE 2 of = length Sex
SquidM = Squid[Sel, ] #Select rows where Sel == TRUE
#SquidM = Squid[Squid$Sex ==1, ]
SquidM
#access female data
SquidF = Squid[Squid$Sex == 2, ]
SquidF

unique(Squid$Location)
#Extract data for 1, 2, 3
Squid123 = Squid[Squid$Location == 1 | Squid$Location == 2 | Squid$Location == 3, ]
Squid123 = Squid[Squid$Location != 4, ]
Squid123 = Squid[Squid$Location < 4, ]
Squid123 = Squid[Squid$Location <= 3, ]
Squid123 = Squid[Squid$Location >= 1 & Squid$Location <= 3, ]

#Male squid data for location 1
SquidM.1 = Squid[Squid$Location == 1 & Squid$Sex ==1, ]
SquidM.1

#Male squid data for locations 1 and 2
SquidM.12 = Squid[(Squid$Location == 1 | Squid$Location == 2) & Squid$Sex ==1, ]

#Squids in location 1 during year 1 and month 1
Squid[Squid$Location ==1 & Squid$Year == 4 & Squid$Month == 1, ]
#No data for this query
#[1] Sample   Year     Month    Location Sex      GSI     
#<0 rows> (or 0-length row.names)

#Sort in order
Ord1 = order(Squid$Month) #Creates a vector of the order in which the values should be represented
Ord1
Squid[Ord1, ] #Organize Squid by month
Squid[order(Squid$Month), ] #In one line
#Can use for one var
Squid$GSI[Ord1]

#merge()
Sq1 = read.table(file = "RBook/squid1.txt", header = TRUE)
Sq2 = read.table(file = "RBook/squid2.txt", header = TRUE)
SquidMerged = merge(Sq1, Sq2, by = "Sample") #NA values are omitted
SquidMerged
SquidMerged = merge(Sq1, Sq2, by = "Sample", all = TRUE) #NA values are filled
SquidMerged #Sample 4 has NA values

#Check to see where the NA came from (Sample 4)
RowCheck = seq(from = 1, to = 6, by = 1)
Sq1[RowCheck, ]
Sq2[RowCheck, ]

#Exporting data
SquidM
# quote - place quotes around strings(headings)
# sep - How data is seperated
# append- TRUE to append to existing, FALSE to open new file
# na - how to handle missing values
write.table(SquidM, file = "MaleSquid.txt", sep = " ", quote = FALSE, append = FALSE, na = "NA")
write.table(SquidM, file = "MaleSquid1.txt", sep = ",", quote = TRUE, append = FALSE, na = "NA")

#Recoding categorical variables
str(Squid)
Squid$fLocation = factor(Squid$Location)
Squid$fSex = factor(Squid$Sex)
Squid$fSex

Squid$fSex = factor(Squid$Sex, levels = c(1,2), labels = c("M", "F")) #Recode values 1,2 to be "M", "F"
Squid$fSex

#Allows for use in functions as lm or boxplot
boxplot(GSI ~ fSex, data = Squid) #Use in boxplot
M1 = lm(GSI ~ fSex + fLocation, data = Squid) #Use in lm
M2 = lm(GSI ~ factor(Sex) + factor(Location), data = Squid) #Use in lm w/o new labels
#Result are the same
summary(M1) #Model is less wordy
summary(M2) #Model is wordy

Squid$fLocation
#Change order of the levels
Squid$fLocation = factor(Squid$Location, levels = c(2,3,1,4))
Squid$fLocation
boxplot(GSI ~ fLocation, data = Squid)

SquidMTest = Squid[Squid$fSex == "M", ] # is = SquidM = Squid[Squid$Sex == 1, ]
SquidMTest[c(1,2,3), ] #Check - this one has the factor cols
SquidM[c(1,2,3), ] #Check

str(Squid) #Structure of new data.frame






























