# Plot4.R :Script to generate multiple  plots related to Global power consumption 
#Setting parameteres
par(mfrow =c(2,2), mar= c(4,4,1,1))

#Plot 1
with( XPower, plot(Date_Time, Global_active_power, type ="l", 
                   lty="solid", xlab= " ", ylab ="Global Active power"))


#votage
with( XPower, plot(Date_Time, Voltage , type="l", 
                   lty="solid", xlab= "datetime ", ylab ="Voltage"))

# Sub metering 
with( XPower, plot(Date_Time, Sub_metering_1, type ="n",
                   xlab= " ", ylab ="Energy Sub Metering"))

with (XPower , lines(Date_Time, Sub_metering_1, col="black"))
with (XPower , lines(Date_Time, Sub_metering_2, col="red"))
with (XPower , lines(Date_Time, Sub_metering_3, col="blue"))


legend("topright", pch = 22, col = c("black", "red", "blue"), cex= .5 ,
       legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))


#Global ReaActive power
with( XPower, plot(Date_Time, Global_reactive_power , type="l",  
                   lty="solid", xlab= "datetime ", ylab ="Global Reactive Power"))
  
