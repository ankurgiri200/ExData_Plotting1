dat <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",sep =";",header = TRUE)
ree <- subset(dat,dat$Date=="1/2/2007" | dat$Date =="2/2/2007")


ree$Date <- as.Date(ree$Date, format="%d/%m/%Y")
ree$Time <- strptime(ree$Time, format="%H:%M:%S")

ree[1:1440,"Time"] <- format(ree[1:1440,"Time"],"2007-02-01 %H:%M:%S")
ree[1441:2880,"Time"] <- format(ree[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


plot(ree$Time,ree$Sub_metering_1,type = "n",xlab = "",ylab = "Engergy sub metering")
lines(ree$Time,ree$Sub_metering_1)
lines(ree$Time,ree$Sub_metering_2,col="red")
lines(ree$Time,ree$Sub_metering_3,col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

png("plot3.png",width = 480,height =480)
plot(ree$Time,ree$Sub_metering_1,type = "n",xlab = "",ylab = "Engergy sub metering")
lines(ree$Time,ree$Sub_metering_1)
lines(ree$Time,ree$Sub_metering_2,col="red")
lines(ree$Time,ree$Sub_metering_3,col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()




