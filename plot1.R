# Plot1.R -  Script to genereate Global Active power chart

setwd( "./Coursera/data")

XPower <- read.table("household_power_consumption.txt", header = TRUE, sep =";", 
                     quote="",  na.string="?")

library(dplyr)

XPower <- mutate(XPower, FDate= as.Date(Date, format="%d/%m/%Y"))

XPower <-  filter(XPower, (FDate =="2007-02-01" | FDate =="2007-02-02") )


Date_Time <- strptime(paste(XPower$FDate, XPower$Time), "%Y-%m-%d %H:%M:%S")
XPower <- cbind(XPower, Date_Time)

windows()
#plot1 

png(file= "plot1.png")
hist(XPower$Global_active_power, col= "red", xlab= "Global Active Power(kilowatts)", main="Global active power")

dev.copy(png, file= "plot1.png")
dev.off()
