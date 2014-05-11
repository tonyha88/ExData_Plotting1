#setwd("F:\\Coursera\\Exploratory Data Analysis -by Roger D. Peng (JohnsHopkins)\\PA1")
#assump the dataset has been downloaded into the current  working directory
pc <- read.table("./household_power_consumption.txt", header = TRUE, sep=";",  as.is = TRUE )
#We will only be using data from the dates 2007-02-01 and 2007-02-02.
pc <- subset(pc, pc$Date == "1/2/2007" | pc$Date == "2/2/2007")
pc$Global_active_power <- as.numeric(pc$Global_active_power)
png(file="plot1.png",width = 480, height = 480,)
hist(pc$Global_active_power, col="red", xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.off()


