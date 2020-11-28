Sys.setlocale(category = "LC_ALL", locale = "english")
hpc <- read.table("household_power_consumption.txt", 
                  sep = ";",
                  header = TRUE)
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3 <- as.numeric(as.character(hpc$Sub_metering_3))
hpc$Voltage <- as.numeric(as.character(hpc$Voltage))
hpc$Global_reactive_power <- as.numeric(as.character(hpc$Global_reactive_power))
hpc$datetime <- strptime(paste(hpc$Date, as.character(hpc$Time))
                         , format="%Y-%m-%d %H:%M:%S",
                         tz = "Europe/London")
windows(width=10, height=8)
par(mfrow = c(2, 2), bg = "white")

plot(hpc$datetime, hpc$Global_active_power, main="",
     ylab='Global Active Power',
     xlab="", type='l',)

plot(hpc$datetime, hpc$Voltage, main="",
     ylab='Voltage',
     xlab="datetime", type='l',)

plot(hpc$datetime, hpc$Sub_metering_1, type = "n", 
     ylab = "Energy Sub Metering", xlab = "")
lines(hpc$datetime, hpc$Sub_metering_1, type='l')
lines(hpc$datetime, hpc$Sub_metering_2, type='l', col = "red")
lines(hpc$datetime, hpc$Sub_metering_3, type='l', col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd=1, cex = 0.75)

plot(hpc$datetime, hpc$Global_reactive_power, main="",
     ylab='Voltage',
     xlab="datetime", type='l',)


dev.copy(png, file = "plot4.png")
dev.off()
