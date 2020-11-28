Sys.setlocale(category = "LC_ALL", locale = "english")
hpc <- read.table("household_power_consumption.txt", 
                  sep = ";",
                  header = TRUE)
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hpc$datetime <- strptime(paste(hpc$Date, as.character(hpc$Time))
                         , format="%Y-%m-%d %H:%M:%S",
                         tz = "Europe/London")
plot(hpc$datetime, hpc$Global_active_power, main="",
     ylab='Global Active Power (kilowatts)',
     xlab="", type='l',)
dev.copy(png, file = "plot2.png")
dev.off()
