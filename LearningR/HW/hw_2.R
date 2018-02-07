setwd("/home/diego/Learning/LearningR") #Laptop 

Amphibian = read.table("RBook/Amphibian_road_Kills.csv", header = TRUE, sep = ",")
str(Amphibian)
names(Amphibian)

plot(x = Amphibian$TOT.N,
     y = Amphibian$D.PARK,
     xlab = "Dead Animals",
     ylab = "Olives on Site",
     main = "Chart",
     cex = Size)

Loess = loess(Amphibian$D.PARK ~ Amphibian$TOT.N, data = Amphibian)
Fit = fitted(Loess)
lines(Amphibian$D.PARK, Fit)

Size = Amphibian$OLIVE/10
Size
Size[Size <2 ] = 1
Size
Size[Size >1.99 & Size < 3] = 2
Size[Size >2.99 & Size < 4] = 3
Size[Size >3.99 & Size < 5] = 4
Size[Size >4.99 & Size < 6] = 5
Size[Size >5.99] = 6
Size
