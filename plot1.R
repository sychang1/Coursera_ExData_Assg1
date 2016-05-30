#
# plot1.R
#

# It is assumed that "plot0.R" was executed beforehand.
# Draws a histogram of Global_active_power.

# Select and format the relevant variables.
dats2 <-transform(dats, date_time = strptime(paste(as.character(Date), as.character(Time)),"%d/%m/%Y %H:%M:%S",tz="America/New_York"))
dats2 <- subset(dats2,select = c(date_time,Global_active_power))
dats2$Global_active_power <- as.numeric(as.character(dats2$Global_active_power))

# Plot the histogram w/o axes.
png("plot1.png", width=480,height = 480)                    # Turn on the output device.
hist(dats2$Global_active_power, 
     col="red", 
     breaks = 12,
     xlim = c(0,10),
     ylim = c(0,1200),
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main = "Global Active Power",axes = FALSE)

# Axes ticks.
axis(side = 1, at = seq(0,6,by=2))
axis(side = 2, at = seq(0,1200,by=200))

# Turn off the output device.
dev.off()