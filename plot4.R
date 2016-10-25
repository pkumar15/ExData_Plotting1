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

# format timestamp and numbers #
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))


# plot 4 #
png("plot4.png")
par(mfrow = c(2,2), mar = c(4,4,2,1))
# top left #
plot(na.omit(data$datetime), na.omit(data$Global_active_power), xlab="", ylab="Global Active Power", type = "l")
# top right #
plot(na.omit(data$datetime), na.omit(data$Voltage), xlab="datetime", ylab="Voltage", type = "l")
# bottom left #
plot(na.omit(data$datetime), na.omit(data$Sub_metering_1), xlab = "", ylab="Energy sub metering", type = "l")
lines(na.omit(data$datetime), na.omit(data$Sub_metering_1), col = "black")
lines(na.omit(data$datetime), na.omit(data$Sub_metering_2), col = "red")
lines(na.omit(data$datetime), na.omit(data$Sub_metering_3), col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col=c("black","red","blue"))
# bottom right #
plot(na.omit(data$datetime), na.omit(data$Global_reactive_power), xlab="datetime", ylab="Global_reactive_power", type = "l")
dev.new(width = 480, height = 480)
dev.off()

