 file <- c("household_power_consumption.txt")
 data_subset <- read.csv.sql(file, header = T, sep=";", 
                             sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
 data_subset[data_subset == 0] <- NA
 data_subset$Datetime <- strptime(paste(data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")
 
 plot(data_subset$Datetime, data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
 
 dev.copy(png,'plot2.png',width = 480, height = 480, units = "px")
 dev.off()

     