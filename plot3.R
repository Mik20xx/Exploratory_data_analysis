# Script of graphic - week 2
# Miguel Gutierrez
# Plot3.R
#
# unzip("exdata_data_household_power_consumption.zip")
#
# recovery data of unzip file
data1 = read.table("household_power_consumption.txt",comment.char = "", sep = ";")
names1 <- data1[1,]
nrow1 <- nrow(data1)
data2 <- data1[2:nrow1,]
names(data2) <- names1
#
# Select data  from the dates 2007-02-01 and 2007-02-02
data3 <- subset(data2,data2$Date=="1/2/2007"|data2$Date=="2/2/2007")
#
# Paste Date and Time in new column called "datetime"
data3$datetime <- as.POSIXct(paste(data3$Date,data3$Time), format = "%d/%m/%Y %H:%M:%S")
#
# Plot datetime vs Sub metering (1,2,3)
plot(data3$Sub_metering_1 ~ data3$datetime, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data3$Sub_metering_2 ~ data3$datetime, col = "red")
lines(data3$Sub_metering_3 ~ data3$datetime, col = "blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#
# Saving graph
dev.copy(png,"plot3.png", width = 480, height = 480)
dev.off()
#
