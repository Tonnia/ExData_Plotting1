# read in data date = 2007/02/01 and 2007/02/02
data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE,
                   na.strings = "?", header = TRUE, sep = ";")
data_use <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data_use$Date <- as.Date(data_use$Date, format="%d/%m/%Y")

# plot 1
png("plot1.png", width = 480, height = 480)
hist(data_use$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()