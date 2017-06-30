##Plot1.R
##To create plot for Global Active Power

##Read the data
setwd("~/Technology/Coursera/R/4th Module - Exploratory Graphics/Week 1 Project")
electricity <- read.table("Household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, stringsAsFactors=TRUE)

##Use as.Date to read the data for fixed dates
electricity$DateTime <- paste(electricity$Date, electricity$Time)
electricity$DateTime <- as.Date(electricity$DateTime, format="%d/%m/%Y %H:%M:%S")

library(dplyr)

new_electricity <- filter(electricity, DateTime>=as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))

##Now create the plots for this subsetted data

hist(new_electricity$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png, 'Plot1.png')

##Must turn the device off!
dev.off()