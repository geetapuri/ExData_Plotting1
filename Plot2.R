##Plot2.R
##To create plot for Global Active Power Vs DateTime

##Read the data
setwd("~/Technology/Coursera/R/4th Module - Exploratory Graphics/Week 1 Project")
electricity <- read.table("Household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, stringsAsFactors=TRUE)


electricity_subset <- subset(electricity, electricity$Date=="1/2/2007"|electricity$Date=="2/2/2007")
electricity_subset$DateTime <- paste(electricity_subset$Date, electricity_subset$Time)

##Use Strptime so that the time doesnt get missed(minutes)

electricity_subset$DateTime <- strptime(electricity_subset$DateTime, format="%d/%m/%Y %H:%M:%S" )
##Now create the plots for this subsetted data

plot(electricity_subset$DateTime, electricity_subset$Global_active_power, type="l", ylab="Global Active Power(kilowatts)", xlab="")
dev.copy(png, 'Plot2.png')

##Must turn the device off!
dev.off()