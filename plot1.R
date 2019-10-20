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

#Creating Plot 1.

png(file="plot1.png",height=480,width = 480)
hist(new_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
