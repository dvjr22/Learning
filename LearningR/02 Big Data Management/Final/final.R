# Diego Valdes
# CSCE 587
# final
# 5/3/2017

# Set environmental variables

Sys.setenv(HADOOP_CMD="/usr/bin/hadoop")
Sys.setenv(HADOOP_STREAMING="/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/hadoop-streaming-2.7.1.2.3.0.0-2557.jar")

# Load the following packages in the following order
library(rhdfs)
library(rmr2)

# initialize the connection from rstudio to hadoop
hdfs.init()

################
# Problem 1
################

# origin [[17]], ActualElapsedTime [[12]], CRSElapsedTime[[13]]
# duration is Actual - CRS and inserted w/ origin
map1 = function(k, flights) {
  duration = as.numeric(flights[[12]]) - as.numeric(flights[[13]])
  return ( keyval( as.character(flights[[17]]), duration ))
}

# max flight time for each origin and deal w/ missing values
reduce1 = function(carrier, counts) {
  keyval(carrier, max(counts, na.rm = TRUE))
}

# Our mapreduce function which invokes map1 and reduce1 and parses
# the input file expected it to be comma delimited
mr1 = function(input, output = NULL) {
  mapreduce(input = input,
            output = output,
            input.format = make.input.format("csv", sep=","),
            map = map1,
            reduce = reduce1)
}

hdfs.root = '/user/share/student'
hdfs.data = file.path(hdfs.root,'allData.csv')
hdfs.out = file.path(hdfs.root,'FinalPart1_02')

# Invoke out mapreduce job
out = mr1(hdfs.data, hdfs.out)

# get results from HDFS and coerce into a dataframe and display
results = from.dfs(out)
results.df = as.data.frame(results, stringsAsFactors = F)
colnames(results.df) = c('Origin', 'Max Dev')
results.df

################
# Problem 2
################

# origin [[17]], ActualElapsedTime [[12]], CRSElapsedTime[[13]]
# duration is Actual - CRS and inserted w/ origin
map2 = function(k,flights) {
  duration = as.numeric(flights[[12]]) - as.numeric(flights[[13]])
  return ( keyval( as.character(flights[[17]]), duration ))
}

# max and min flight time for each origin
# 
# deal w/ missing values
reduce2 = function(carrier, counts) {
  keyval(carrier, c(max(counts, na.rm = TRUE), min(counts, na.rm = TRUE)))
  
}

# Our mapreduce function which invokes map1 and reduce1 and parses
# the input file expected it to be comma delimited
mr2 = function(input, output = NULL) {
  mapreduce(input = input,
            output = output,
            input.format = make.input.format("csv", sep=","),
            map = map2,
            reduce = reduce2)
}

hdfs.root = '/user/share/student'
hdfs.data = file.path(hdfs.root,'allData.csv')
hdfs.out = file.path(hdfs.root,'FinalPart2_01')

# Invoke out mapreduce job
out = mr2(hdfs.data, hdfs.out)

# get results from HDFS and coerce into a dataframe and display
results2 = from.dfs(out)
results2.df = as.data.frame(results2, stringsAsFactors = F)
colnames(results2.df) = c('Origin', 'Max/Min Dev')
results2.df

################
# Problem 3
################

# origin [[17]], ActualElapsedTime [[12]], CRSElapsedTime[[13]]
# duration is Actual - CRS and inserted w/ origin
map3 = function(k,flights) {
  carrier = as.character(flights[[9]])
  origin = as.character(flights[[17]])
  AAcombo = paste(carrier, origin, sep = "-")
  duration = as.numeric(flights[[12]]) - as.numeric(flights[[13]])
  return ( keyval( AAcombo, duration ))
}

# max and min flight time for each origin
# 
# deal w/ missing values
reduce3 = function(carrier, counts) {
  keyval(carrier, c(max(counts, na.rm = TRUE), min(counts, na.rm = TRUE)))
}

# Our mapreduce function which invokes map1 and reduce1 and parses
# the input file expected it to be comma delimited
mr3 = function(input, output = NULL) {
  mapreduce(input = input,
            output = output,
            input.format = make.input.format("csv", sep=","),
            map = map3,
            reduce = reduce3)
}

hdfs.root = '/user/share/student'
hdfs.data = file.path(hdfs.root,'allData.csv')
hdfs.out = file.path(hdfs.root,'FinalPart3_02')

# Invoke out mapreduce job
out = mr3(hdfs.data, hdfs.out)

# get results from HDFS and coerce into a dataframe and display
results3 = from.dfs(out)
results3.df = as.data.frame(results3, stringsAsFactors = F)
colnames(results3.df) = c('Airport/Carrier', 'Max/Min Devs')
results3.df

write.csv(results.df, file = "resultsFinal01.csv", row.names = FALSE)
write.csv(results2.df, file = "resultsFinal02.csv", row.names = FALSE)
write.csv(results3.df, file = "resultsFinal03.csv", row.names = FALSE)

