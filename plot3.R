#
# plot3.R
#

# It is assumed that "plot0.R" was executed beforehand.
# Draws a line plot of Energy sub metering as function of date & time.

# Select and format the relevant variables.
dats2 <-transform(dats, date_time = strptime(paste(as.character(Date), as.character(Time)),"%d/%m/%Y %H:%M:%S",tz="America/New_York"))
dats2 <- subset(dats2,select = c(date_time,Sub_metering_1,Sub_metering_2,Sub_metering_3))
dats2$Sub_metering_1 <- as.numeric(as.character(dats2$Sub_metering_1))
dats2$Sub_metering_2 <- as.numeric(as.character(dats2$Sub_metering_2))
dats2$Sub_metering_3 <- as.numeric(as.character(dats2$Sub_metering_3))

# First, plot empty and then draw the lines.
png("plot3.png", width=480,height = 480)                    # Turn on the output device.
Sys.setlocale("LC_TIME","English")                          # Weekdays in english.
with(dats2, plot(date_time,Sub_metering_1, type="n",
                 xlab = "", 
                 ylab = "Energy sub metering" ))
with(dats2,lines(date_time, Sub_metering_1,lwd=1,col="black"))  
with(dats2,lines(date_time, Sub_metering_2,lwd=1,col="red"))  
with(dats2,lines(date_time, Sub_metering_3,lwd=1,col="blue")) 
legend("topright", lty=c(1,1,1), lwd=c(1,1,1), col=c("black","red","blue"), legend = names(dats2)[2:4])

# Turn off the output device.
dev.off()