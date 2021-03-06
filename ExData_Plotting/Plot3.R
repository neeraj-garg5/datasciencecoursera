windows.options(width=480, height=480)
x <- read.table("household_power_consumption.txt", sep=";", skip=1, na.strings="?")
colnames(x) <- c( "Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
x <- subset(x, Date == "1/2/2007" | Date == "2/2/2007")
dt <- strptime(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S")
png(filename="plot3.png")
plot(x=dt, y=x[,"Sub_metering_1"], type="l",ylab="Energy sub metering", main="", xlab="")
lines(x=dt, y=x[,"Sub_metering_2"], col="red")
lines(x=dt, y=x[,"Sub_metering_3"], col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()