# Script to generate Global Active Power - Plot 2 

setwd( "./Coursera/data")

XPower <- read.table("household_power_consumption.txt", header = TRUE, sep =";", 
                     quote="",  na.string="?")

library(dplyr)

XPower <- mutate(XPower, FDate= as.Date(Date, format="%d/%m/%Y"))

XPower <-  filter(XPower, (FDate =="2007-02-01" | FDate =="2007-02-02") )


Date_Time <- strptime(paste(XPower$FDate, XPower$Time), "%Y-%m-%d %H:%M:%S")
Gpower <- cbind(Gpower, Date_Time)

windows()
#plot1 

png(file= "plot2.png")


#plot2
windows()
with( XPower, plot(Date_Time, Global_active_power, type ="l", 
                   lty="solid", xlab= " ", ylab ="Global Active power(kilowatts)"))

dev.copy(png, file= "plot2.png")
dev.off()


