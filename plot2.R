# Script of graphic - week 2
# Miguel Gutierrez
# Plot2.R
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
# Plot datetime vs Global Active Power
plot(data3$datetime,data3$Global_active_power, type = "l", main = "Global Active Power", 
     ylab = "Global Active Power (kilowatts)")
#
# Saving graph
dev.copy(png,"plot2.png", width = 480, height = 480)
dev.off()
#