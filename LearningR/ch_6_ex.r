#Exercises Chapter 5

#setwd("/home/diego/Learning/LearningR") #Laptop 
#setwd("/home/valdeslab/Learning/LearningR") #GreenMachine
#rm(list = ls()) #clear environment

#ex 1
#In Section 6.2, sibling negotiation behaviour was plotted versus arrival
#time for each nest in the owl data. A graph for each nest was created and
#saved as a jpg file. Do the same for the temperature data; see Exercise 4.1 for
#details. The file temperature.xls contains temperature observations made at
#31 locations (denoted as stations in the spreadsheet) along the Dutch coast-
#line. Plot the temperature data versus time for each station, and save the
#graph as a jpg file.

Temp.dataframe = read.table(file = "RBook/Temperature.csv", header = TRUE, sep = ",") #Read using read.table
names(Temp.dataframe)
str(Temp.dataframe)
Station = unique(Temp.dataframe$Station) #Vector of all stations

setwd("/home/valdeslab/Learning/LearningR/Plots/Chapter_6/Ex_1") #GreenMachine

for (i in 1:length(Station)) {

  Temp.Station = Temp.dataframe[Temp.dataframe$Station == Station[i], ] #Get data for station
  FileName = paste(Station[i], ".jpg", sep = "") #Station as filename
  jpeg(file = FileName) #Open file for saving
  plot(x = Temp.Station$dDay2, y = Temp.Station$Temperature,
       main = Station.i
  )
  dev.off() #Close file
  
}

#ex2
#The owl data were sampled on two consecutive nights. If you select the data
#from one nest, the observations will cover both nights. The two nights differed
#as to the feeding regime (satiated or deprived). To see observations from a single
#night, select all observations from a particular nest and food treatment. Use the
#ifelse and paste functions to make a new categorical variable that defines
#the observations from a single night at a particular nest. Try rerunning the code
#from Exercise 1 to make a graph of sibling negotiation versus arrival time for
#observations of the same nest and night.

?ifelse
Owls = read.table(file = "RBook/Owls.txt", header = TRUE)
names(Owls)
str(Owls)
summary(Owls)

Nests = unique(Owls$Nest) #Each nest 
FoodTreatment = unique(Owls$FoodTreatment) # Either Deprived, Satiated - tells which night

#Can use ifelse to create a column of that has each nest night
#Then you can pull extract that info to plot
#ifelse(Owls$FoodTreatment == "Satiaded", Owls$NestNight <- paste(Owls$Nest, "1",sep = "_"), Owls$NestNight <- paste(Owls$Nest, "2",sep = "_"))

setwd("/home/valdeslab/Learning/LearningR/Plots/Chapter_6/Ex_2") #GreenMachine

for (i in 1:length(Nests)) {
  
  NestData = Owls[Owls$Nest == Nests[i], ] #All nest data
  
  for (j in 1:length(FoodTreatment)) {

    NightData = NestData[NestData$FoodTreatment == FoodTreatment[j], ] #Data for the nest and night
    GraphName = ifelse(FoodTreatment[j] == "Satiated", 
        paste(Nests[i], "_Night_1", sep = ""), 
        paste(Nests[i], "_Night_2", sep = "")) # Name of the graph
    FileName = paste(GraphName, ".jpg", sep = "") #Nest night filename
    jpeg(file = FileName) #Open file for saving
    plot(x = NightData$SiblingNegotiation, #x = NightData$NegPerChick, Will produce same graph
         y = NightData$ArrivalTime,
         main = GraphName,
         xlab = "Sibling Negotiation",
         ylab = "Arrival Time"
         )
    dev.off() #Close file
  }

}

#ex3
#In this exercise we provide the steps for the function that was presented in
#Section 6.4: the calculation of diversity indices. Read the introductory text in
#Section 6.4 on diversity indices. Import the benthic data and extract columns
#2–76; these are the species.

Benthic = read.table("RBook/RIKZ.txt", header = TRUE)
names(Benthic)
str(Benthic)
Species = Benthic[, 2:76] #Extract species data

#Calculate total abundance at site 1. Calculate total abundance at site 2.
#Calculate total abundance at site 3. Calculate the total abundance at site 45.
#Find a function that can do this in one step (sum per row). Brute force may work
#as well (loop), but is less elegant.

TA = rowSums(Species, na.rm = TRUE)

#Calculate the total number of different species in site 1 (species richness).
#Calculate species richness for site 2. Do the same for sites 3 and 45. Find a
#function that can do this in one step.

Richness = rowSums(Species > 0, na.rm = TRUE)

#If you are brave, add the Shannon index. Apply the same function to the
#vegetation data.

#vegan must be installed
library(vegan)
T = diversity(Species, base = 10)

#Create a function using the code for all the diversity indices. Make sure that
#the user can choose which index is calculated. Ensure that the code can deal with
#missing values.

#Improved function from 6.4.7
index.function = function(Data, Choice1 = "R") {
  
  Choice1 = toupper(Choice1) #Ensure upper case
  index = NA #Value of index in the event of incorrect input
  switch (Choice1, #Case to check
          "R" = (index = rowSums(Data > 0, na.rm = TRUE)), #Richness
          "TA" = (index = rowSums(Data, na.rm = TRUE)), #Total Abundance
          "S" = (index = diversity(Data, base = 10)), #Shannon Index
          print("Incorrect value added") #Default statement
  )
  
  list(Index = index, Choice = Choice1)
}

index.function(Species, "R")
index.function(Species, "TA")
index.function(Species, "S")
index.function(Species, "3")

#Testing with different method of getting Shannon Index
#Improved function from 6.4.7
index.function2 = function(Data, Choice1 = "R") {
  
  Choice1 = toupper(Choice1) #Ensure upper case
  index = NA
  switch (Choice1, #Case to check
          "R" = (index = rowSums(Data > 0, na.rm = TRUE)),
          "TA" = (index = rowSums(Species, na.rm = TRUE)),
          # Shannon Index w/o vegan
          "S" = {
            RS = rowSums(Species, na.rm = TRUE)
            prop = Species / RS #Divide Species[i, j] / RS[i]
            index = -rowSums(prop * log10(prop), na.rm = TRUE) 
            },
          print("Incorrect value added") #Default statement
  )
  
  list(Index = index, Choice = Choice1)
}

index.function2(Species, "R")
index.function2(Species, "TA")
index.function2(Species, "S")
index.function2(Species, "3")

