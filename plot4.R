#Load libraries

library("dplyr")

#Load dataset
power_consumption <- read.csv("household_power_consumption.txt", sep = ";")

#Convert dates and times from character to date/posixlt time
power_consumption$Date_Time <- paste(power_consumption$Date, power_consumption$Time)
power_consumption$Date_Time <-strptime(power_consumption$Date_Time, "%d/%m/%Y %H:%M:%S")
power_consumption <- power_consumption %>% select(10, 3:9)

#Subset data
power_consumption <-power_consumption %>% filter(Date_Time >= "2007-02-01 00:00:00"
                                                 & Date_Time <= "2007-02-02 23:59:00")
#Plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2,2))

plot(power_consumption$Date_Time, power_consumption$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(power_consumption$Date_Time, power_consumption$Sub_metering_1, type = "l",
     xlab ="", ylab ="Energy sub metering")
lines(power_consumption$Date_Time, power_consumption$Sub_metering_2, col = "red")
lines(power_consumption$Date_Time, power_consumption$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black","red", "blue"))

plot(power_consumption$Date_Time, power_consumption$Voltage, xlab = "", ylab = "Voltage", type = "l")

plot(power_consumption$Date_Time, power_consumption$Global_reactive_power, xlab = "", ylab = "Global Reactive Power", type = "l")

dev.off()