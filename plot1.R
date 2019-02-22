#1, Read dataset
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#2, Subset
hpc_sub <- subset(hpc, Date == "1/2/2007"|Date == "2/2/2007")

#3, Transform factor to numeric
hpc_sub$Global_active_power <- as.numeric(as.character(hpc_sub$Global_active_power))

#4, Histogram
png(file = "plot1.png", width = 480, height = 480, units = "px")
with(hpc_sub, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))
title(main = "Global Active Power")
dev.off()