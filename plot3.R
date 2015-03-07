setwd("C:/Users/Samsung/Downloads/eda")
data<-read.table("household_power_consumption.txt", header=T,sep=";" ,na="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
mydata<-subset(data,Date=="2007-02-01" | Date=="2007-02-02")
datetimecomb<-paste(as.Date(mydata$Date),mydata$Time)
mydata$Datetime <- as.POSIXlt(datetimecomb)
png(file="plot3.png")
with(mydata, {
       plot(Datetime,Sub_metering_1, type="l",
            ylab="Energy sub metering", xlab="")
       lines(Datetime,Sub_metering_2,col='Red')
       lines(Datetime,Sub_metering_3,col='Blue')
   })
legend("topright", col=c("black", "red", "blue"), lty=1, 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()