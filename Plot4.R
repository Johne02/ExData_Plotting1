##Loading Packages
library(dplyr)
library(lubridate)

#Reading Data
epc <- read.csv("household_power_consumption.txt", header= TRUE, sep=";", na.strings="?")
epc2s <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")
epc2sd <- mutate(epc2s, 
                 Datetime = dmy_hms(paste(Date, Time)),
                 Global_active_power = as.numeric(Global_active_power))

##Creating Plot 4

png("plot4.png", width=480, height=480)

par(mfcol=c(2,2))

with(epc2sd, plot(Datetime, Global_active_power, 
                  type = "l", 
                  xlab = "", 
                  ylab = "Global Active Power (kilowatts)",
                  xaxt = "n"))
tick_spots <- c(epc2sd$Datetime[1], median(epc2sd$Datetime), tail(epc2sd$Datetime, 1))
axis(1, at = tick_spots, labels = c("Thu", "Fri", "Sat"))

with(epc2sd, plot(Datetime, Sub_metering_1, ylab="Energy sub metering", xlab="", xaxt="n", type="n"))
with(epc2sd, points(Datetime, Sub_metering_1, col="black", type="l"))
with(epc2sd, points(Datetime, Sub_metering_2, col="red", type="l"))
with(epc2sd, points(Datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1,  col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty="n")

tick_spots <- c(epc2sd$Datetime[1], median(epc2sd$Datetime), tail(epc2sd$Datetime, 1))
axis(1, at = tick_spots, labels = c("Thu", "Fri", "Sat"))

with(epc2sd, plot(Datetime, Voltage, xlab = "datetime", ylab="Voltage", type="l", xaxt="n"))
tick_spots <- c(epc2sd$Datetime[1], median(epc2sd$Datetime), tail(epc2sd$Datetime, 1))
axis(1, at = tick_spots, labels = c("Thu", "Fri", "Sat"))

with(epc2sd, plot(Datetime, Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type="l", xaxt="n"))
tick_spots <- c(epc2sd$Datetime[1], median(epc2sd$Datetime), tail(epc2sd$Datetime, 1))
axis(1, at = tick_spots, labels = c("Thu", "Fri", "Sat"))

dev.off()

