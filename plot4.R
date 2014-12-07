# Joseph Lee
# Assignment 1


# Read in data
household <- read.table("household_power_consumption.txt", header = TRUE,
                        sep = ";", na.strings = "?")
# Trim data to 2/1/07 - 2/2/07
household <- household[household$Date %in% c("1/2/2007", "2/2/2007"),]

# Merge Date & Time columns to single Time
household$Time <- strptime(paste(household$Time, household$Date),
                           format = "%H:%M:%S %d/%m/%Y")
household$Date <- NULL


png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(household$Time, household$Global_active_power, xlab = "",
     ylab = "Global Active Power", type = "l")
plot(household$Time, household$Voltage, xlab = "datetime",
     ylab = "Voltage", type = "l")
plot(household$Time, household$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering", type = "l")
lines(household$Time, household$Sub_metering_2, col = "red")
lines(household$Time, household$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "blue", "red"), pch = "-", bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(household$Time, household$Global_reactive_power, xlab = "datetime",
     ylab = "Global_reactive_power", type = "l")
dev.off()
