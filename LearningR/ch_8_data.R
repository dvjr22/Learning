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

#8.6.3

Sparrows<-read.table(file="RBook/Sparrows.txt", header=TRUE)
names(Sparrows)

#[1] "Species"  "Sex"      "Wingcrd"  "Tarsus"   "Head"     "Culmen"
#[7] "Nalospi"  "Wt"       "Observer" "Age"

library(lattice)


xyplot(Wingcrd ~ Tarsus | Species * Sex,
       xlab = "Axis 1", ylab = "Axis 2", data = Sparrows,
       xlim = c(-1.1, 1.1), ylim = c(-1.1, 1.1),
       panel = function(subscripts, ...){
         zi <- Sparrows[subscripts, 3:8]
         di <- princomp(zi, cor = TRUE)
         Load <- di$loadings[, 1:2]
         Scor <- di$scores[, 1:2]
         panel.abline(a = 0, b = 0, lty = 2, col = 1)
         panel.abline(h = 0, v = 0, lty = 2, col = 1)
         for (i in 1:6){
           llines(c(0, Load[i, 1]), c(0, Load[i, 2]), 
                  col = 1, lwd = 2)
           ltext(Load[i, 1], Load[i, 2], 
                 rownames(Load)[i], cex = 0.7)}
         sc.max <- max(abs(Scor))
         Scor <- Scor / sc.max
         panel.points(Scor[, 1], Scor[, 2], pch = 1,
                      cex = 0.5, col = 1)
       })



S1<-Sparrows[Sparrows$Species=="SESP" & Sparrows$Sex=="Female",3:8]

di <- princomp(S1, cor = TRUE)
Load <- di$loadings[, 1:2]
Scor <- di$scores[, 1:2]




cloud(CHLFa ~ T * SAL | Station, data = Env,
      screen = list(z = 105, x = -70),
      ylab = "Sal", xlab = "T", zlab = "Chl. a",
      ylim = c(26,33),
      subset = (Area=="OS"),
      scales = list(arrows = FALSE))



Hawaii <- read.table("RBook/waterbirdislandseries.txt", header = TRUE)
library(lattice)

names(Hawaii)

Birds <- as.vector(as.matrix(Hawaii[,2:9]))


Time <- rep(Hawaii$Year, 8)
MyNames <- c("Stilt_Oahu","Stilt_Maui","Stilt_Kauai_Niihau",
             "Coot_Oahu","Coot_Maui","Coot_Kauai_Niihau",
             "Moorhen_Oahu","Moorhen_Kauai")
ID <- rep(MyNames, each = 48)


xyplot(Birds ~ Time|ID, ylab = "Bird abundance",
       layout = c(3, 3), type = "l", col = 1)



ID2 <- factor(ID,
              levels=c(
                "Stilt_Oahu",
                "Stilt_Kauai_Niihau",
                "Stilt_Maui",
                "Coot_Oahu",
                "Coot_Kauai_Niihau",
                "Coot_Maui",
                "Moorhen_Oahu",
                "Moorhen_Kauai"))


xyplot(Birds ~ Time|ID2, ylab = "Bird abundance",
       layout = c(3, 3), type = "l", col = 1)




xyplot(Birds ~ Time|ID2, ylab = "Bird abundance",
       layout = c(3, 3), type = "l", col = 1,
       scales = list(x = list(relation = "same"),
                     y = list(relation = "free"),
                     tck=-1))

Species <-rep(c("Stilt","Stilt","Stilt",
                "Coot","Coot","Coot",
                "Moorhen","Moorhen"),each = 48)

xyplot(Birds ~ Time|Species, ylab = "Bird abundance",
       layout = c(2, 2), type = "l", col = 1,
       scales = list(x = list(relation = "same"),
                     y = list(relation = "free")),
       groups = ID, lwd=c(1,2,3))



xyplot(Stilt_Oahu + Stilt_Maui + Stilt_Kauai_Niihau ~ Year,
       ylab = "Bird abundance", data = Hawaii,
       layout = c(2, 2), type = "l", col = 1,
       scales = list(x = list(relation = "same"),
                     y = list(relation = "free")))


Env <- read.table(file ="RBook/RIKZENV.txt", header = TRUE)
library(lattice)

AllAreas <- levels(unique(Env$Area))
for (i in AllAreas  ){ 
  Env.i <- Env[Env$Area==i,]
  dotplot(factor(Month)~SAL | Station, 
          data = Env.i)
  win.graph()
}













