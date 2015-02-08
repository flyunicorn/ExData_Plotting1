 file <- c("household_power_consumption.txt")
 data_subset <- read.csv.sql(file, header = T, sep=";", 
                             sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
 data_subset[data_subset == 0] <- NA
 data_subset$Datetime <- strptime(paste(data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")
 
 hist(data_subset$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
      xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0, 
    1200), xlim = c(0, 6), xaxp = c(0, 6, 3))
 dev.copy(png,'plot1.png',width = 480, height = 480, units = "px")
 dev.off()

     