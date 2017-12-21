#Chapter 7
#Topics:
# Pie Chart, pie()
# par()
# Bar Chart, barplot()
# Strip Chart, stripchart()
# Boxplot, boxplot()
# Cleveland Dotplots, dotchart()
# Plot, plot()
# Various graphic options:
#   legend(), lines(), points(), text(), ...

#setwd("/home/diego/Learning/LearningR") #Laptop 
setwd("/home/valdeslab/Learning/LearningR") #GreenMachine
rm(list = ls()) #clear environment

#Pie Chart
BFCases = read.table(file = "RBook/BirdFluCases.txt", header = TRUE)
names(BFCases)
str(BFCases)

Cases = rowSums(BFCases[ , 2:16]) #Sum up rows for cols 2:16
names(Cases) = BFCases[ , 1] #Assign names to be the year
Cases

par(mfrow = c(2,2), mar = c(3,3,2,1))
pie(Cases, main = "Oridnary Pie Chart")
pie(Cases, col = gray(seq(0.4, 1.0, length = 6)), clockwise = TRUE, main = "Grey Colors")
pie(Cases, col = rainbow(6), clockwise = TRUE, main = "Rainbow Colors")
#install plotrix 
install.packages("plotrix")
library(plotrix)
pie3D(Cases, labels = names(Cases), explode = 0.1, main = "3d Pie Chart", labelcex = 0.6)

#par()
#Provides graph parameters
#mfrow(x,y) - x rows, y cols
#mar(b,l,t,r) - white space between graphs - bottom, left, top, right 

op = par(mfrow = c(2,2), mar = c(3,3,2,1)) #Set par to display charts
pie(Cases, main = "Oridnary Pie Chart")
pie(Cases, col = gray(seq(0.4, 1.0, length = 6)), clockwise = TRUE, main = "Grey Colors")
pie(Cases, col = rainbow(6), clockwise = TRUE, main = "Rainbow Colors")
pie3D(Cases, labels = names(Cases), explode = 0.1, main = "3d Pie Chart", labelcex = 0.6)
par(op) #Reset to default
pie3D(Cases, labels = names(Cases), explode = 0.1, main = "3d Pie Chart", labelcex = 0.6)

#Bar Chart
BFDeaths = read.table(file = "RBook/BirdFluDeaths.txt", header = TRUE, check.names = FALSE) #File has a bad name
names(BFDeaths)
str(BFDeaths)
colnames(BFDeaths)[8] = "Indonesia" #Change to a good name

Deaths = rowSums(BFDeaths[, 2:16])
names(Deaths) = BFDeaths[,1]
Deaths

par(mfrow = c(2,2), mar = c(3,3,2,1))
barplot(Cases, main = "Bird Flu Cases")
Counts = cbind(Cases, Deaths)
barplot(Counts)
barplot(t(Counts), col = gray(c(0.5, 1))) #Use t() to transpose data for chart making
barplot(t(Counts), beside = TRUE)
barplot(Counts, beside = TRUE)

par(mfrow = c(1,2))
barplot(t(Counts), beside = TRUE)
barplot(Counts, beside = TRUE)

Benthic = read.table(file = "RBook/RIKZ2.txt", header = TRUE)
Bent.M = tapply(Benthic$Richness, INDEX = Benthic$Beach, FUN = mean) #Bent.M = tapply(Benthic$Richness, Benthic$Beach, mean)
Bent.sd = tapply(Benthic$Richness, Benthic$Beach, sd)
MSD = cbind(Bent.M, Bent.sd)

#Create the bar chart in stages
barplot(Bent.M)
barplot(Bent.M, xlab = "Beach", ylim = c(0,20), ylab = "Richness", col = rainbow(9)) #Add labels and color
bp = barplot(Bent.M, xlab = "Beach", ylim = c(0,20), ylab = "Richness", col = rainbow(9)) #Assign mid points of x axis to be starts of sd
bp
arrows(bp, Bent.M, bp, Bent.M + Bent.sd, lwd = 1.5, angle = 90, length = 0.1) #Add the arrows for the sd
box() #Put a box around the plot

#Strip Chart
Benth.le = tapply(Benthic$Richness, Benthic$Beach, length) #Sample size for each beach
Bent.se = Bent.sd / sqrt(Benth.le) #Standard error - divide sd by sample size

stripchart(Benthic$Richness ~ Benthic$Beach, vert = TRUE, pch = 1, method = "jitter", jit = 0.05, xlab = "Beach", ylab = "Richness")
points(1:9, Bent.M, pch = 16, cex = 1.5) #Add means of each beach
arrows(1:9, Bent.M, 1:9, Bent.M + Bent.se, lwd = 1.5, angle = 90, length = 0.1) #Add the sd
arrows(1:9, Bent.M, 1:9, Bent.M - Bent.se, lwd = 1.5, angle = 90, length = 0.1)

#Boxplot
Owls = read.table(file = "RBook/Owls.txt", header = TRUE)
names(Owls)
str(Owls)

boxplot(Owls$NegPerChick)
par(mfrow = c(2,2))
boxplot(NegPerChick ~ SexParent, data = Owls)
boxplot(Owls$NegPerChick ~ Owls$FoodTreatment)
boxplot(Owls$NegPerChick ~ Owls$SexParent * Owls$FoodTreatment)
boxplot(Owls$NegPerChick ~ Owls$SexParent * Owls$FoodTreatment,
        names = c("F/Dep", "M/Dep", "F/Sat", "M/Sat"))
dev.off()

boxplot(NegPerChick ~ Nest, data = Owls)
boxplot(NegPerChick ~ Nest, data = Owls,
        axes = FALSE, ylim = c(-3,8.5)) #draw without axes and lower limit
axis(2, at = c(0,2,4,6,8)) #Create the axes on left(2)
text(x = 1.27, y = -2, labels = levels(Owls$Nest), cex = 0.75, srt = 65) #cex - font size, srt - angle

Benthic.n = tapply(Benthic$Richness, Benthic$Beach, length) #Observations per beach
Benthic.n
boxplot(Richness ~ Beach, data = Benthic, col = "grey", 
        xlab = "Beach", ylab = "Richness")
#Create the info of the graph which can be used to position graphics on the plot
BP.info = boxplot(Richness ~ Beach, 
                  data = Benthic, col = "grey", 
                  xlab = "Beach", ylab = "Richness") 
BP.info$stats
#Obtain midpoints of boxes
BP.midp <- BP.info$stats[2, ] +
  (BP.info$stats[4, ] - BP.info$stats[2,]) / 2

text(1:9, BP.midp, Benthic.n, col = "white", font = 2) #Add text of sample size

#Cleveland Dotplots
Deer = read.table("RBook/Deer.txt", header = TRUE)
names(Deer)
str(Deer)

dotchart(Deer$LCT, xlab = "Length (cm)", ylab = "Observation number")
dotchart(Deer$LCT, groups = factor(Deer$Sex)) #Creates error due to missing values

Isna = is.na(Deer$Sex) #create to remove na sex values
dotchart(Deer$LCT[!Isna], 
         groups = factor(Deer$Sex[!Isna]), #group by sex
         xlab = "Length (cm)", ylab = "Observation number"
         )


#For my own curiosity -  getting the mean length
NewDeer = Deer[, c(4,6)] #Filter the columns
NewDeer2 = NewDeer[complete.cases(NewDeer), ] #Remove rows that have na values
tapply(NewDeer2$LCT, NewDeer2$Sex, mean) #Get that mean

#Adding mean
Benthic = read.table("RBook/RIKZ2.txt", header = TRUE)
Benthic$fBeach = factor(Benthic$Beach) #Create a factor column
par(mfrow = c(2,2))

dotchart(Benthic$Richness, 
         groups = Benthic$fBeach,
         xlab = "Richness", ylab = "Beach")

Bent.M = tapply(Benthic$Richness, Benthic$Beach, mean) #Get mean for each beach

dotchart(Benthic$Richness, 
         groups = Benthic$fBeach,
         gdata = Bent.M, gpch = 19, #Add mean data with different symbols
         xlab = "Richness", ylab = "Beach")

legend("bottomright", c("values", "mean"), pch = c(1,19), bg = "white") #Add a legend

#Plot - more options
methods(plot) #Shows all the options of a function
#plot() produces different charts depending on the data submitted

Benthic = read.table("RBook/RIKZ2.txt", header = TRUE)
Benthic$fBeach = factor(Benthic$Beach) #Create a factor column

#Both produce same plot
boxplot(Richness ~ Beach, data = Benthic, xlab = "Beach", ylab = "Richness")
plot(Benthic$Richness ~ Benthic$fBeach, xlab = "Beach", ylab = "Richness") #produces boxplot based on data submitted

plot(x = Benthic$NAP, y = Benthic$Richness,
     xlab = "Mean high tide (m)", ylab = "Species Richness",
     main = "Benthic data")
M0 = lm(Richness ~ NAP, data = Benthic) #Linear Regression model, Richness as a function of NAP
abline(M0) #Add the line to the graph

plot(x = Benthic$NAP, y = Benthic$Richness,
     xlab = "Mean high tide (m)", ylab = "Species Richness",
     main = "Benthic data",
     xlim = c(-3,3), ylim = c(min(Benthic$Richness), max((Benthic$Richness))))

plot(x = Benthic$NAP, y = Benthic$Richness,
     xlab = "Mean high tide (m)", ylab = "Species Richness",
     main = "Benthic data",
     type = "n", axes = FALSE) #type - don't plot points, and no axes
points(y = Benthic$Richness, x = Benthic$NAP) #Add these points to the graph

plot(x = Benthic$NAP, y = Benthic$Richness,
     xlab = "Mean high tide (m)", ylab = "Species Richness",
     main = "Benthic data",
     xlim = c(-1.75, 2), ylim = c(0, 20),
     type = "n", axes = FALSE) #type - don't plot points, and no axes
points(y = Benthic$Richness, x = Benthic$NAP) #Add these points to the graph
axis(2, at = c(0,10,20), tcl = 1) #add axis on right with values, tcl - adds tick marks
axis(1, at = c(-1.75, 0, 2), labels = c("Sea", "Water line", "Dunes")) #Add axis on bottom with labels

#Adding points, text, and lines
#Many of these options have been used throughout the chapters and are just reviewed.

Birds = read.table("RBook/loyn.txt", header = TRUE)
names(Birds)
str(Birds)

Birds$LOGAREA = log10(Birds$AREA) #Create col of log10 values
Birds$fGRAZE = factor(Birds$GRAZE)

plot(Birds$LOGAREA, Birds$ABUND,
     xlab = "Log transformed Area", ylab = "Bird abundance")

M0 = lm(Birds$ABUND ~ Birds$LOGAREA + Birds$fGRAZE) #Apply Linear Regression model
summary(M0)

LAR = seq(-1, 3, 1) #range of observed data

#Determine abundance values
ABUND1 = 15.7 + 7.2 * LAR
ABUND2 = 16.1 + 7.2 * LAR
ABUND3 = 15.5 + 7.2 * LAR
ABUND4 = 14.1 + 7.2 * LAR
ABUND5 = 3.8 + 7.2 * LAR

lines(LAR, ABUND1, lty = 1, lwd = 1, col = 1) #plot line, line type, line width, color
lines(LAR, ABUND2, lty = 2, lwd = 2, col = 2)
lines(LAR, ABUND3, lty = 3, lwd = 3, col = 3)
lines(LAR, ABUND4, lty = 4, lwd = 4, col = 4)
lines(LAR, ABUND5, lty = 5, lwd = 5, col = 5)

#Add legend
legend.txt = c("Graze 1", "Graze 2", "Graze 3", "Graze 4", "Graze 5")
types = seq(1,5,1) #vector to hold values for color, and line characteristics
legend("topleft", legend = legend.txt,
       col = types,
       lty = types,
       lwd = types,
       bty = "o", #Adds a box around legend
       cex = 0.8) #Size of the box

#7.5.6


