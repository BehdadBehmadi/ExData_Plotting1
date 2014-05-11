consum <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
consum1 <- consum[consum$Date == "1/2/2007"|consum$Date == "2/2/2007", ]
date_time <- strptime(paste(consum1$Date, consum1$Time), format='%d/%m/%Y %H:%M:%S')
consum1[[10]] <- date_time
colnames(consum1) [10] <- "Date_time"
png("plot3.png", width = 480, height = 480)
Sys.setlocale(category = "LC_TIME", locale = "C")
plot(consum1$Date_time, consum1$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(consum1$Date_time, consum1$Sub_metering_2, col ="red")
lines(consum1$Date_time, consum1$Sub_metering_3, col ="blue")
legend("toprigh", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()