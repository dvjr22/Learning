#Diego Valdes
#CSCE 587
#Mar 2017
#HW 3

#MaunaLoa data
maunaloa <- read.csv("MaunaLoa.csv")
View(maunaloa)
attach(maunaloa)
plot(interpolated ~ DecimalDate)
model = lm(interpolated ~ DecimalDate)
par(mfrow=c(2,2))
plot(model)
#explain model
#Residuals vs Fitted
#The plot is nonlinear and shows that y and x don't correspond and can't be used
#to determine on how each other should behave. 

ypred = predict(model)
par(mfrow=c(1,1))
plot(y,y,type='l', xlab="observed y", ylab="predicted y")
points(y, ypred)
#explain if i.i.d
#I beleive the data is iid b/c it appears that each point is evenly distributed 
#with the others.  There is a steady climb in the sample that can be applied to
#other statistical models

#icu data
icu <- read.csv("icu.csv")
attach(icu)
View(icu)
plot(STA ~ AGE)
plot(STA ~ SYS)
library("MASS")

glm.out01 = glm(STA ~ AGE, family=binomial(logit), data=icu)
glm.out02 = glm(STA ~ AGE+SYS, family=binomial(logit), data=icu)
summary(glm.out01)
#Coefficients:
#  		Estimate Std. Error z value Pr(>|z|)    
#(Intercept) -3.05851    0.69608  -4.394 1.11e-05 ***
#AGE          0.02754    0.01056   2.607  0.00913 ** 
summary(glm.out02)
#Coefficients:
#  		Estimate Std. Error z value Pr(>|z|)   
#(Intercept) -0.962471   1.000272  -0.962  0.33594   
#AGE          0.028407   0.010774   2.637  0.00838 **
#SYS         -0.016831   0.005859  -2.873  0.00407 **

#The value for glm.out01 = 0.02754 and glm.out02 = 0.028407










