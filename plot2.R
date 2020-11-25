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
png("plot2.png", width=480, height=480)
# create plot 2
plot(x = powerData[, dateTime]
     , y = powerData[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
# close device file
dev.off()
