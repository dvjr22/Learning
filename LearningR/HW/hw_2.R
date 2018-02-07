setwd("/home/diego/Learning/LearningR") #Laptop 
setwd("/home/valdeslab/Learning/LearningR") #GreenMachine

#Part 1
Amphibian = read.table("RBook/Amphibian_road_Kills.csv", header = TRUE, sep = ",")
str(Amphibian)
names(Amphibian)

Amphibian$Size = Amphibian$OLIVE/10
Amphibian$Size[Amphibian$Size < 2 ] = 1
Amphibian$Size[Amphibian$Size > 2 & Amphibian$Size < 4] = 2
Amphibian$Size[Amphibian$Size > 4 ] = 3

plot(x = Amphibian$D.PARK,
     y = Amphibian$TOT.N,
     xlab = "Dead Animals",
     ylab = "Olives on Site",
     main = "Chart",
     cex = Amphibian$Size,
     col = Amphibian$Size)

Loess = loess(Amphibian$TOT.N ~ Amphibian$D.PARK)
Fit = fitted(Loess)
Order1 = order(Amphibian$D.PARK) # vector of D.Park in accending order
lines(Amphibian$D.PARK[Order1], Fit) # ensure D.Park is plotted in order

#Part2
Flu = read.table("RBook/BirdFluDeaths.txt", header = TRUE, check.names = FALSE)
str(Flu)
names(Flu)
titles = colnames(Flu)
titles[8] = 'Indonesia'
colnames(Flu) = titles

op = par(mfrow = c(1,2))
DeathsYear = rowSums(Flu[ , 2:16])
names(DeathsYear) = c(2003,2004,2005,2006,2007,2008)
pie(DeathsYear, main = "Deaths by year",
    col = gray(seq(0.4, 1.0, length = 6))
)

DeathsCountry = colSums(Flu[, 2:16])
pie(DeathsCountry, col = rainbow(6), clockwise = TRUE, main = "Deaths by Country")

par(op)

#part3
data("iris")
str(iris)
names(iris)
MaxSl = max(iris$Sepal.Length)
MinSl = min(iris$Sepal.Length)
MaxPl = max(iris$Sepal.Length)
MinPl = min(iris$Sepal.Width)
str(iris$Sepal.Length)
unique(iris$Species)
Setosa = iris$Sepal.Length[iris$Species == 'setosa']
Versicolor = iris$Sepal.Length[iris$Species == 'versicolor']
Virginica = iris$Sepal.Length[iris$Species == 'virginica']

par(mfrow=c(1,3))
plotSet <-hist(Setosa, col="blue", xlim=c(4, 8), ylim=c(0,14), breaks=seq(4, 8, 0.2)) 
plotVer <- hist(Versicolor, col="yellow", xlim=c(4, 8), ylim=c(0,14), breaks=seq(4, 8, 0.2)) 
plotVir <- hist(Virginica, col="red", xlim=c(4, 8), ylim=c(0,14), breaks=seq(4, 8, 0.2))

