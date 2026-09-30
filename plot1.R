## Loading Packages
library(dplyr)
library(lubridate)

#Reading Data
epc <- read.csv("household_power_consumption.txt", header= TRUE, sep=";", na.strings="?")
epc2s <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")
epc2sd <- mutate(epc2s, Date = dmy(Date), Time = hms(Time), Global_active_power = as.numeric(Global_active_power))

##Creating plot 1
png("plot1.png", width=480, height=480)

hist(epc2sd$Global_active_power, xlab="Global Active Power (kilowatts)", main = "Global Active Power", col="red")

dev.off()