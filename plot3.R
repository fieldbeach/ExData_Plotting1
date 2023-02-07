library(data.table)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url, "my_data.zip")
unzip("my_data.zip")

data <- fread("household_power_consumption.txt", nrows = 2075259, sep = ";",  na.strings = "?")

data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

date_time <- paste(data$Date, data$Time)
x_axis <- as.POSIXct(date_time, format = "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png", width = 480, height = 480)

plot(x_axis, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(x_axis, data$Sub_metering_2, col = "red")
lines(x_axis, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

dev.off()