#setwd("F:\\Coursera\\Exploratory Data Analysis -by Roger D. Peng (JohnsHopkins)\\PA1")
#assump the dataset has been downloaded into the current  working directory
pc <- read.table("./household_power_consumption.txt", header = TRUE, sep=";",  as.is = TRUE )
#We will only be using data from the dates 2007-02-01 and 2007-02-02.
pc1 <- subset(pc, pc$Date == "1/2/2007" | pc$Date == "2/2/2007")
date.time <- as.POSIXct(paste(pc1$Date, pc1$Time), format='%d/%m/%Y %H:%M:%S')

pc1$Global_active_power <- as.numeric(pc1$Global_active_power)

png(file="plot2.png",width = 480, height = 480,)
plot(date.time, pc1$Global_active_power, xlab="", ylab="Global Active Power(kilowatts)", type="l")

dev.off()


