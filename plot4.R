#1, Read dataset
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#2, Subset
hpc_sub <- subset(hpc, Date == "1/2/2007"|Date == "2/2/2007")

#3, Convert Date & Time to Date & Time classes in R
hpc_sub$Date <- as.Date(hpc_sub$Date, format = "%d/%m/%Y")
hpc_sub$DateTime <- as.POSIXct(paste(hpc_sub$Date, hpc_sub$Time))

#4, Plot
png(file = "plot4.png", width = 480, height = 480, units = "px")
Sys.setlocale(category = "LC_ALL", locale = "english")
par(mfrow = c(2,2))
plot(hpc_sub$DateTime, hpc_sub$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(hpc_sub$DateTime, hpc_sub$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(hpc_sub$DateTime, hpc_sub$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(hpc_sub$DateTime, hpc_sub$Sub_metering_2, col = "red")
lines(hpc_sub$DateTime, hpc_sub$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(hpc_sub$DateTime, hpc_sub$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()