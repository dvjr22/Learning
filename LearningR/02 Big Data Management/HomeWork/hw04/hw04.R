# Diego Valdes
# CSCE 587
# hw04
# 4/6/17

#### part 1

# Load in data from https://cse.sc.edu/~rose/587/CSV/MDT.csv
mdt <- read.csv("MDT.csv")

# Use  MDT$MeanDailyTemp as y and 1:length(y) as x
y = mdt$MeanDailyTemp
x = 1:length(y)

# plot time series data, ie,  y~x
plot(x,y,main="plot(x,y)")

# fit to linear model
linear = lm(y ~ x)

# add line in red to the plot from step 3
abline(linear, col = "red")

# detrend y by subtracting the linear model from y
detrendedY = y - predict(linear)

# plot the detrended result
plot(detrendedY)

#### part 2

# create a function dailyAverage(detrendedY,day) to calculate the average for a day  
# Where: detrendedY is the detrended time series data and 
# day specifices  which daily average is requested
# Returns average detrended Y value for day
dailyAverage = function (detrendedY, day){
  toAvg <- detrendedY[seq(day, length(detrendedY), 365)]
  return  (sum(toAvg)/length(toAvg))
}

# create a function deCycle(detrendedY)
# Where: detrendedY is the detrended time series data
# Returns the results of the average daily value for each day on the detrended time series
# Note: This function uses dailyAverage() to provide the daily average. SIMPLIFYING ASSUMPTION: ASSUME all years are 365 days long.
deCycle = function (detrendedY){
  for (i in 1:365){
    detrendedY[i] = detrendedY[i] - dailyAverage(detrendedY, i)
    detrendedY[i+365] = detrendedY[i] - dailyAverage(detrendedY, i)
    detrendedY[i+(2*365)] = detrendedY[i] - dailyAverage(detrendedY, i)
    detrendedY[i+(3*365)] = detrendedY[i] - dailyAverage(detrendedY, i)
  }
  return (detrendedY)
}

# plot detrended results (same as step 7 from Part 1)
plot(detrendedY)

# use your method deCycle() to remove the cyclic component from the detrended results
cyclic = deCycle(detrendedY)

# in red, add the results from step 4 to the plot
par(new = TRUE)
plot(cyclic, col = "red")
