power_consumption <- read.table("C:\\Dev Tools\\Work\\Coursera\\04_ExploratoryAnalysis\\household_power_consumption.txt", 
                                skip = 66637, nrows = 2880, header = FALSE, sep = ";", dec = ".", 
                                col.names	= c("Date","Time","Global_active_power","Global_reactive_power",
                                              "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                                              "Sub_metering_3"), na.strings = "?"
)

power_consumption$DateTime <- strptime(paste(power_consumption$Date, power_consumption$Time), "%d/%m/%Y %H:%M:%S")

png("C:\\Dev Tools\\Work\\Coursera\\04_ExploratoryAnalysis\\plot4.png", width = 480, 
    height = 480, units = "px", bg = "white")

par(mfrow = c(2, 2))

plot (power_consumption$DateTime, power_consumption$Global_active_power, type = "l",xlab = "", 
      ylab = "Global Active Power (kilowatts)")

plot (power_consumption$DateTime, power_consumption$Voltage, type = "l",xlab = "datetime", 
      ylab = "Voltage")

plot (power_consumption$DateTime, power_consumption$Sub_metering_1, type = "l",xlab = "", 
      ylab = "Energy sub metering")

lines(power_consumption$DateTime, power_consumption$Sub_metering_2, col = "red")

lines(power_consumption$DateTime, power_consumption$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),
       lwd=1, bty = "n")

plot (power_consumption$DateTime, power_consumption$Global_reactive_power, type = "l",xlab = "datetime",
      ylab ="Global_reactive_power")

dev.off()

