consum <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
consum1 <- consum[consum$Date == "1/2/2007"|consum$Date == "2/2/2007", ]
png(filename = "plot4.png", width = 480, height = 480)
date_time <- strptime(paste(consum1$Date, consum1$Time), format='%d/%m/%Y %H:%M:%S')
consum1[[10]] <- date_time
colnames(consum1) [10] <- "Date_time"
Sys.setlocale(category = "LC_TIME", locale = "C")
par(mfrow = c(2, 2))
with(consum1, {
    plot(Date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    plot(Date_time, Voltage, type ="l", xlab = "datetime")
    plot(Date_time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
    legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    lines(Date_time, Sub_metering_2, col ="red")
    lines(Date_time, Sub_metering_3, col ="blue")
    plot(Date_time, Global_reactive_power, type ="l", xlab = "datetime")
})

dev.off()