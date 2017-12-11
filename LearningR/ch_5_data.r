#Chapter 4
#Topics:
# Plotting
# plot()

#setwd("/home/diego/Learning/LearningR")
#rm(list = ls()) #clear environment

#plot()
Veg = read.table(file = "RBook/Vegetation2.txt", header = TRUE)
names(Veg)
str(Veg)
plot(Veg$BARESOIL, Veg$R) #Plot of R(richness) vs BARESOIL(exposed soil)
plot(x = Veg$BARESOIL, y = Veg$R) #Produces same plot as above

#Version 2
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed Soil", #xaxis label
     ylab = "Species Richness", #yaxis label
     main = "Scatter plot", # title
     xlim = c(0, 45), ylim = c(4, 19)) #graph bounds

#Can also use
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed Soil", #xaxis label
     ylab = "Species Richness", #yaxis label
     main = "Scatter plot", # title
     xlim = c(min(Veg$BARESOIL, na.rm = TRUE), max(Veg$BARESOIL, na.rm = TRUE)), #xaxis graph bounds
     ylim = c(min(Veg$R, na.rm = TRUE), max(Veg$R, na.rm = TRUE)) #yaxis graph bounds
     )

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed Soil", #xaxis label
     ylab = "Species Richness", #yaxis label
     main = "Scatter plot", # title
     xlim = c(min(Veg$BARESOIL, na.rm = TRUE), max(Veg$BARESOIL, na.rm = TRUE)), #xaxis graph bounds
     ylim = c(min(Veg$R, na.rm = TRUE), max(Veg$R, na.rm = TRUE)), #yaxis graph bounds
     pch = 16 #Controls the symbol to use in the graph. Default is 1, must be numerical
)

#pch can be a vector of values to change the symbols on the default
#Must have same length as xaxis
Veg$Transect
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed Soil", #xaxis label
     ylab = "Species Richness", #yaxis label
     main = "Scatter plot", # title
     xlim = c(min(Veg$BARESOIL, na.rm = TRUE), max(Veg$BARESOIL, na.rm = TRUE)), #xaxis graph bounds
     ylim = c(min(Veg$R, na.rm = TRUE), max(Veg$R, na.rm = TRUE)), #yaxis graph bounds
     pch = Veg$Transect #Controls the symbol to use in the graph. Default is 1
)

#create a vector for pch
Veg$Time2 = Veg$Time
Veg$Time2[Veg$Time <= 1974] = 1 #Convert less than 1974 to 1
Veg$Time2[Veg$Time > 1974] = 16 #Convert greater than 1974 to 16
Veg$Time2

#Use Veg$Time2 to distinguish time period
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed Soil", #xaxis label
     ylab = "Species Richness", #yaxis label
     main = "Scatter plot", # title
     xlim = c(min(Veg$BARESOIL, na.rm = TRUE), max(Veg$BARESOIL, na.rm = TRUE)), #xaxis graph bounds
     ylim = c(min(Veg$R, na.rm = TRUE), max(Veg$R, na.rm = TRUE)), #yaxis graph bounds
     pch = Veg$Time2 #Controls the symbol to use in the graph. Default is 1
)

#color
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed Soil", #xaxis label
     ylab = "Species Richness", #yaxis label
     main = "Scatter plot", # title
     xlim = c(min(Veg$BARESOIL, na.rm = TRUE), max(Veg$BARESOIL, na.rm = TRUE)), #xaxis graph bounds
     ylim = c(min(Veg$R, na.rm = TRUE), max(Veg$R, na.rm = TRUE)), #yaxis graph bounds
     col = 2 #Colors 
)

x = 1:8
plot(x, col = x) #Display all colors

#create a vector for col
#Redo Veg$Time2 for pch
Veg$Time2 = Veg$Time
Veg$Time2[Veg$Time <= 1974] = 15 #Convert less than 1974 to 15
Veg$Time2[Veg$Time > 1974] = 16 #Convert greater than 1974 to 16
Veg$Time2

Veg$Col2 = Veg$Time
Veg$Col2[Veg$Time <= 1974] = 1 #Black
Veg$Col2[Veg$Time > 1974] = 2 #Red

plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed Soil", #xaxis label
     ylab = "Species Richness", #yaxis label
     main = "Scatter plot", # title
     xlim = c(min(Veg$BARESOIL, na.rm = TRUE), max(Veg$BARESOIL, na.rm = TRUE)), #xaxis graph bounds
     ylim = c(min(Veg$R, na.rm = TRUE), max(Veg$R, na.rm = TRUE)), #yaxis graph bounds
     pch = Veg$Time2, #Controls the symbol to use in the graph. Default is 1
     col = Veg$Col2
)













