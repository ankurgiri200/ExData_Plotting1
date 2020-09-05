dat <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",sep =";",header = TRUE)
ree <- subset(dat,dat$Date=="1/2/2007" | dat$Date =="2/2/2007")


ree$Date <- as.Date(ree$Date, format="%d/%m/%Y")
ree$Time <- strptime(ree$Time, format="%H:%M:%S")

ree[1:1440,"Time"] <- format(ree[1:1440,"Time"],"2007-02-01 %H:%M:%S")
ree[1441:2880,"Time"] <- format(ree[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
par(mfrow=c(2,2))

plot(ree$Time,ree$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(ree$Time, ree$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(ree$Time,ree$Sub_metering_1,type = "n",xlab = "",ylab = "Engergy sub metering")
lines(ree$Time,ree$Sub_metering_1)
lines(ree$Time,ree$Sub_metering_2,col="red")
lines(ree$Time,ree$Sub_metering_3,col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(ree$Time, ree$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

png("plot4.png",height = 480,width = 480)
par(mfrow=c(2,2))

plot(ree$Time,ree$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(ree$Time, ree$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(ree$Time,ree$Sub_metering_1,type = "n",xlab = "",ylab = "Engergy sub metering")
lines(ree$Time,ree$Sub_metering_1)
lines(ree$Time,ree$Sub_metering_2,col="red")
lines(ree$Time,ree$Sub_metering_3,col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(ree$Time, ree$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()