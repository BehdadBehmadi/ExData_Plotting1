consum <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
consum1 <- consum[consum$Date == "1/2/2007"|consum$Date == "2/2/2007", ]
png("plot2.png", width = 480, height = 480)
date_time <- strptime(paste(consum1$Date, consum1$Time), format='%d/%m/%Y %H:%M:%S')
consum1[[10]] <- date_time
colnames(consum1) [10] <- "Date_time"
Sys.setlocale(category = "LC_TIME", locale = "C")
plot(consum1$Date_time, consum1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

