# -------------------------------------------------------------------------------------------
# Exploratory Data Analysis
# Course Project 1 
# -------------------------------------------------------------------------------------------
# Plot 3: Sub Metering
# -------------------------------------------------------------------------------------------

# Load Dataset
hpc <- read.csv("household_power_consumption.txt",header=TRUE, sep=";")
hpc$Date = as.Date(as.character(hpc$Date), "%d/%m/%Y")              # Convert Date-colum into datatype Date
hpc = hpc[hpc$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]	# Subset Date for 2007-02-01 and 2007-02-02 


# Create plot
plot(strptime(paste(as.character(hpc$Date), as.character(hpc$Time), sep = " "), "%Y-%m-%d %H:%M:%S"), 
     as.numeric(as.character(hpc$Sub_metering_1)),
     main="",
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
       text.font=1,
       box.lty=0,
       adj = c(0,0),
       cex=0.8)

# Write PNG-File
dev.copy(png, 
         file="plot3.png", 
         width = 480, 
         height = 480)	                                            # copy plot into png-file
dev.off()
