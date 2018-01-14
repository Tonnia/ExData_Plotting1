# read in data date = 2007/02/01 and 2007/02/02
data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE,
                   na.strings = "?", header = TRUE, sep = ";")
data_use <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data_use$Date <- as.Date(data_use$Date, format="%d/%m/%Y")
# plot2
datetime <- paste(as.Date(data_use$Date), data_use$Time)
data_use$Datetime <- as.POSIXct(datetime)
png("plot2.png", width = 480, height = 480)
with(data_use, plot(Global_active_power~Datetime, type = "l", 
                    xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()