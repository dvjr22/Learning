#Exercises Chapter 4

#setwd("/home/diego/Learning/LearningR")

#ex 1
#The file temperature.xls contains temperature observations made at 31 locations 
#along the Dutch coastline. The data were collected and provided by the
#Dutch institute RIKZ (under the monitoring program MWTL; Monitoring
#Waterstaatkundige Toestand des Lands). Sampling began in 1990, and the final
#measurements in the spreadsheet were taken in December 2005, a period of
#16 years. Sampling frequency was 0–4 times per month, depending on the season.
#Calculate a one-time series of monthly averages using data from all stations.
#The end result should be a variable of dimension 16 X 12. Also calculate the
#standard deviation and number of observations per month.

#setwd("/home/diego/Learning/LearningR")
Temp.dataframe = read.table(file = "RBook/Temperature.csv", header = TRUE, sep = ",") #Read using read.table
#Temp.csv.df = read.csv(file = "RBook/Temperature.csv", header = TRUE, sep = ",") #Read using read.csv
#Produces same result
names(Temp.dataframe)
#names(Temp.csv.df)
str(Temp.dataframe)
#str(Temp.csv.df)

mean(Temp.dataframe$Salinity[Temp.dataframe$Month == 1], na.rm = TRUE) #Average for January
tapply(Temp.dataframe$Salinity, Temp.dataframe$Month, mean, na.rm = TRUE) #Ave Salinity per month for all years
tapply(Temp.dataframe$Salinity, Temp.dataframe$Year, mean, na.rm = TRUE) #Ave for all years

AnswerTemp = matrix(nrow = 16, ncol = 12) #Answer to store results
colnames(AnswerTemp) = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec") #Name cols
rownames(AnswerTemp) = seq(from = 1990, to = 2005, by = 1) #Name rows
#Get the data for each year
Temp90 = Temp.dataframe[Temp.dataframe$Year == 1990, ]
Temp91 = Temp.dataframe[Temp.dataframe$Year == 1991, ]
Temp92 = Temp.dataframe[Temp.dataframe$Year == 1992, ]
Temp93 = Temp.dataframe[Temp.dataframe$Year == 1993, ]
Temp94 = Temp.dataframe[Temp.dataframe$Year == 1994, ]
Temp95 = Temp.dataframe[Temp.dataframe$Year == 1995, ]
Temp96 = Temp.dataframe[Temp.dataframe$Year == 1996, ]
Temp97 = Temp.dataframe[Temp.dataframe$Year == 1997, ]
Temp98 = Temp.dataframe[Temp.dataframe$Year == 1998, ]
Temp99 = Temp.dataframe[Temp.dataframe$Year == 1999, ]
Temp00 = Temp.dataframe[Temp.dataframe$Year == 2000, ]
Temp01 = Temp.dataframe[Temp.dataframe$Year == 2001, ]
Temp02 = Temp.dataframe[Temp.dataframe$Year == 2002, ]
Temp03 = Temp.dataframe[Temp.dataframe$Year == 2003, ]
Temp04 = Temp.dataframe[Temp.dataframe$Year == 2004, ]
Temp05 = Temp.dataframe[Temp.dataframe$Year == 2005, ]

#Avg Temp from all stations by month for given year
#Place results in the matrix
AnswerTemp[1, ] = tapply(Temp90$Temperature, Temp90$Month, mean, na.rm = TRUE) #Ave for each month in the year
AnswerTemp[2, ] = tapply(Temp91$Temperature, Temp91$Month, mean, na.rm = TRUE) #Ave for each month in the year
AnswerTemp[3, ] = tapply(Temp92$Temperature, Temp92$Month, mean, na.rm = TRUE) #Ave for each month in the year
AnswerTemp[4, ] = tapply(Temp93$Temperature, Temp93$Month, mean, na.rm = TRUE) #Ave for each month in the year
AnswerTemp[5, ] = tapply(Temp94$Temperature, Temp94$Month, mean, na.rm = TRUE) #Ave for each month in the year
AnswerTemp[6, ] = tapply(Temp95$Temperature, Temp95$Month, mean, na.rm = TRUE) #Ave for each month in the year
AnswerTemp[7, ] = tapply(Temp96$Temperature, Temp96$Month, mean, na.rm = TRUE) #Ave for each month in the year
AnswerTemp[8, ] = tapply(Temp97$Temperature, Temp97$Month, mean, na.rm = TRUE) #Ave for each month in the year
AnswerTemp[9, ] = tapply(Temp98$Temperature, Temp98$Month, mean, na.rm = TRUE) #Ave for each month in the year
AnswerTemp[10, ] = tapply(Temp99$Temperature, Temp99$Month, mean, na.rm = TRUE) #Ave for each month in the year
AnswerTemp[11, ] = tapply(Temp00$Temperature, Temp00$Month, mean, na.rm = TRUE) #Ave for each month in the year
AnswerTemp[12, ] = tapply(Temp01$Temperature, Temp01$Month, mean, na.rm = TRUE) #Ave for each month in the year
AnswerTemp[13, ] = tapply(Temp02$Temperature, Temp02$Month, mean, na.rm = TRUE) #Ave for each month in the year
AnswerTemp[14, ] = tapply(Temp03$Temperature, Temp03$Month, mean, na.rm = TRUE) #Ave for each month in the year
AnswerTemp[15, ] = tapply(Temp04$Temperature, Temp04$Month, mean, na.rm = TRUE) #Ave for each month in the year
AnswerTemp[16, ] = tapply(Temp05$Temperature, Temp05$Month, mean, na.rm = TRUE) #Ave for each month in the year

AnswerTemp #Display

#Standard deviation
AnswerSd = matrix(nrow = 16, ncol = 12) #Answer to store results
colnames(AnswerSd) = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec") #Name cols
rownames(AnswerSd) = seq(from = 1990, to = 2005, by = 1) #Name rows

#Stanandard deviation from all stations by month for given year
#Place results in the matrix
AnswerSd[1, ] = tapply(Temp90$Temperature, Temp90$Month, sd, na.rm = TRUE) #sd for each month in the year
AnswerSd[2, ] = tapply(Temp91$Temperature, Temp91$Month, sd, na.rm = TRUE) #sd for each month in the year
AnswerSd[3, ] = tapply(Temp92$Temperature, Temp92$Month, sd, na.rm = TRUE) #sd for each month in the year
AnswerSd[4, ] = tapply(Temp93$Temperature, Temp93$Month, sd, na.rm = TRUE) #sd for each month in the year
AnswerSd[5, ] = tapply(Temp94$Temperature, Temp94$Month, sd, na.rm = TRUE) #sd for each month in the year
AnswerSd[6, ] = tapply(Temp95$Temperature, Temp95$Month, sd, na.rm = TRUE) #sd for each month in the year
AnswerSd[7, ] = tapply(Temp96$Temperature, Temp96$Month, sd, na.rm = TRUE) #sd for each month in the year
AnswerSd[8, ] = tapply(Temp97$Temperature, Temp97$Month, sd, na.rm = TRUE) #sd for each month in the year
AnswerSd[9, ] = tapply(Temp98$Temperature, Temp98$Month, sd, na.rm = TRUE) #sd for each month in the year
AnswerSd[10, ] = tapply(Temp99$Temperature, Temp99$Month, sd, na.rm = TRUE) #sd for each month in the year
AnswerSd[11, ] = tapply(Temp00$Temperature, Temp00$Month, sd, na.rm = TRUE) #sd for each month in the year
AnswerSd[12, ] = tapply(Temp01$Temperature, Temp01$Month, sd, na.rm = TRUE) #sd for each month in the year
AnswerSd[13, ] = tapply(Temp02$Temperature, Temp02$Month, sd, na.rm = TRUE) #sd for each month in the year
AnswerSd[14, ] = tapply(Temp03$Temperature, Temp03$Month, sd, na.rm = TRUE) #sd for each month in the year
AnswerSd[15, ] = tapply(Temp04$Temperature, Temp04$Month, sd, na.rm = TRUE) #sd for each month in the year
AnswerSd[16, ] = tapply(Temp05$Temperature, Temp05$Month, sd, na.rm = TRUE) #sd for each month in the year

AnswerSd #Display

#Standard deviation
AnswerLen = matrix(nrow = 16, ncol = 12) #Answer to store results
colnames(AnswerLen) = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec") #Name cols
rownames(AnswerLen) = seq(from = 1990, to = 2005, by = 1) #Name rows

#Stanandard deviation from all stations by month for given year
#Place results in the matrix
AnswerLen[1, ] = tapply(Temp90$Temperature, Temp90$Month, length) #Number of observations
AnswerLen[2, ] = tapply(Temp91$Temperature, Temp91$Month, length) #Number of observations
AnswerLen[3, ] = tapply(Temp92$Temperature, Temp92$Month, length) #Number of observations
AnswerLen[4, ] = tapply(Temp93$Temperature, Temp93$Month, length) #Number of observations
AnswerLen[5, ] = tapply(Temp94$Temperature, Temp94$Month, length) #Number of observations
AnswerLen[6, ] = tapply(Temp95$Temperature, Temp95$Month, length) #Number of observations
AnswerLen[7, ] = tapply(Temp96$Temperature, Temp96$Month, length) #Number of observations
AnswerLen[8, ] = tapply(Temp97$Temperature, Temp97$Month, length) #Number of observations
AnswerLen[9, ] = tapply(Temp98$Temperature, Temp98$Month, length) #Number of observations
AnswerLen[10, ] = tapply(Temp99$Temperature, Temp99$Month, length) #Number of observations
AnswerLen[11, ] = tapply(Temp00$Temperature, Temp00$Month, length) #Number of observations
AnswerLen[12, ] = tapply(Temp01$Temperature, Temp01$Month, length) #Number of observations
AnswerLen[13, ] = tapply(Temp02$Temperature, Temp02$Month, length) #Number of observations
AnswerLen[14, ] = tapply(Temp03$Temperature, Temp03$Month, length) #Number of observations
AnswerLen[15, ] = tapply(Temp04$Temperature, Temp04$Month, length) #Number of observations
AnswerLen[16, ] = tapply(Temp05$Temperature, Temp05$Month, length) #Number of observations

AnswerLen #Display

#ex 2
#Using the data in Exercise 1, determine the number of observations per
#station. How many observations were made per year? How many observations
#were made at each station per year?

table(Temp.dataframe$Station) #Number of observations per station
table(Temp.dataframe$Year) #Observations per year
table(Temp.dataframe$Year, Temp.dataframe$Station) #Observations of each station by year

