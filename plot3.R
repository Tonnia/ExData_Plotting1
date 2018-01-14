# read in data date = 2007/02/01 and 2007/02/02
data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE,
                   na.strings = "?", header = TRUE, sep = ";")
data_use <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data_use$Date <- as.Date(data_use$Date, format="%d/%m/%Y")

# plot 3
datetime <- paste(as.Date(data_use$Date), data_use$Time)
data_use$Datetime <- as.POSIXct(datetime)
png("plot3.png", width = 480, height = 480)
with(data_use, {
    plot(Sub_metering_1~Datetime, type = "l", 
         xlab = "", ylab = "Enery sub metering")
    lines(Sub_metering_2~Datetime, col = "red")
    lines(Sub_metering_3~Datetime, col = "blue")
})

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, lwd = 2)
dev.off()
