#Exercises Chapter 4

#setwd("/home/diego/Learning/LearningR") #Laptop 
#setwd("/home/valdeslab/Learning/LearningR") #GreenMachine

#ex 1
#In Chapter 16 of Zuur et al. (2009), a study is presented analysing numbers of amphibians
#killed along a road in Portugal using generalised additive mixed modelling
#techniques. In this exercise, we use the plot command to visualise a segment
#of the data. Open the file Amphibian_road_Kills.xls, prepare a spreadsheet, and
#import the data into R.

#Import data
Terr = read.table(file = "RBook/Amphibian_road_Kills.csv", header = TRUE, sep = ",") #Read using read.table

#The variable, TOT_N, is the number of dead animals at a sampling site,
#OLIVE is the number of olive groves at a sampling site, and D Park is the
#distance from each sampling point to the nearby natural park. Create a plot of
#TOT_N versus D_park. Use appropriate labels. Add a smoothing curve. 

#Initial plot
plot(x = Terr$TOT.N, y = Terr$D.PARK,
     xlab = "Dead Animals", ylab = "Distance to Park",
     main = "Road Kills",
     xlim = c(min(Terr$TOT.N, na.rm = TRUE), max(Terr$TOT.N, na.rm = TRUE)),
     ylim = c(min(Terr$D.PARK, na.rm = TRUE), max(Terr$D.PARK, na.rm = TRUE))
     )

#Smoothing curve
Curve = loess(D.PARK ~ TOT.N, data = Terr) #Park as a function of Tot
Fit = fitted(Curve)
Order = order(Terr$TOT.N) #Order Tot
lines(Terr$TOT.N[Order], Fit[Order], lwd = 3, lty = 2) #Plot the line

#Make the same plot again, but use points that are proportional to the value of OLIVE
#(this may show whether there is an OLIVE effect).

summary(Terr$OLIVE)
Terr$OLIVE2 = Terr$OLIVE
Terr$OLIVE2[Terr$OLIVE <= 7.35] = 1
Terr$OLIVE2[Terr$OLIVE > 7.35] = 2

#New plot
plot(x = Terr$TOT.N, y = Terr$D.PARK,
     xlab = "Dead Animals", ylab = "Distance to Park",
     main = "Road Kills",
     xlim = c(min(Terr$TOT.N, na.rm = TRUE), max(Terr$TOT.N, na.rm = TRUE)),
     ylim = c(min(Terr$D.PARK, na.rm = TRUE), max(Terr$D.PARK, na.rm = TRUE)),
     cex = Terr$OLIVE2,
     col = Terr$OLIVE2
)

#Add smoothing curve
Curve = loess(D.PARK ~ TOT.N, data = Terr) #Park as a function of Tot
Fit = fitted(Curve)
Order = order(Terr$TOT.N) #Order Tot
lines(Terr$TOT.N[Order], Fit[Order], lwd = 3, lty = 2, col = "blue") #Plot the line with color

