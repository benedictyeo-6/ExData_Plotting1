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

#Plot 1
power_consumption$Global_active_power <- as.numeric(power_consumption$Global_active_power)
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(power_consumption$Global_active_power,
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power",
     col ="red")
dev.off()