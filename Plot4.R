##Plot4.R
##To create 4 plots  

##Read the data
setwd("~/Technology/Coursera/R/4th Module - Exploratory Graphics/Week 1 Project")
electricity <- read.table("Household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, stringsAsFactors=TRUE)


electricity_subset <- subset(electricity, electricity$Date=="1/2/2007"|electricity$Date=="2/2/2007")
electricity_subset$DateTime <- paste(electricity_subset$Date, electricity_subset$Time)

##Use Strptime so that the time doesnt get missed(minutes)

electricity_subset$DateTime <- strptime(electricity_subset$DateTime, format="%d/%m/%Y %H:%M:%S" )
##Now create the plots for this subsetted data

##set the plotting area for 2 plots in a row
par(mfrow=c(2,2))

## First plot is Global Active Power vs Date Time
plot(electricity_subset$DateTime, electricity_subset$Global_active_power, type="l", ylab="Global Active Power(kilowatts)", xlab="")

## Second plot is Voltage vs DateTime
plot(electricity_subset$DateTime, electricity_subset$Voltage, type="l", xlab="datetime", ylab="Voltage")

##Third plot is 3 Sub Meters plotted into 1, along with a legend.

plot(electricity_subset$DateTime, electricity_subset$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
lines(electricity_subset$DateTime, electricity_subset$Sub_metering_2, type="l", col="red")
lines(electricity_subset$DateTime, electricity_subset$Sub_metering_3, type="l", col="blue")

legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))

## Fourth plot is Global Reactive Power vs Date Time

plot(electricity_subset$DateTime, electricity_subset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

##Copy the plot
dev.copy(png, 'Plot4.png')

##Must turn the device off!
dev.off()