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
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

# create and export plot 3 #
png("plot3.png")
plot(na.omit(data$DateTime), na.omit(data$Sub_metering_1), xlab = "", ylab="Energy sub metering", type = "l")
  lines(na.omit(data$DateTime), na.omit(data$Sub_metering_1), col = "black")
  lines(na.omit(data$DateTime), na.omit(data$Sub_metering_2), col = "red")
  lines(na.omit(data$DateTime), na.omit(data$Sub_metering_3), col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col=c("black","red","blue"))
dev.new(width = 480, height = 480)
dev.off()
