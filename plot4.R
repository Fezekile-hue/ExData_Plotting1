#Download equired  R packages
library(data.table)
library(ggplot2)
library(dplyr)

#Read Data and subsetting
full_data <- read.table("household_power_consumption.txt",sep=";",header = TRUE,na.strings = c("?",""))
new_data<- filter(full_data, Date == "1/2/2007" | Date == "2/2/2007")

#Formatting DATE AND TIME to required
new_data$Date<-as.Date(new_data$Date,format = "%d/%m/%Y")
new_data$Time<-strptime(paste(new_data$Date,new_data$Time),format = "%Y-%m-%d %H:%M:%S")

#Creating Plot 4.

png(file="plot4.png",height=480,width = 480)
par(mfrow=c(2,2))

plot(x=new_data$Time, y=new_data$Global_active_power,type="l",xlab="", ylab = "Global Active Power (kilowatts)")

plot(x=new_data$Time, y=new_data$Sub_metering_1,type="l",xlab="", ylab = "Energy sub metering")
lines(x = new_data$Time, y = new_data$Sub_metering_2, type = "l", col = "red")
lines(x = new_data$Time, y = new_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot(x=new_data$Time, y=new_data$Voltage,type="l",xlab="datetime", ylab = "Voltage")

plot(x=new_data$Time, y=new_data$Global_reactive_power,type="l",xlab="datetime", ylab = "Global_reactive_power")


dev.off()
