#Exercises Chapter 8

#setwd("/home/diego/Learning/LearningR") #Laptop 
setwd("/home/valdeslab/Learning/LearningR") #GreenMachine
rm(list = ls()) #clear environment

#ex1
#Load the lattice package and investigate some of the possibilities by typing in
#demo(lattice). Type in ?xyplot and copy and paste some of the examples.

library(lattice)
library(grid)
demo(lattice)
?xyplot

#ex2
#Create a multipanel scatterplot in which temperature is plotted versus time
#for each station. What is immediately obvious? Do the same for each area.
#What goes wrong and how can you solve this? Add a smoother and a grid to
#each panel.

Env = read.table("RBook/RIKZENV.txt", header = TRUE)
names(Env)
str(Env)

Env$MyTime = Env$Year + Env$dDay3 / 365 #Generate time in days

xyplot(T ~ MyTime | factor(Station), 
       type = "l", strip = TRUE, col.line = 1,
       data = Env)

xyplot(T ~ Area | factor(Station), 
       type = "l", strip = TRUE, col.line = 1,
       data = Env) #No good

xyplot(T ~ MyTime | Area, 
       type = c("g","smooth", "l"),
       strip = TRUE, col.line = 1,
       data = Env)

#ex3
#Create a boxplot in which temperature is plotted versus month for each area.
#Compare with the boxplot for the salinity data and comment on the differences
#in the patterns.

#Salinity
bwplot(SAL ~ factor(Month) | Area,
       strip = strip.custom(bg = 'white'),
       cex = 0.5, layout = c(2,5),
       data = Env, 
       main = "Salinity",xlab = "Month", ylab = "Salinity",
       par.settings = list(
         box.rectangle = list(col =1),
         box.umbrella = list(col = 1),
         plot.symbol = list(cex = .5, col = 1)
       ))

#Temperature
bwplot(T ~ factor(Month) | Area,
       strip = strip.custom(bg = 'white'),
       cex = 0.5, layout = c(2,5),
       data = Env, 
       main = "Temperature", xlab = "Month", ylab = "Salinity",
       par.settings = list(
         box.rectangle = list(col =1),
         box.umbrella = list(col = 1),
         plot.symbol = list(cex = .5, col = 1)
       ))

#Ex4
#Use Cleveland dotplots to discover if there are more outliers in the salinity
#data, making a lattice plot with all stations as panels. Compare with Fig. 8.3.
#What can be noted on the scale of the y-axis? Look up the argument relation
#in the help page of xyplot and use it.

dotplot(factor(Month) ~ SAL | Station,
        jitter.x = TRUE, #Adds variations to show multiple observations
        col = 1,
        data = Env, 
        strip = strip.custom(bg = 'white'),
        cex = 0.5, ylab = "Month", xlab = "Salinity")

#From answer key, with a few modifications
dotplot(factor(Month) ~ SAL | Station,
        strip = strip.custom(bg = 'white'),
        scales = list (
          y = list (relation = "free",  cex = .6),
          x = list (cex = .6)
          ),
        cex = .2,pch=16,
        data = Env, xlab = "Month",
        ylab = "Salinity")









