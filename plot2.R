## setup
library(sqldf)

## Download & unzip data. Use if the source file is not in the working directory
## path <- getwd()
## url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## srcfile <- "household_power_consumption.zip"
## download.file(url, file.path(path, srcfile))
## unzip(srcfile)

## read file
part1 <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where [Date] = '1/2/2007' ", sep = ";")
part2 <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where [Date] = '2/2/2007' ", sep = ";")
power_data <- rbind(part1, part2)
## add date&time column and convert to date&time format
power_data$date_time = paste(power_data$Date, power_data$Time)
power_data$date_time <- strptime(power_data$date_time, "%d/%m/%Y %H:%M:%S")

## set margins and make plot
par(mar = c(2,4,1,1))
plot(power_data$date_time, power_data$Global_active_power, type = "l",  xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
