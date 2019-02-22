#1, Read dataset
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#2, Subset
hpc_sub <- subset(hpc, Date == "1/2/2007"|Date == "2/2/2007")

#3, Convert Date & Time to Date & Time classes in R
hpc_sub$Date <- as.Date(hpc_sub$Date, format = "%d/%m/%Y")
hpc_sub$DateTime <- as.POSIXct(paste(hpc_sub$Date, hpc_sub$Time))

#4, Figure
png(file = "plot2.png", width = 480, height = 480, units = "px")
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(hpc_sub$DateTime, hpc_sub$Global_active_power, xlab = "", ylab = "Global Active Power(kilowatts)", type = "l")
dev.off()