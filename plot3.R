library("data.table")
setwd("~/Documents/GitHub/datasciencecoursera/ExData_Plotting1/data")
# Read data from file
powerData <- data.table::fread(input = "household_power_consumption.txt",
                               na.strings="?")
# turn off scientific notation
powerData[, Global_active_power := lapply(.SD, as.numeric),
          .SDcols = c("Global_active_power")]
# convert dateTime to POSIXct date so that it can be filtered and graphed
powerData[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
# subset data table
powerData <- powerData[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
# create plot 3
png("plot3.png", width=480, height=480)
plot(powerData[, dateTime], powerData[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerData[, dateTime], powerData[, Sub_metering_2],col="red")
lines(powerData[, dateTime], powerData[, Sub_metering_3],col="blue")
legend("topright"
        , col=c("black","red","blue")
        , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
        ,lty=c(1,1), lwd=c(1,1))
# close device file
dev.off()