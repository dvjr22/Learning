#Diego Vales
#CSCE 587
#3/22/17
#Midterm

############################################
######  Part 1: Setting up the data   ######
############################################

#1) Start by casting column 2 so that it is interpreted by R as a factor instead of an integer value
icu$STA <- as.factor(icu$STA)

#Partition the set of 200 instances/observations from the previous step into a new test set comprised of
#1/3 of the rows and a new training set comprised of 2/3 of the rows. We want to randomize the
#selection of rows into each partition. Call the test set test_set, and the training set train_set. Use the
#following steps to accomplish this

#a) Use set.seed(555) to set the seed for the random number generator. If you do not
#do this you will be massively penalized since your result will be hard to verify.
set.seed(555)

#b) Create a vector called “index” with indices for all observations. Since there are
#200 rows, your vector “index” should contains the values 1 to 200.
index <- c(1:200)

#c) Next create a vector of the indices for the test_set by randomly sampling 1/3 of
#the indices in “index” using the method sample(). This method takes two arguments.
#The first argument is the vector “index” and the second argument is the number of
#samples you want to randomly select. You should be selecting 1/3, i.e., 66.
vector.test_set <- sample(index, 66)

#d) Using the vector of test_set indices you created in step 2c, extract the test set,
#assigning it to test_set.
test_set <- icu[vector.test_set,]

#e) Select the remaining 134 rows as the train_set
#place everything from icu that isn't in vector.test_set
train_set <- icu[-vector.test_set,]

################################################################
######  Part 2: Naive Bayes Analysis of the icu dataset   ######
################################################################

#1) Using the naiveBayes() method from the package e1071, train a Naive Bayes model using the
#train_ set produced in part 1. Review the slides on Naïve Bayes (in particular the last several slides that
#cover the in-class lab). The arguments to naiveBayes() are the independent features and the dependent feature 
#(column 2), the feature you are predicting. By default, consider all features except for
#column 2 to be independent features.
library(e1071)
#use train_set w/ everything except STA and STA
naiveModel <- naiveBayes(train_set[,-2], train_set[,2])

#2) Continuing with the training data set train_set, create the confusion matrix using the table command as
#in slide 61 of the Naïve Bayes slides. Display the confusion matrix. 
confusionMatrix <- table(predict(naiveModel, train_set[,-2]), train_set[,2])
confusionMatrix
#     0  1
#     0 64  2
#     1 43 25

#3) Calculate the model accuracy from the model by summing up the correct classifications and dividing by
#the total number of observations. Recall that the table() command produces a confusion matrix
#which is a square matrix. The diagonal entries are the correct classifications. You can calculate the
#accuracy by summing the diagonal entries and dividing by the sum of all of the entries. 
sum(diag(confusionMatrix))/sum(confusionMatrix)
# = 0.6641791

#4) Repeat steps 2 & 3, using the testing data set, test_set. 
confusionMatrixTwo <- table(predict(naiveModel, test_set[,-2]), test_set[,2])
confusionMatrixTwo
#     0  1
#     0 35  2
#     1 18 11

sum(diag(confusionMatrixTwo))/sum(confusionMatrixTwo)
# = 0.6969697

##################################################################
######  Part 3: Decision Tree Analysis of the icu dataset   ######
##################################################################

#1) Using the rpart() method from the package rpart, train a Decision Tree model using the training
#data set train_set produced in part 1. Assign this decision tree model to the variable tree1, i.e.,
#tree1 <- rpart(......) 
tree1 <- rpart("STA ~ .", method = "class", data = train_set, control = rpart.control(minsplit=2, cp=0.05))
print(tree1)
plot(tree1, uniform = TRUE, main = "Classification Tree for Train")
text(tree1, use.n = TRUE, all = TRUE, cex = .7)

#2) Using the training data set train_set produced in part 1, create the confusion matrix using the table
#command along with tree1, the decision tree model you produced in step 1 of this part. Note: to make this
#work you will need to include a 3rd parameter to the predict() function. This parameter is type='class'
confusionMatrixThree <- table(predict(tree1, train_set[,-2], type = 'class'), train_set[,2])
confusionMatrixThree
#     0   1
#     0 105  14
#     1   2  13

#3) Calculate the model accuracy from the model by summing up the correct classifications and dividing by
#the total number of observations. Recall that the table() command produces a confusion matrix which is a
#square matrix. The diagonal entries are the correct classifications. You can calculate the accuracy by
#summing the diagonal entries and dividing by the sum of all of the entries. 
sum(diag(confusionMatrixThree))/sum(confusionMatrixThree)
# = 0.880597

#4) Repeat steps 2 & 3, using the testing data set, test_set. DO NOT REPEAT STEP 1. 
confusionMatrixFour <- table(predict(tree1, test_set[,-2], type = 'class'), test_set[,2])
confusionMatrixFour
#     0  1
#     0 50  7
#     1  3  6
sum(diag(confusionMatrixFour))/sum(confusionMatrixFour)
# = 0.8484848
