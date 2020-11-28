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
hpc$datetime <- strptime(paste(hpc$Date, as.character(hpc$Time))
                         , format="%Y-%m-%d %H:%M:%S",
                         tz = "Europe/London")

plot(hpc$datetime, hpc$Sub_metering_1, type = "n", 
     ylab = "Energy Sub Metering", xlab = "")

lines(hpc$datetime, hpc$Sub_metering_1, type='l')
lines(hpc$datetime, hpc$Sub_metering_2, type='l', col = "red")
lines(hpc$datetime, hpc$Sub_metering_3, type='l', col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd=1, cex = 0.8)

dev.copy(png, file = "plot3.png")
dev.off()
