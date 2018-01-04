#Chapter 8
#Topics:
# lattice package
# xyplot()
# bwplot()
# dotplot()
# histogram()
# densityplot()
# Panel Functions

rm(list = ls()) #clear environment
setwd("/home/valdeslab/Learning/LearningR") #GreenMachine
#setwd("/home/diego/Learning/LearningR") #Laptop 

#Load packages
library(lattice)
library(grid)

#Mulitpanel Scatterplots - xyplot
Env = read.table("RBook/RIKZENV.txt", header = TRUE)
names(Env)
str(Env)

Env$MyTime = Env$Year + Env$dDay3 / 365 #Generate time in days

#plot salinity vs time, conditional on station
xyplot(SAL ~ MyTime | factor(Station),
       type = "l", #Draws a line between the points
       strip = function(bg, ...)
       strip.default(bg = 'white', ...),
       col.line = 1, data = Env)

#For comparison
xyplot(SAL ~ MyTime | factor(Station), data = Env)

xyplot(SAL ~ MyTime | factor(Station), 
       type = "l", strip = TRUE, col.line = 1,
       data = Env)

xyplot(SAL ~ MyTime | factor(Station), 
       type = "l", strip = FALSE, col.line = 1,
       data = Env)

#Multiplanel Boxplots - bwplot()
bwplot(SAL ~ factor(Month) | Area,
       strip = strip.custom(bg = 'white'),
       cex = 0.5, layout = c(2,5),
       data = Env, xlab = "Month", ylab = "Salinity",
       par.settings = list(
         box.rectangle = list(col =1),
         box.umbrella = list(col = 1),
         plot.symbol = list(cex = .5, col = 1)
       ))
#Shorter version of above
bwplot(SAL ~ factor(Month) | Area, layout = c(2,5),
       data = Env, xlab = "Month", ylab = "Salinity")

#Multipanel Cleveland Dotplots - dotplot()
dotplot(factor(Month) ~ SAL | Station,
        subset = Area == "OS", #Select a subsection of data - subset = (Area == "OS") also correct
        jitter.x = TRUE, #Adds variations to show multiple observations
        col = 1, data = Env, strip = strip.custom(bg = 'white'),
        cex = 0.5, ylab = "Month", xlab = "Salinity")

#Multipanel Histograms - histogram()
histogram( ~ SAL | Station, data = Env,
           subset = (Area == "OS"), 
           layout = c(1,4), # 1 col, 4 rows
           nint = 30, #Number of bars
           xlab = "Salinity", ylab = "Frequencies", 
           strip = FALSE, strip.left = TRUE #Move strip to side of panels
           )

densityplot( ~ SAL | Station, data = Env,
           subset = (Area == "OS"), 
           layout = c(1,4), # 1 col, 4 rows
           xlab = "Salinity", ylab = "Frequencies", 
           strip = FALSE, strip.left = TRUE #Move strip to side of panels
)

#Panel Functions
xyplot(SAL ~ Month | factor(Year),  data = Env,
       type = c("p"), subset = (Station == "GROO"),
       xlim = c(0, 12), ylim = c(0,30), pch = 19,
       panel = function (...) {
         panel.xyplot(...) 
         panel.grid(..., h = -1, v = -1) #Add grid, negative values force alignment to data
         panel.loess(...) #Add smoothing line
       })

#Simpler version
xyplot(SAL ~ Month | Year, data = Env,
       subset = (Station == "GROO"), pch = 19,
       xlim = c(0, 12), ylim = c(0, 30),
       type = c("p", "g", "smooth")) #execute panel.xyplot, panel.grid, and panel.smooth

#Plot and show the outlier 
dotplot(factor(Month) ~ SAL | Station, pch = 16,
        subset = (Area == "OS"), data = Env,
        ylab = "Month", xlab = "Salinity",
        panel = function(x, y, ...) {
          Q = quantile(x, c(0.25, 0.5, 0.75), na.rm = TRUE)
          R = Q[3] - Q[1]
          L = Q[2] - 3 * (Q[3] - Q[1])
          MyCex = rep(0.4, length(y))
          MyCol = rep(1, length(y))
          MyCex[x < L] = 1.5
          MyCol[x < L] = 2
          panel.dotplot(x, y, cex = MyCex, col = MyCol, ...)
        })

















