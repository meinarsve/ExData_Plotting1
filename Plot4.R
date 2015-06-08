## Read the file to a dataframe
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Extract only the dates from 2007-02-01 to 2007-02-02
dfsub1 <- subset(df, Date == "1/2/2007") # Feb. 01 - 2007
dfsub2 <- subset(df, Date == "2/2/2007") # Feb. 02 - 2007
dfsub  <- rbind(dfsub1,dfsub2) # Combine

# Combine the columns of Date and Time into one column,
# and then save this as a as.POSIXct column. Note that the format
# is specified by looking how the Date and Time is stored in the original dataframe
t  <- paste(dfsub$Date, dfsub$Time)
tt <- as.POSIXct(t, format= "%d/%m/%Y%H:%M:%S")

# Allocate empty png file to save histogram in
png(file = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2)) 

plot(tt, as.numeric(as.vector(dfsub$Global_active_power)), type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

plot(tt, as.numeric(as.vector(dfsub$Voltage)), type = "l", 
     xlab = "datetime", ylab = "Voltage")

plot(tt, as.numeric(as.vector(dfsub$Sub_metering_1)), type = "l", 
     xlab = "", ylab = "Energy sub metering", col = "black")

lines(tt, as.numeric(as.vector(dfsub$Sub_metering_2)), type = "l", col = "red")
lines(tt, as.numeric(as.vector(dfsub$Sub_metering_3)), type = "l", col = "blue")

legend("topright", col = c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"), 
       lty=c(1,1,1), )

plot(tt, as.vector(as.numeric(dfsub$Global_reactive_power)), type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")



# 4 figures arranged in 2 rows and 2 columns
#attach(mtcars)
#par(mfrow=c(2,2))

#plot(wt,mpg, main="Scatterplot of wt vs. mpg")
#plot(wt,disp, main="Scatterplot of wt vs disp")
#hist(wt, main="Histogram of wt")
#boxplot(wt, main="Boxplot of wt")




#plot(tt, as.numeric(as.vector(dfsub$Sub_metering_1)), type = "l", 
#     xlab = "", ylab = "Energy sub metering", col = "black")
#
#lines(tt, as.numeric(as.vector(dfsub$Sub_metering_2)), type = "l", col = "red")
#lines(tt, as.numeric(as.vector(dfsub$Sub_metering_3)), type = "l", col = "blue")
#
#legend("topright", col = c("black", "red", "blue"), 
#       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"), 
#       lty=c(1,1,1), )
#
dev.off()
