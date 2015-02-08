 file <- c("household_power_consumption.txt")
 data_subset <- read.csv.sql(file, header = T, sep=";", 
                             sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
 data_subset[data_subset == 0] <- NA
 data_subset$Datetime <- strptime(paste(data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")
 
 plot(data_subset$Datetime, data_subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
 points(data_subset$Datetime, data_subset$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
        col = "red")
 points(data_subset$Datetime, data_subset$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
        col = "blue")
 legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                         "Sub_metering_2", "Sub_metering_3")) 
 dev.copy(png,'plot3.png',width = 480, height = 480, units = "px")
 dev.off()

     