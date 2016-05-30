#
# plot0.R
#

# Run this script just once.
# Reads in the raw data and formats the "Date" and "Time" into a single variable "date_time".
# Takes in only the subset of data correspoinding to Feb-1st-2007 and Feb-2nd-2007.

dat <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
dats <- subset(dat, Date ==  "1/2/2007" | Date == "2/2/2007")
