#Chapter 7
#Topics:
# Pie Chart, pie()
# par()
# Bar Chart, barplot()
# Strip Chart, stripchart()
# Boxplot, boxplot()
# Cleveland Dotplots, dotchart()

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


#7.5











