#setwd("F:\\Coursera\\Exploratory Data Analysis -by Roger D. Peng (JohnsHopkins)\\PA1")
#assump the dataset has been downloaded into the current  working directory
pc <- read.table("./household_power_consumption.txt", header = TRUE, sep=";",  as.is = TRUE )
#We will only be using data from the dates 2007-02-01 and 2007-02-02.
pc1 <- subset(pc, pc$Date == "1/2/2007" | pc$Date == "2/2/2007")
pc1$date.time <- as.POSIXct(paste(pc1$Date, pc1$Time), format='%d/%m/%Y %H:%M:%S')
pc1$Global_active_power <- as.numeric(pc1$Global_active_power)

png(file="plot4.png",width = 480, height = 480,)
par(ps=13, mfrow = c(2, 2),mar=c(4,4,4,4), oma=c(0,0.5,0,0))
plot(pc1$date.time, pc1$Global_active_power, xlab="", ylab="Global Active Power", type="l")
plot(pc1$date.time, pc1$Voltage, xlab="datetime", ylab="Voltage", type="l")

with(pc1, plot(date.time, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l"))
with(pc1, points(date.time, Sub_metering_2, type="l", col = "red"))
with(pc1, points(date.time, Sub_metering_3, type="l", col = "blue"))
legend("topright", cex=0.6, lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(pc1$date.time, pc1$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()

