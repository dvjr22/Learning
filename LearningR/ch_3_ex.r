#Exercises Chapter 3

#ex 1
#The file BirdFlu.xls contains the annual number of confirmed cases of human
#Avian Influenza A/(H5N1) for several countries reported to the World Health
#Organization (WHO). The data were taken from the WHO website
#(www.who.int/en/) and reproduced for educational purposes. Prepare the
#spreadsheet and import these data into R. If you are a non-Windows user,
#start with the file BirdFlu.txt. Note that you will need to adjust the column
#names and some of the country names.
#Use the names and str command in R to view the data. Print the number of
#bird flu cases in 2003. What is the total number of bird flu cases in 2003 and in
#2005? Which country has had the most cases? Which country has had the least
#bird flu deaths?
#Using methods from Chapter 2, what is the total number of bird flu cases per
#country? What is the total number of cases per year?

BirdFlu = read.table(file = "RBook/BirdFluCases.txt", header = TRUE) # '?' in header caused error
names(BirdFlu)
str(BirdFlu)
BirdFlu0305 = BirdFlu[BirdFlu$Year == 2003 | BirdFlu$Year == 2005, ] #Flu cases in 03 and 05
BirdFlu0305
Flu03 = sum(BirdFlu0305[1,]) - 2003 #Flu cases in 03
Flu03
Flu05 = sum(BirdFlu0305[2, ]) - 2005 #Flu cases in 05
Flu05
FluCases0305 = Flu03 + Flu05 #Total for both years
FluCases0305

TotalCases = colSums(BirdFlu[ , -1]) #Add all columns except 1st
max(TotalCases)
TotalCases
which.max(TotalCases) #Most cases Indonesia
which.min(TotalCases) #Least cases Bangledesh

Cases03 = rowSums(BirdFlu[ ,-1])[1] #Totals 03
Cases04 = rowSums(BirdFlu[ ,-1])[2] #Totals 04
Cases05 = rowSums(BirdFlu[ ,-1])[3] #Totals 05
Cases06 = rowSums(BirdFlu[ ,-1])[4] #Totals 06
Cases07 = rowSums(BirdFlu[ ,-1])[5] #Totals 07
Cases08 = rowSums(BirdFlu[ ,-1])[6] #Totals 08

#ex 2
#If you have not completed Exercise 6 in Chapter 2, do so and import the data
#from the ISIT.xls file.
#In R, extract the data from station 1. How many observations were made at
#this station? What are the minimum, median, mean, and maximum sampled
#depth at station 1? What are the minimum, median, mean, and maximum
#sampled depth at station 2? At station 3?

#setwd("/home/diego/Learning/LearningR")
Isit.dataframe = read.table(file = "RBook/ISIT.txt", header = TRUE) #Read using read.table
names(Isit.dataframe) #Column names
str(Isit.dataframe) #Structure of data

IsitStation1 = Isit.dataframe[Isit.dataframe$Station == 1, ] #Station 1 data
str(IsitStation1) #Structure of data, 38 observations

#Get
Station1Depth = IsitStation1$SampleDepth #Get SampleDepth column
#Max and min
max(Station1Depth, na.rm = TRUE) # max(IsitStation1$SampleDepth, na.rm = TRUE)
min(Station1Depth, na.rm = TRUE) # min(IsitStation1$SampleDepth, na.rm = TRUE)
#Median and mean
mean(IsitStation1$SampleDepth, na.rm = TRUE)
median(IsitStation1$SampleDepth, na.rm = TRUE)

#Station 2
IsitStation2 = Isit.dataframe[Isit.dataframe$Station ==2, ]
Station2Depth = IsitStation2$SampleDepth
max(Station2Depth, na.rm = TRUE)
min(Station2Depth, na.rm = TRUE)
mean(Station2Depth, na.rm = TRUE)
median(Station2Depth, na.rm = TRUE)

#Station 3
IsitStation3 = Isit.dataframe[Isit.dataframe$Station == 3, ]
Station3Depth = IsitStation3$SampleDepth
max(Station3Depth, na.rm = TRUE)
min(Station3Depth, na.rm = TRUE)
mean(Station3Depth, na.rm = TRUE)
median(Station3Depth, na.rm = TRUE)

#Identify any stations with considerably fewer observations. Create a new
#data frame omitting these stations.

unique(Isit.dataframe$Station) #Display number of stations
str(Isit.dataframe)
StationObservations = table(Isit.dataframe$Station) #Number of times each station appears
StationObservations
#Station 4 and 5 appear < 20 and will be excluded
Isit.New.df = Isit.dataframe[Isit.dataframe$Station != 4 & Isit.dataframe$Station != 5, ] #New dataframe with 4 and 5 excluded
str(Isit.New.df)

#Extract the data from 2002. Extract the data from April (of all years). Extract
#the data that were measured at depths greater than 2000 meters (from all years
#and months). Show the data according to increasing depth values.
#Show the data that were measured at depths greater than 2000 meters in April.

Isit.2002.df = Isit.dataframe[Isit.dataframe$Year == 2002, ] #Extract 2002
unique(Isit.2002.df$Year) #Check if I got it right

Isit.Aprl.df = Isit.dataframe[Isit.dataframe$Month == 4, ] #Extract April - 4
unique(Isit.Aprl.df$Month)

Isit.GT.2000Depth = Isit.dataframe[Isit.dataframe$SampleDepth > 2000, ] #Extract > 2000
#Check max and min depths
max(Isit.GT.2000Depth$SampleDepth) 
min(Isit.GT.2000Depth$SampleDepth) 

#Order by depth
DepthOrder = order(Isit.GT.2000Depth$SampleDepth) #Create depth order
DepthOrder #The order the column will be sorted
Isit.GT.2000Depth$SampleDepth[DepthOrder] #Sort the column in that order
Isit.GT.2000Depth[DepthOrder, ] #Display in depth order

#In April greater than 2000 depth
Isit.GT.2000.Depth.April = Isit.GT.2000Depth[Isit.GT.2000Depth$Month == 4, ]
unique(Isit.GT.2000.Depth.April$Month) #Check

# ex 3
#In the final step of the previous exercise, data measured at depths greater than
#2000 meters in April were extracted. Export these data to a new ascii file.

write.table(Isit.GT.2000.Depth.April, file = "April_2000_depth.txt", sep = " ", quote = FALSE, append = FALSE, na = "NA")

# ex 4
#Stations 1 through 5 were sampled in April 2001, stations 6 through 11 in
#August 2001, stations 12 through 15 in March 2002, and stations 16 through
#19 in October 2002. Create two new variables in R to identify the month and the
#year. Note that these are factors. Do this by adding the new variables inside the
#data frame.

Isit.dataframe$fMonth = factor(Isit.dataframe$Month)
Isit.dataframe$fYear = factor(Isit.dataframe$Year)


















