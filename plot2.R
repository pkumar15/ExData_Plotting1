# read in data from working directory #
setwd("~/Desktop/Data")
complete_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
dim(complete_data)
head(complete_data)

# format date #
formatted_data = complete_data
formatted_data$Date <- as.Date(formatted_data$Date,"%d/%m/%Y")

# subset desired dates #
data <- subset(formatted_data,Date == "2007-02-01" | Date == "2007-02-02")

# format numbers #
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# create and save plot 2 #
png("plot2.png")
plot(na.omit(data$DateTime), na.omit(data$Global_active_power), type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.new(width = 480, height = 480)
dev.off()
