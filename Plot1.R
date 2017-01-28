fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, ".\\R\\Household_power_consumption.zip")
unzip(".\\R\\Household_power_consumption.zip",exdir=".\\R")
file<-".\\R\\household_power_consumption.txt"
powerdata<-read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE) 

#powerdata1<- subset(powerdata)
powerdata1<- powerdata[which(powerdata$Date %in% c("1/2/2007", "2/2/2007")),]

png("plot1.png", width = 480, height = 480)
powerdata1$Global_active_power <- as.numeric(powerdata1$Global_active_power)
hist(powerdata1$Global_active_power, breaks = 12,col = "red", axes=FALSE, xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
axis(side=1, at=seq(0,6,by=2))
axis(side=2, at=seq(0, 1200, by=200))
dev.off()
