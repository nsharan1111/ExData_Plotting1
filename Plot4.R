fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, ".\\R\\Household_power_consumption.zip")
unzip(".\\R\\Household_power_consumption.zip",exdir=".\\R")
file<-".\\R\\household_power_consumption.txt"
powerdata<-read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE) 

#powerdata1<- subset(powerdata)
powerdata1<- powerdata[which(powerdata$Date %in% c("1/2/2007", "2/2/2007")),]

# Plot-3
install.packages("lubridate")
library(lubridate)
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
powerdata1$datetime<- dmy_hms(paste(powerdata1$Date, powerdata1$Time))

#Plot-1
powerdata1$Global_active_power <- as.numeric(powerdata1$Global_active_power)
with(powerdata1, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))

#Plot-2
powerdata1$Voltage <- as.numeric(powerdata1$Voltage)
par(yaxt="n")
with(powerdata1, plot(datetime, Voltage, type = "l"))
par(yaxt="s")
axis(side = 2, at = seq(234, 246, by = 2), labels = FALSE)
axis(side = 2, at = seq(234, 246, by = 4))

#Plot-3
with(powerdata1, plot(datetime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n"))
with(powerdata1, points(datetime, Sub_metering_1, type="l", col="black"))
with(powerdata1, points(datetime, Sub_metering_2, type="l", col="red"))
with(powerdata1, points(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", bty = "n", lty = 1, col=c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot-4
powerdata1$Global_reactive_power <- as.numeric(powerdata1$Global_reactive_power)
with(powerdata1, plot(datetime, Global_reactive_power, type = "l"))

dev.off()


