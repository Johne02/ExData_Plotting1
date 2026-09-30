## Loading Packages
library(dplyr)
library(lubridate)

#Reading Data
epc <- read.csv("household_power_consumption.txt", header= TRUE, sep=";", na.strings="?")
epc2s <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")
epc2sd <- mutate(epc2s, 
                 Datetime = dmy_hms(paste(Date, Time)),
                 Global_active_power = as.numeric(Global_active_power))


##Creating plot 2
png("plot2.png", width=480, height=480)

with(epc2sd, plot(Datetime, Global_active_power, 
                  type = "l", 
                  xlab = "", 
                  ylab = "Global Active Power (kilowatts)",
                  xaxt = "n"))
tick_spots <- c(epc2sd$Datetime[1], median(epc2sd$Datetime), tail(epc2sd$Datetime, 1))
axis(1, at = tick_spots, labels = c("Thu", "Fri", "Sat"))

dev.off()