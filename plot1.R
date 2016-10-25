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

# convert to numeric #
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# plot 1 #
png("plot1.png")
hist(na.omit(data$Global_active_power),main="Global Active Power", ylim = c(0,1200), xlab = "Global Active Power (kilowatts)", col="red")
dev.new(width = 480, height = 480)
dev.off()
