fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, ".\\R\\Household_power_consumption.zip")
unzip(".\\R\\Household_power_consumption.zip",exdir=".\\R")
file<-".\\R\\household_power_consumption.txt"
powerdata<-read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE) 

#Subset DF based on date
powerdata1<- powerdata[which(powerdata$Date %in% c("1/2/2007", "2/2/2007")),]

# Plot-3
install.packages("lubridate")
library(lubridate)
png("plot3.png", width = 480, height = 480)
powerdata1$Date_Time<- dmy_hms(paste(powerdata1$Date, powerdata1$Time))
with(powerdata1, plot(Date_Time, Sub_metering_1, ylab = "Energy sub metering",xlab = "", type = "n"))
with(powerdata1, points(Date_Time, Sub_metering_1, type="l", col="black"))
with(powerdata1, points(Date_Time, Sub_metering_2, type="l", col="red"))
with(powerdata1, points(Date_Time, Sub_metering_3, type="l", col="blue"))
legend("topright", lty = 1, col=c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

