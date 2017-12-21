
#Clears all plots
clear = function() {
  if (!is.null(dev.list())) dev.off()
}

#Number of NA values
naValues = function(X1) {
  colSums(is.na(X1))
}

#Remove rows with NA
removeNa = function(X1) {
  X1[complete.cases(X1), ] #Remove rows that have a na value
}
