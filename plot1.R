setwd("C:/Users/Samsung/Downloads/eda")
data<-read.table("household_power_consumption.txt", header=T,sep=";" ,na="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
mydata<-subset(data,Date=="2007-02-01" | Date=="2007-02-02")
png(file="plot1.png")
hist(mydata$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()