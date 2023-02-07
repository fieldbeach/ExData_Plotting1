library(data.table)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url, "my_data.zip")
unzip("my_data.zip")

data <- fread("household_power_consumption.txt", nrows = 2075259, sep = ";",  na.strings = "?")
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]
  
png(file="plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()
