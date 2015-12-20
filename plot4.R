# -------------------------------------------------------------------------------------------
# Exploratory Data Analysis
# Course Project 1 
# -------------------------------------------------------------------------------------------
# Plot 4
# -------------------------------------------------------------------------------------------

# Load Dataset
hpc <- read.csv("household_power_consumption.txt",header=TRUE, sep=";")
hpc$Date = as.Date(as.character(hpc$Date), "%d/%m/%Y") 
hpc = hpc[hpc$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]	

# Set plot rows/columns
par(mfrow = c(2, 2))

# Create plot1
plot(strptime(paste(as.character(hpc$Date), as.character(hpc$Time), sep = " "), "%Y-%m-%d %H:%M:%S"), 
     as.numeric(as.character(hpc$Global_active_power)),
     xlab="",
     ylab="Global Active Power",
     type = "l")


# Create plot2
plot(strptime(paste(as.character(hpc$Date), as.character(hpc$Time), sep = " "), "%Y-%m-%d %H:%M:%S"), 
     as.numeric(as.character(hpc$Voltage)),
     type = "l", 
     ylab = "Voltage", 
     xlab = "datetime")

# Create plot3
plot(strptime(paste(as.character(hpc$Date), as.character(hpc$Time), sep = " "), "%Y-%m-%d %H:%M:%S"), 
     as.numeric(as.character(hpc$Sub_metering_1)),
     xlab="",
     ylab="Energy sub metering",
     type = "l")

# Add red line for Sub_metering_2
lines(strptime(paste(as.character(hpc$Date), as.character(hpc$Time), sep = " "), "%Y-%m-%d %H:%M:%S"), 
      as.numeric(as.character(hpc$Sub_metering_2)),
      type="l",
      col="red")

# Add blue line for Sub_metering_3
lines(strptime(paste(as.character(hpc$Date), as.character(hpc$Time), sep = " "), "%Y-%m-%d %H:%M:%S"), 
      as.numeric(as.character(hpc$Sub_metering_3)),
      type="l",
      col="blue")

# Add Legend
legend("topright", 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"), 
       lwd=1,
       box.lty=0,
       cex=0.6)

# Create plot4
plot(strptime(paste(as.character(hpc$Date), as.character(hpc$Time), sep = " "), "%Y-%m-%d %H:%M:%S"), 
     hpc$Global_reactive_power, 
     type = "l", 
     ylab = "Global_reactive_power", 
     xlab = "datetime")

# Write PNG-File
dev.copy(png, 
         file="plot4.png", 
         width = 480, 
         height = 480)	                                            # copy plot into png-file
dev.off()
