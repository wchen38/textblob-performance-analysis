# My first program in R Programming
myString <- "Hello, World! This is my plot!"
print ( myString)
pdf(file="../data/graphs/t2/t2_1T_L1MKI.pdf")
#read in csv file
data <- read.csv(file="../data/csvs/t2/t2_new.csv", header=TRUE)
#class(data)
#head(data)
#print("L1MPK: ", data[1])
#plot it
data$L1.dcache.load.misses <- data$L1.dcache.load.misses / (1000*data$instructions)
data$l2_rqsts.miss <- data$l2_rqsts.miss / (1000*data$instructions)
data$branch.misses <- data$branch.misses / (1000*data$instructions)
data$cycles <- data$instructions/data$cycles

plot(data$L1.dcache.load.misses ~ data$Timestamp, type="l", col="red", main="Benchmarks", xlab="timestamp", ylab="measurment")
plot(data$l2_rqsts.miss ~ data$Timestamp, type="l", col="red", main="thread1:1T inst L2MKI", xlab="timestamp", ylab="measurment")
plot(data$branch.misses ~ data$Timestamp, type="l", col="red", main="thread1:1T inst branchMKI", xlab="timestamp", ylab="measurment")
plot(data$cycles ~ data$Timestamp, type="l", col="red", main="thread1:1T inst IPC", xlab="timestamp", ylab="measurment")
#par(new=TRUE)
