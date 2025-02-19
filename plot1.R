##read file household_power_consumption.txt
> powercon<-read.csv("C:/Users/navratan/Documents/household_power_consumption.txt",header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## subset file data for dates 2007-02-01 and 2007-02-02
> powerconsub <- subset(powercon, Date %in% c("1/2/2007","2/2/2007"))
##convert date format
> powerconsub$Date <- as.Date(powerconsub$Date, format="%d/%m/%Y")
## generate histogram
> hist(powerconsub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
##copy to plot1.png
> png("plot1.png", width=480, height=480)
