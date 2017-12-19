#Chapter 6
#Topics:
# Loops
# Functions

#setwd("/home/diego/Learning/LearningR") #Laptop 
#setwd("/home/valdeslab/Learning/LearningR") #GreenMachine
#rm(list = ls()) #clear environment

Owls = read.table(file = "RBook/Owls.txt", header = TRUE)
names(Owls)
str(Owls)
summary(Owls)
unique(Owls$Nest)

Owls.ATV = Owls[Owls$Nest == "AutavauxTV", ] #Get nest data
Owls.ATV
str(Owls.ATV)
#Plot arrival time vs negotiation behavior
plot(x = Owls.ATV$ArrivalTime, y = Owls.ATV$NegPerChick,
     main = "AutavauxTV",
     xlab = "Arrival Time",
     ylab = "Negotiation Behaviour"
     )

#Bot nest data
Owls.Bot = Owls[Owls$Nest == "Bochet", ]
Owls.Bot
str(Owls.Bot)
plot(x = Owls.Bot$ArrivalTime, y = Owls.Bot$NegPerChick,
     main = "Bochet",
     xlab = "Arrival Time",
     ylab = "Negotiation Behaviour"
)

#Modify Bot code for better functunality
setwd("/home/valdeslab/Learning/LearningR/Plots/Chapter_6") #GreenMachine for storing plots
Nest.i = "Bochet" #Nest name
Owls.i = Owls[Owls$Nest == Nest.i, ] #All nest data
FileName = paste(Nest.i, ".jpg", sep = "") #Create file name
jpeg(file = FileName) #Open file for storage, all output saved here
plot(x = Owls.i$ArrivalTime, y = Owls.i$NegPerChick,
     main = Nest.i,
     xlab = "Arrival Time",
     ylab = "Negotiation Behaviour"
)
dev.off() #Close file

setwd("/home/valdeslab/Learning/LearningR/Plots/Chapter_6/ChapterWork") #GreenMachine for storing plots
#Put it all in a loop
AllNests = unique(Owls$Nest)
for (i in 1:27){
  Nest.i = AllNests[i]
  Owls.i = Owls[Owls$Nest == Nest.i, ] #All nest data
  FileName = paste(Nest.i, ".jpg", sep = "") #Create file name
  jpeg(file = FileName) #Open file for storage, all output saved here
  plot(x = Owls.i$ArrivalTime, y = Owls.i$NegPerChick,
       main = Nest.i,
       xlab = "Arrival Time",
       ylab = "Negotiation Behaviour"
  )
  dev.off() #Close file
}

#Functions
setwd("/home/valdeslab/Learning/LearningR") #GreenMachine

Veg = read.table(file = "RBook/Vegetation2.txt", header = TRUE)
names(Veg)
str(Veg)

#Calculate missing variables using a function
#Will throw error on vector
NAPerVariable = function(X1) {
  D1 = is.na(X1) #Create an equivalent data structure with boolean values
  colSums(D1) #Sum up the columns
  #Final line of function is what is returned
}

NAPerVariable(Veg[ , 5:24])
NAPerVariable(Veg)

Parasite = read.table(file = "RBook/CodParasite.txt", header = TRUE)
names(Parasite)
str(Parasite)

NAPerVariable(Parasite)

#Calculate the number of 0
ZerosPerVariable = function(X1) {
  D1 = (X1 == 0) #True if a value is 0
  colSums(D1, na.rm = TRUE) #Ignore missing values
}

ZerosPerVariable(Parasite)

#Combine both functions to give calculation for NA or 0
VariableInfo = function(X1, Choice1) {
  if(Choice1 == "Zeros") { D1 = (X1 == 0) }
  if(Choice1 == "NAs") { D1 =is.na(X1) }
  colSums(D1, na.rm = TRUE)
}

VariableInfo(Parasite, "Zeros")
VariableInfo(Parasite, "NAs")

#Default value 
#Combine both functions to give calculation for NA or 0
VariableInfo = function(X1, Choice1 = "Zeros") { 
  if(Choice1 == "Zeros") { D1 = (X1 == 0) }
  if(Choice1 == "NAs") { D1 =is.na(X1) }
  colSums(D1, na.rm = TRUE)
}

VariableInfo(Parasite)
VariableInfo(Parasite, "NAs")

#Print errors
#Combine both functions to give calculation for NA or 0
VariableInfo = function(X1, Choice1 = "Zeros") { 
  if(Choice1 == "Zeros") { D1 = (X1 == 0) }
  if(Choice1 == "NAs") { D1 =is.na(X1) }
  if(Choice1 != "Zeros" & Choice1 != "NAs") {
    print("You made a typo")
  } else {
    colSums(D1, na.rm = TRUE)
  }
  
}

VariableInfo(Parasite, "Nas")

#Create a function

#Import and examine data
Benthic = read.table("RBook/RIKZ.txt", header = TRUE)
names(Benthic)
str(Benthic)

Species = Benthic[, 2:76] #Extract species data
n = dim(Species) #Dimensions of Species
n

#Abundance per site
sum(Species[1, ], na.rm = TRUE) #How many total observations at site 1
sum(Species[2, ], na.rm = TRUE) #... site 2

TA = vector(length = n[1]) #Vector to hold sum data
#Calculate and store abundance
for (i in 1:n[1]) {
  TA[i] = sum(Species[i, ], na.rm = TRUE)
}
TA
#Can also be done using
TA = rowSums(Species, na.rm = TRUE)
TA

#Richness per site
sum(Species[1, ] > 0, na.rm = TRUE) #Number of species at site 1
sum(Species[2, ] > 0, na.rm = TRUE) #... site 2

Richness = vector() #Vector to hold data
#Richness for each site
for (i in 1:n[1]) {
  Richness[i] = sum(Species[i, ] > 0, na.rm = TRUE)
}
Richness
#More efficient way
Richness = rowSums(Species > 0, na.rm = TRUE)
Richness

#Shannon Index per site
RS = rowSums(Species, na.rm = TRUE)
prop = Species / RS #Divide Species[i, j] / RS[i]
H = -rowSums(prop * log10(prop), na.rm = TRUE) #Matrix multiplication and then sum up rows

#Can also be done:
#vegan must be installed
library(vegan)
T = diversity(Species, base = 10)
#For comparison
all.equal(H,T)

#Combining Code
Choice = "Richness"
if(Choice == "Richness"){ index = rowSums(Species > 0, na.rm = TRUE) }
if(Choice == "Total Abundance") {index = rowSums(Species, na.rm = TRUE) }
if(Choice == "Shannon") {
  RS = rowSums(Species, na.rm = TRUE)
  prop = Species / RS #Divide Species[i, j] / RS[i]
  index = -rowSums(prop * log10(prop), na.rm = TRUE) #Matrix multiplication and then sum up rows
}

#Put into function
index.function = function(Spec, Choice1) {
  if(Choice1 == "Richness"){ index = rowSums(Spec > 0, na.rm = TRUE) }
  if(Choice1 == "Total Abundance") {index = rowSums(Spec, na.rm = TRUE) }
  if(Choice1 == "Shannon") {
    RS = rowSums(Species, na.rm = TRUE)
    prop = Spec / RS #Divide Species[i, j] / RS[i]
    index = -rowSums(prop * log10(prop), na.rm = TRUE) #Matrix multiplication and then sum up rows
  } else {
    print("Check your choice")
    Index = NA
  }
  list(Index = index, MyChoice = Choice1)
}

index.function(Species, "Shannon")
