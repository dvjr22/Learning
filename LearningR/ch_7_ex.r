#Exercises Chapter 7

#setwd("/home/diego/Learning/LearningR") #Laptop 
#setwd("/home/valdeslab/Learning/LearningR") #GreenMachine
rm(list = ls()) #clear environment

#ex1
#In Section 7.1, we used the total number of bird flu cases per year. Make a pie
#chart to illustrate the totals by country. Place the labels such that they are
#readable. 

BFCases = read.table(file = "RBook/BirdFluCases.txt", header = TRUE)
names(BFCases)
str(BFCases)

Cases = colSums(BFCases[, 2:16])
Cases
pie(Cases, col = rainbow(16), clockwise = TRUE, main = "Cases By Country")

#The file BirdFludeaths.txt contains the data on deaths from the
#disease. Make a pie chart showing total deaths per year and one showing deaths
#per country.

BFDeaths = read.table(file = "RBook/BirdFluDeaths.txt", header = TRUE, check.names = FALSE) #File has a bad name
names(BFDeaths)
str(BFDeaths)
colnames(BFDeaths)[8] = "Indonesia" #Change to a good name

DeathsYear = rowSums(BFDeaths[, 2:16])
names(DeathsYear) = BFDeaths[,1]
DeathsYear
pie(DeathsYear, col = rainbow(6), clockwise = TRUE, main = "Deaths by Year")

DeathsCountry = colSums(BFDeaths[, 2:16])
DeathsCountry
pie(DeathsCountry, col = rainbow(16), clockwise = TRUE, main = "Deaths by Country")

#ex2
#In Section 4.1, we calculated species richness, as well as its mean values and
#standard deviations, in eight transects. Make a bar chart for the eight mean
#values and add a vertical line for the standard error.

Veg = read.table(file = "RBook/Vegetation2.txt", header = TRUE)
names(Veg)
str(Veg)

m = mean(Veg$R) #Mean for all richness
Me = tapply(Veg$R, Veg$Transect, mean) #Mean species Richness
Sd = tapply(Veg$R, Veg$Transect, sd) #Standard deviation
cbind(Me, Sd, Le) #Display results

bp = barplot(Me, ylim = c(0,16),
        xlab = "Transect", ylab = "Mean", main = "Vegetaion Transect",
        col = rainbow(8))
bp
arrows(bp, Me, bp, Me + Sd, lwd = 1.5, angle = 90, length = 0.1)
box()

#Make a graph in which the means are plotted as black points, the standard
#errors as lines around the mean, and the observed data as open dots.

Le = tapply(Veg$R, Veg$Transect, length) #Number of observations
Veg.se = Sd / sqrt(Le) #Standard Error

stripchart(Veg$R ~ Veg$Transect, 
           vert = TRUE, pch = 1, method = "jitter", jit = 0.05,
           xlab = "Transect", ylab = "Richness",
           main = "Standard Error")
points(1:8, Me, pch = 16)
arrows(1:8, Me, 1:8, Me + Veg.se, lwd = 1.5, angle = 90, length = 0.1)
arrows(1:8, Me, 1:8, Me - Veg.se, lwd = 1.5, angle = 90, length = 0.1)

#ex3
#Using the vegetation data in Exercise 2, make a boxplot showing the richness
#values.

Veg = read.table(file = "RBook/Vegetation2.txt", header = TRUE)
names(Veg)
str(Veg)

boxplot(Veg$R, main = "Richness")

#ex4
#In Section 6.3.3, a cod parasite dataset was used. Make a boxplot of the
#number of parasites (Intensity) conditional on area, sex, stage, or year. Try
#combinations to detect interactions.

Parasite = read.table(file = "RBook/CodParasite.txt", header = TRUE)
names(Parasite)
str(Parasite)

boxplot(Intensity ~ Area, data = Parasite) #In answers
boxplot(Intensity ~ Sex, data = Parasite)
boxplot(Intensity ~ Year, data = Parasite)
boxplot(Intensity ~ Stage, data = Parasite)

boxplot(Intensity ~ Area * Sex, data = Parasite) #In answers
boxplot(Intensity ~ Area * Year, data = Parasite)
boxplot(Intensity ~ Area * Stage, data = Parasite)

boxplot(Intensity ~ Sex * Year, data = Parasite)
boxplot(Intensity ~ Sex * Stage, data = Parasite)

boxplot(Intensity ~ Stage * Year, data = Parasite)

#ex5
#In Section 7.3, we used the owl data. Make two Cleveland dotplots of nestling
#negotiation and arrival time. 

Owls = read.table(file = "RBook/Owls.txt", header = TRUE)
names(Owls)
str(Owls)

dotchart(Owls$NegPerChick, main = "Negotiations", xlab = "Negotiation", ylab = "Observations")
dotchart(Owls$ArrivalTime, main = "Arrival Times", xlab = "Arrival Time", ylab = "Observations")

#Make a Cleveland dotplot showing arrival time
#per night. The nest and food treatment variables show which observations were
#made on the same night. See also Exercise 2 in Section 6.6.

Owls$Night = ifelse(Owls$FoodTreatment == "Deprived", 1,  2) #Create column with night variable

dotchart(Owls$ArrivalTime,
         groups = factor(Owls$Night), #Could use FoodTreatment here instead
         main = "Arrival Time Per Night",
         xlab = "Arrival", ylab = "Observations")

#ex6
#Make a Cleveland dotplot for the parasite data that were used in Exercise 4.
#Use the number of parasites (Intensity), and group the observations by area,
#sex, stage, or by year. 

Parasite = read.table(file = "RBook/CodParasite.txt", header = TRUE)
names(Parasite)
str(Parasite)

dotchart(Parasite$Intensity,
         groups = factor(Parasite$Area),
         main = "Parasites",
         xlab = "Intensity", ylab = "Area"
         )

#Make a Cleveland dotplot showing depth, and group the observations by prevalence.

dotchart(Parasite$Depth,
         groups = factor(Parasite$Prevalence),
         main = "Parasites",
         xlab = "Depth", ylab = "Prevalence"
)











