# My first program in R Programming
myString <- "Hello, World! This is my plot!"
print ( myString)
pdf(file="../data/graphs/t8/t8_1T256.pdf")
#read in csv file
data <- read.csv(file="../data/csvs/t8/t8_new.csv", header=TRUE)
#class(data)
#head(data)
#print("L1MPK: ", data[1])
#plot it
data$L1.dcache.load.misses <- data$L1.dcache.load.misses / (1000*data$instructions)
data$l2_rqsts.miss <- data$l2_rqsts.miss / (1000*data$instructions)
data$branch.misses <- data$branch.misses / (1000*data$instructions)
data$cycles <- data$instructions/data$cycles
data$LLC.load.misses <- data$LLC.load.misses / (1000*data$instructions)

plot(data$L1.dcache.load.misses ~ data$Timestamp, type="l", col="red", main="1T256 L1MKI", xlab="timestamp", ylab="measurment")
plot(data$l2_rqsts.miss ~ data$Timestamp, type="l", col="red", main="thread8:1T256 inst L2MKI", xlab="timestamp", ylab="measurment")
plot(data$branch.misses ~ data$Timestamp, type="l", col="red", main="thread8:1T256 inst branchMKI", xlab="timestamp", ylab="measurment")
plot(data$cycles ~ data$Timestamp, type="l", col="red", main="thread8:1T256 inst IPC", xlab="timestamp", ylab="measurment")
plot(data$LLC.load.misses ~ data$Timestamp, type="l", col="red", main="thread8:1T256 inst L3MKI", xlab="timestamp", ylab="measurment")
#dev.off()
