hpc <- read.table("household_power_consumption.txt", 
                sep = ";",
                header = TRUE)
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))
hist(hpc$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
