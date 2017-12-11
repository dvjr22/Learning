#Chapter 4
#Topics:
# Functions
# mean(), sd(), length()
# tapply(), sapply(), lapply()
# summary(), table()

#setwd("/home/diego/Learning/LearningR")
Veg = read.table(file = "RBook/Vegetation2.txt", header = TRUE)
names(Veg)
str(Veg)

#Mean per Transect
m = mean(Veg$R)
m1 = mean(Veg$R[Veg$Transect == 1]) #Mean of Veg$R where Veg$Transect = 1
m2 = mean(Veg$R[Veg$Transect == 2]) 
m3 = mean(Veg$R[Veg$Transect == 3])
m4 = mean(Veg$R[Veg$Transect == 4])
m5 = mean(Veg$R[Veg$Transect == 5])
m6 = mean(Veg$R[Veg$Transect == 6])
m7 = mean(Veg$R[Veg$Transect == 7])
m8 = mean(Veg$R[Veg$Transect == 8])
c(m, m1, m2, m3, m4, m5, m6, m7, m8) #Display all the means

#tapply()
#Calculate more efficietly
#Splits data of 1st var based on levels of 2nd var and applies the specified function (subset observations)
Me = tapply(Veg$R, Veg$Transect, mean) #tapply(X = Veg$R, INDEX = Veg$Trnsect, FUN = mean)
Sd = tapply(Veg$R, Veg$Transect, sd) #Standard deviation
Le = tapply(Veg$R, Veg$Transect, length) #Number of observations
cbind(Me, Sd, Le) #Display results

#sapply()
sapply(Veg[, 5:9], FUN = mean) #Mean of columns 5 - 9
#sapply(Veg[, 5:9], FUN = mean) is the same as 5 lines below
mean(Veg$R)
mean(Veg$ROCK)
mean(Veg$LITTER)
mean(Veg$ML)
mean(Veg$BARESOIL)

#lapply()
lapply(Veg[, 5:9], FUN = mean) #Same as sapply() but presents results in list

#Can adust the format of the output
#vector
VegVector = sapply(cbind(Veg$R, Veg$ROCK, Veg$LITTER, Veg$ML, Veg$BARESOIL), FUN = mean)
VegVector #Will not be accurate
#data.frame
Veg.dataframe = sapply(data.frame(cbind(Veg$R, Veg$ROCK, Veg$LITTER, Veg$ML, Veg$BARESOIL)), FUN = mean)
Veg.dataframe 
Veg.dataframe2 = sapply(Veg[, 5:9], FUN = mean)
Veg.dataframe2 
is.data.frame(Veg.dataframe) #Not a data.frame
is.data.frame(Veg.dataframe2) #Not a data.frame

Dfrm = data.frame(sapply(Veg[, 5:9], FUN = mean)) #This is a data.frame
is.data.frame(Dfrm)
Dfrm 
Dfrm = t(Dfrm) #Transpose data.frame
Dfrm

#summary()
Z = cbind(Veg$R, Veg$ROCK, Veg$LITTER)
colnames(Z) = c("R", "ROCK", "LITTER")
summary(Z)
#Produces same result
summary(Veg[ , c("R", "ROCK", "LITTER")])
summary(Veg[ , c(5,6,7)])

#table()
Deer = read.table(file = "RBook/Deer.txt", header = TRUE)
names(Deer)
str(Deer)
summary(Deer)

#returns number a var appears
table(Deer$Farm) #Number of observations per farm
table(Deer$Sex) #Number of male and female observations
table(Deer$Sex, Deer$Year) #Number of observations sex appears accross years












