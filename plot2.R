#
# plot2.R
#

# It is assumed that "plot0.R" was executed beforehand.
# Draws a line plot of Global_active_power as function of date & time.

# Select and format the relevant variables.
dats2 <-transform(dats, date_time = strptime(paste(as.character(Date), as.character(Time)),"%d/%m/%Y %H:%M:%S",tz="America/New_York"))
dats2 <- subset(dats2,select = c(date_time,Global_active_power))
dats2$Global_active_power <- as.numeric(as.character(dats2$Global_active_power))

# First, plot empty and then draw the line.
png("plot2.png", width=480,height = 480)                    # Turn on the output device.
Sys.setlocale("LC_TIME","English")                          # Weekdays in english.
with(dats2, plot(date_time,Global_active_power,type="n",
                xlab = "", 
                ylab = "Global Active Power (kilowatts)" ))
with(dats2,lines(date_time, Global_active_power,lwd=1))    

# Turn off the output device.
dev.off()