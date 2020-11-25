library("data.table")
setwd("~/Documents/GitHub/datasciencecoursera/ExData_Plotting1/data")
# read data from file
powerData <- data.table::fread(input = "household_power_consumption.txt",
                              na.strings="?")
# turn off scientific notation
powerData[, Global_active_power := lapply(.SD, as.numeric),
          .SDcols = c("Global_active_power")]
# change date column type to Date
powerData[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
# subset data table
powerData <- powerData[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
# create plot1
png("plot1.png", width=480, height=480)
hist(powerData[, Global_active_power], main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
# close device file
dev.off()