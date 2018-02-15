# Diego Valdes
# CSCE 587
# hw 5
# 4/18/17

# Set environmental variables

Sys.setenv(HADOOP_CMD="/usr/bin/hadoop")
Sys.setenv(HADOOP_STREAMING="/usr/hdp/2.3.0.0-2557/hadoop-mapreduce/hadoop-streaming-2.7.1.2.3.0.0-2557.jar")

# Load the following packages in the following order
library(rhdfs)
library(rmr2)

# initialize the connection from rstudio to hadoop
hdfs.init()

################
# Part 1
################

#  create a set of map, reduce, mapreduce functions to process the data
# count origin [[17]] and cancellations [[22]]
map1 = function(k,flights) {
  return ( keyval(as.character(flights[[17]]),as.numeric(flights[[22]])))
}

# sums up the flights for each airline and deal w/ missing values
reduce1 = function(carrier, counts) {
  keyval(carrier, sum(counts, na.rm = TRUE))
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

# Set up the input definition and output definition
hdfs.root = '/user/share/student'
hdfs.data = file.path(hdfs.root,'test_203694.csv')
hdfs.out = file.path(hdfs.root,'hw05counts1')

# Invoke out mapreduce job
out = mr1(hdfs.data, hdfs.out)

# get results from HDFS and coerce into a dataframe and display
results = from.dfs(out)
results.df = as.data.frame(results, stringsAsFactors=F)
colnames(results.df) = c('Origin', 'Cancelled')
results.df

################
# Part 2
################


#  create a set of map, reduce, mapreduce functions to process the data
# count destination [[18]] and taxi in [[20]]
map2 = function(k,flights) {
  return ( keyval(as.character(flights[[18]]),as.numeric(flights[[20]])))
}

# get max value f/ each dest and deal w/ missing values
reduce2 = function(carrier, counts) {
  keyval(carrier, max(counts, na.rm = TRUE))
}

# mapreduce function which invokes map2 and reduce2 and parses
# the input file expected it to be comma delimited
mr2 = function(input, output = NULL) {
  mapreduce(input = input,
            output = output,
            input.format = make.input.format("csv", sep=","),
            map = map2,
            reduce = reduce2)
}


# Set up the input definition and output definition
hdfs.root = '/user/share/student'
hdfs.data = file.path(hdfs.root,'test_203694.csv')
hdfs.out = file.path(hdfs.root,'hw05testmax6')

# Invoke out mapreduce job
out = mr2(hdfs.data, hdfs.out)

# get results from HDFS and coerce into a dataframe and display
results2 = from.dfs(out)
results2.df = as.data.frame(results2, stringsAsFactors=F)
colnames(results2.df) = c('Airport', 'Max Taxi In')
results2.df

write.csv(results.df, file = "resultsI.csv", row.names = FALSE)
write.csv(results2.df, file = "resultsII.csv", row.names = FALSE)
