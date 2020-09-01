
#FirstPlot


dat <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",sep =";",header = TRUE,na.strings = "?")
dat[,1] <- as.Date(dat$Date,"%d/%m/%Y")
ree <- subset(dat,Date=="2007-02-01"|Date=="2007-02-02")

hist(ree$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)", main ="Global Active Power" )
png(filename = "plot1.png", width=480, height=480)
hist(ree$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)", main ="Global Active Power" )
dev.off()