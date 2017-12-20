#Exercises Chapter 7

#setwd("/home/diego/Learning/LearningR") #Laptop 
#setwd("/home/valdeslab/Learning/LearningR") #GreenMachine
#rm(list = ls()) #clear environment

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
