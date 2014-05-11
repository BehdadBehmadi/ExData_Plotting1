consum <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
consum1 <- consum[consum$Date == "1/2/2007"|consum$Date == "2/2/2007", ]
png("plot1.png", width = 480, height = 480)
hist(consum1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()