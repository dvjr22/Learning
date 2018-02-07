LengthCT = c(75, 85, 91.6,95,NA, 105.5,106)
Tb = c(0, 0, 1, NA, 0, 0, 0)
Farm = c('MO', 'MO', 'MO', 'MO', 'LN', 'SE', 'QM')
Month = c(11, 7, 7, NA, 9, 9, 11)
Boar = cbind(Farm, Month, LengthCT, Tb)
ncol(Boar)
nrow(Boar)
Df = data.frame(Boar)


setwd("/home/diego/Learning/LearningR") #Laptop 
Deer = read.table("RBook/Deer.txt", header = TRUE)
str(Deer)
names(Deer)

mean(Deer$LCT, na.rm = TRUE)
max(Deer$Ecervi, na.rm = TRUE)
min(Deer$KFI, na.rm = TRUE)

Num = c(1,2,3,4,2,1,2,3,0)
D = matrix(Num, 3, 3, byrow = TRUE)
Dt = t(D)
solve(D)
solve(D)%*% D
diag(3)
