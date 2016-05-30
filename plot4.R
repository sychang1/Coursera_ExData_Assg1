#
# plot4.R
#

# It is assumed that "plot0.R" was executed beforehand.
# Draws an array of line plots.

png("plot4.png", width=480,height = 480)                    # Turn on the output device.
par(mfrow=c(2,2))                                           # 2 by 2 frame.
Sys.setlocale("LC_TIME","English")                          # Weekdays in english.

dats1 <-transform(dats, date_time = strptime(paste(as.character(Date), as.character(Time)),"%d/%m/%Y %H:%M:%S",tz="America/New_York"))

#
# Top-Left plot.
#

dats2 <- subset(dats1,select = c(date_time,Global_active_power))
dats2$Global_active_power <- as.numeric(as.character(dats2$Global_active_power))

with(dats2, plot(date_time,Global_active_power,type="n",
                 xlab = "", 
                 ylab = "Global Active Power" ))
with(dats2,lines(date_time, Global_active_power,lwd=1))   

#
# Top-Right plot.
#

dats2 <- subset(dats1,select = c(date_time,Voltage))
dats2$Voltage <- as.numeric(as.character(dats2$Voltage))

with(dats2, plot(date_time,Voltage,type="n",
                 xlab = "datetime", 
                 ylab = "Voltage" ))
with(dats2,lines(date_time, Voltage,lwd=1))  

#
# Bottom-Left Plot.
#

dats2 <- subset(dats1, select = c(date_time,Sub_metering_1,Sub_metering_2,Sub_metering_3))
dats2$Sub_metering_1 <- as.numeric(as.character(dats2$Sub_metering_1))
dats2$Sub_metering_2 <- as.numeric(as.character(dats2$Sub_metering_2))
dats2$Sub_metering_3 <- as.numeric(as.character(dats2$Sub_metering_3))
                                        
with(dats2, plot(date_time,Sub_metering_1, type="n",
                 xlab = "", 
                 ylab = "Energy sub metering" ))
with(dats2,lines(date_time, Sub_metering_1,lwd=1,col="black"))  
with(dats2,lines(date_time, Sub_metering_2,lwd=1,col="red"))  
with(dats2,lines(date_time, Sub_metering_3,lwd=1,col="blue")) 
legend("topright", lty=c(1,1,1), lwd=c(1,1,1), col=c("black","red","blue"), legend = names(dats2)[2:4],bty="n")

#
# Bottom-Right plot.
#

dats2 <- subset(dats1,select = c(date_time,Global_reactive_power))
dats2$Global_reactive_power <- as.numeric(as.character(dats2$Global_reactive_power))

with(dats2, plot(date_time,Global_reactive_power,type="n",
                 xlab = "datetime", 
                 ylab = "Global_reactive_power" ))
with(dats2,lines(date_time, Global_reactive_power,lwd=1))  

# Turn off the output device.
dev.off()