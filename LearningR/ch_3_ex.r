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

