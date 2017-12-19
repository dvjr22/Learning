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

















