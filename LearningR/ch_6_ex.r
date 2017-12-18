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

setwd("/home/valdeslab/Learning/LearningR/Plots/Chapter_6/ChapterEx") #GreenMachine

for (i in 1:length(Station)) {

  Temp.Station = Temp.dataframe[Temp.dataframe$Station == Station[i], ] #Get data for station
  FileName = paste(Station[i], ".jpg", sep = "") #Station as filename
  jpeg(file = FileName) #Open file for saving
  plot(x = Temp.Station$dDay2, y = Temp.Station$Temperature,
       main = Station.i
  )
  dev.off() #Close file
  
}






