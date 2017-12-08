#Chapter 1
#Topics:
# Simple math
# help options
# setwd()
# install.packages()
# library()
# q(save = "yes")
# citation()


2+2
2/9
2*7
78-63
log(2)
log10(2)

#Ask for help
#Use ?thingIneedHelpWith
?boxplot
#Alternatively
#help(thingIneedHelpWith)
help(boxplot)
#help("thingIneedHelpWith")
help("box")
#example from boxplot desc
boxplot(count ~ spray, data = InsectSprays, col = "lightgray")
#Sample data InsectSprays
?InsectSprays
#For more help go to R news group - www.r-project.org
setwd(file = "/home/valdeslab/Learning/LearningR")
#Load a package
library(MASS)
?glmmPQL
#Install a package - can also be done with the Install icon
#install.packages("packageToInstall")
install.packages("gstat")
library(gstat)

#Set working directory for default saving
setwd("/home/valdeslab/Learning/LearningR/")
#Clear all variables
rm(list = ls(all = TRUE))
#Quit R
q(save = "yes")
#Citations
citation()
citation("MASS")
