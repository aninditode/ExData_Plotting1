power_consumption <- read.table("C:\\Dev Tools\\Work\\Coursera\\04_ExploratoryAnalysis\\household_power_consumption.txt", 
                                skip = 66637, nrows = 2880, header = FALSE, sep = ";", dec = ".", 
                                col.names	= c("Date","Time","Global_active_power","Global_reactive_power",
                                              "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                                              "Sub_metering_3"), na.strings = "?"
)


power_consumption$Date <- as.Date( strptime(power_consumption$Date,"%d/%m/%Y"))

png("C:\\Dev Tools\\Work\\Coursera\\04_ExploratoryAnalysis\\plot1.png", width = 480, 
    height = 480, units = "px", bg = "white")

hist(power_consumption$Global_active_power, col = "Red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()
