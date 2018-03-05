# My first program in R Programming
myString <- "Hello, World! This is my plot!"
print ( myString)
pdf(file="./data/graphs/rplot.pdf")
#read in csv file
data <- read.csv(file="./data/csvs/t1_new.csv")
#plot it
plot(data$Frontend_Bound ~ data$Timestamp, type="o", col="red", main="Benchmarks", xlab="timestamp", ylab="measurment")
par(new=TRUE)
plot(data$Bad_Speculation ~ data$Timestamp, type="l", col="green", main="Benchmarks", xlab="timestamp", ylab="measurment")
#plot(data$Bad_Speculation.Branch_Mispredicts ~ data$Timestamp, type="l", col="green")
#dev.off()
legend( "bottomright", legend=c("Frontend_bound", "Bad_speculation"), col=c("red", "green"), lty=1:2, cex=0.8)


