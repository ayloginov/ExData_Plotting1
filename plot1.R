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

## adjust margins and make the plot
par(mar = c(4,4,2,1))
hist(power_data$Global_active_power, breaks = 25, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
