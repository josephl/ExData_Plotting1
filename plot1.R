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


png(file = "plot1.png", width = 480, height = 480)
with(household,
     hist(Global_active_power, xlab = "Global Active Power (kilowatts)",
          ylab = "Frequency", main = "Global Active Power", col = "red"))
#dev.copy(png, "plot1.png")
dev.off()
