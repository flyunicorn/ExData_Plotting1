 file <- c("household_power_consumption.txt")
 data_subset <- read.csv.sql(file, header = T, sep=";", 
                             sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
 data_subset[data_subset == 0] <- NA
 data_subset$Datetime <- strptime(paste(data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")
 
 par(mfrow = c(2, 2))
 
 # plot 1 (NW)
 plot(data_subset$Datetime, data_subset$Global_active_power, type = "l", ylab = "Global Active Power", 
      xlab = "")
 
 # plot 2 (NE)
 plot(data_subset$Datetime, data_subset$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
 
 # plot 3 (SW)
 plot(data_subset$Datetime, data_subset$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
      xlab = "", col = "black")
 points(data_subset$Datetime, data_subset$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", 
        col = "red")
 points(data_subset$Datetime, data_subset$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", 
        col = "blue")
 legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                         "Sub_metering_2", "Sub_metering_3"), bty = "n", )
 
 # plot 4 (SE)
 plot(data_subset$Datetime, data_subset$Global_reactive_power, type = "l", xlab = "datetime", 
      ylab = "Global_reactive_power", ylim = c(0, 0.5))
 
 dev.copy(png,'plot4.png',width = 480, height = 480, units = "px")
 dev.off()

     