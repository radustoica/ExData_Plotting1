dataset = read.csv("household_power_consumption.txt", colClasses = "character", sep = ";");

dataset$Time = as.POSIXlt(paste(dataset$Date, dataset$Time), format = "%d/%m/%Y %H:%M:%S");

dataset$Date = as.Date(dataset$Date, format = "%d/%m/%Y");

bool = (as.Date("2007-02-01", format = "%Y-%m-%d") == dataset$Date) | (as.Date("2007-02-02", format = "%Y-%m-%d") == dataset$Date);
                                                                       
dataset = dataset[bool, ];
          
for(i in 3:9) {
  dataset[, i] = as.numeric(dataset[, i]);
};

png("plot4.png", width = 480, height = 480);

par(mar = c(4.1, 4.1, 2.1, 2.1), mfcol = c(2, 2));
with(dataset, { 
  
  plot(Time, Global_active_power, type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "" );
  
  plot(Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black" );
  lines(Time, Sub_metering_2, type = "l", col = "red" );
  lines(Time, Sub_metering_3, type = "l", col = "blue" );
  legend('topright', names(dataset)[7:9] , 
         lty=1, col=c('black', 'red', 'blue'), bty='n', cex=.75)
  
  plot(Time, Voltage, type = "l", xlab = "datetime");
  
  plot(Time, Global_reactive_power, type = "l", xlab = "datetime");
});


dev.off()
