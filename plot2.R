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

#Creating Plot 2.

png(file="plot2.png",height=480,width = 480)
plot(x=new_data$Time, y=new_data$Global_active_power,type="l",xlab="", ylab = "Global Active Power (kilowatts)")

dev.off()
