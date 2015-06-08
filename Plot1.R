## Read the file to a dataframe
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")


## Use only the dates from 2007-02-01 to 2007-02-02
dfsub1 <- subset(df, Date == "1/2/2007") # Feb. 01 - 2007
dfsub2 <- subset(df, Date == "2/2/2007") # Feb. 02 - 2007
dfsub  <- rbind(dfsub1,dfsub2) # Combine

# Allocate empty png file to save histogram in
png(file = "plot1.png", width = 480, height = 480, units = "px")

# Make histogram
hist(as.numeric(as.vector((dfsub$Global_active_power))), breaks = 12, 
     main = "Global Active Power", col = "red", 
     xlab="Global Active Power (kilowatts)")

dev.off()

