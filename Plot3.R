##Plot3.R
##To create plot for Submeters

##Read the data
setwd("~/Technology/Coursera/R/4th Module - Exploratory Graphics/Week 1 Project")
electricity <- read.table("Household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, stringsAsFactors=TRUE)


electricity_subset <- subset(electricity, electricity$Date=="1/2/2007"|electricity$Date=="2/2/2007")
electricity_subset$DateTime <- paste(electricity_subset$Date, electricity_subset$Time)

##Use Strptime so that the time doesnt get missed(minutes)

electricity_subset$DateTime <- strptime(electricity_subset$DateTime, format="%d/%m/%Y %H:%M:%S" )
##Now create the plots for this subsetted data

##3 variables added one by one
plot(electricity_subset$DateTime, electricity_subset$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
lines(electricity_subset$DateTime, electricity_subset$Sub_metering_2, type="l", col="red")
lines(electricity_subset$DateTime, electricity_subset$Sub_metering_3, type="l", col="blue")

## add legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))


dev.copy(png, 'Plot3.png')

##Must turn the device off!
dev.off()