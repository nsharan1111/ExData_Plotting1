fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, ".\\R\\Household_power_consumption.zip")
unzip(".\\R\\Household_power_consumption.zip",exdir=".\\R")
file<-".\\R\\household_power_consumption.txt"
powerdata<-read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE) 

#subset DF based on date

powerdata1<- powerdata[which(powerdata$Date %in% c("1/2/2007", "2/2/2007")),]

#Plot-2
install.packages("lubridate")
library(lubridate)
png("plot2.png", width = 480, height = 480)
powerdata1$Date_Time<- dmy_hms(paste(powerdata1$Date, powerdata1$Time))
with(powerdata1,plot(Date_Time, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type="l"))
dev.off()
