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

#Plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(power_consumption$Date_Time, power_consumption$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()s