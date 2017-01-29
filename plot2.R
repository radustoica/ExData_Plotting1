dataset = read.csv("household_power_consumption.txt", colClasses = "character", sep = ";");

dataset$Time = as.POSIXlt(paste(dataset$Date, dataset$Time), format = "%d/%m/%Y %H:%M:%S");

dataset$Date = as.Date(dataset$Date, format = "%d/%m/%Y");

bool = (as.Date("2007-02-01", format = "%Y-%m-%d") == dataset$Date) | (as.Date("2007-02-02", format = "%Y-%m-%d") == dataset$Date);

dataset = dataset[bool, ];

for(i in 3:9) {
  dataset[, i] = as.numeric(dataset[, i]);
};

png("plot2.png", width = 480, height = 480);

par(mar = c(2.1, 4.1, 2.1, 2.1))
with(dataset, {
  plot(Time, Global_active_power, type = 'l', ylab = "Global Active Power (kilowatts)" )
});

dev.off()

