# My first program in R Programming
myString <- "Hello, World! This is my plot!"
print ( myString)
pdf(file="./data/graphs/rplot.pdf")
#read in csv file
data <- read.csv(file="./data/csvs/t1_new.csv", header=TRUE)
#class(data)
#head(data)
#print("L1MPK: ", data[1])
#plot it
data$L1.dcache.load.misses <- data$L1.dcache.load.misses / (1000*data$instructions)
plot(data$L1.dcache.load.misses ~ data$Timestamp, type="l", col="red", main="Benchmarks", xlab="timestamp", ylab="measurment")
#plot(data$Frontend_Bound ~ data$Timestamp, type="o", col="red", main="Benchmarks", xlab="timestamp", ylab="measurment")
#par(new=TRUE)
#plot(data$Bad_Speculation ~ data$Timestamp, type="l", col="green", main="Benchmarks", xlab="timestamp", ylab="measurment")
#dev.off()
#legend( "bottomright", legend=c("Frontend_bound", "Bad_speculation"), col=c("red", "green"), lty=1:2, cex=0.8)
legend( "bottomright", legend=c("L1MKI"), col=c("red"), lty=1:2, cex=0.8)

