# -------------------------------------------------------------------------------------------
# Exploratory Data Analysis
# Course Project 1 
# -------------------------------------------------------------------------------------------
# Plot 1: Global Active Power
# -------------------------------------------------------------------------------------------

# Load Dataset
hpc <- read.csv("household_power_consumption.txt",header=TRUE, sep=";")
hpc$Date = as.Date(as.character(hpc$Date), "%d/%m/%Y")              # Convert Date-colum into datatype Date
hpc = hpc[hpc$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]	# Subset Date for 2007-02-01 and 2007-02-02 

# Create Histogram
hist(as.numeric(as.character(hpc$Global_active_power)),
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

# Write PNG-File
dev.copy(png, 
        file="plot1.png", 
        width = 480, 
        height = 480)	                                    # copy plot into png-file
dev.off()
