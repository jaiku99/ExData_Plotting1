# Plot3.R  - Script to generate Sub Metering Plots

setwd( "./Coursera/data")

XPower <- read.table("household_power_consumption.txt", header = TRUE, sep =";", 
                     quote="",  na.string="?")

library(dplyr)

XPower <- mutate(XPower, FDate= as.Date(Date, format="%d/%m/%Y"))

XPower <-  filter(XPower, (FDate =="2007-02-01" | FDate =="2007-02-02") )


Date_Time <- strptime(paste(XPower$FDate, XPower$Time), "%Y-%m-%d %H:%M:%S")
Gpower <- cbind(Gpower, Date_Time)


png(file= "plot3.png")



#plot3
with( XPower, plot(Date_Time, Sub_metering_1, type ="n",
                   xlab= " ", ylab ="Energy Sub Metering"))

with (XPower , lines(Date_Time, Sub_metering_1, col="black"))
with (XPower , lines(Date_Time, Sub_metering_2, col="red"))
with (XPower , lines(Date_Time, Sub_metering_3, col="blue"))

legend("topright", pch = 22, col = c("black", "red", "blue"), 
       legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

dev.copy(png, file= "plot3.png")
dev.off()

