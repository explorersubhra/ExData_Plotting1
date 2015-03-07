setwd("C:/Users/Samsung/Downloads/eda")
data<-read.table("household_power_consumption.txt", header=T,sep=";" ,na="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
mydata<-subset(data,Date=="2007-02-01" | Date=="2007-02-02")
datetimecomb<-paste(as.Date(mydata$Date),mydata$Time)
mydata$Datetime <- as.POSIXlt(datetimecomb)
png(file="plot4.png")
par(mfrow=c(2,2))
with(mydata,plot(Datetime,Global_active_power,ylab="Global Active Power(kilowatts)",
                  xlab="", type="l"))
with(mydata,plot(Datetime,Voltage,ylab="Voltage",xlab="datetime", type="l"))
with(mydata, {
            plot(Datetime,Sub_metering_1, type="l",
                ylab="Energy sub metering", xlab="")
           lines(Datetime,Sub_metering_2,col='Red')
          lines(Datetime,Sub_metering_3,col='Blue')
        })
with(mydata,plot(Datetime,Global_reactive_power,ylab="Global reactive power",
                 xlab="datetime", type="l"))

dev.off()