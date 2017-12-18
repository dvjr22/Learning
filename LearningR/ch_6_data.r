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
#pg 109














