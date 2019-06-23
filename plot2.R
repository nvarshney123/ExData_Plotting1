##read file household_power_consumption.txt
> powercon<-read.csv("C:/Users/navratan/Documents/household_power_consumption.txt",header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## subset file data for dates 2007-02-01 and 2007-02-02
> powerconsub <- subset(powercon, Date %in% c("1/2/2007","2/2/2007"))
##format datte and time 
> powerconsub$Date <- as.Date(powerconsub$Date, format="%d/%m/%Y")
> powerconsub$Time <- strptime(powerconsub$Time, format="%H:%M:%S")
> powerconsub[1:1440,"Time"] <- format(powerconsub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
> powerconsub[1441:2880,"Time"] <- format(powerconsub[1441:2880,"Time"],"2007-02-01 %H:%M:%S")

## generate plot
> plot(powerconsub$Time,as.numeric(as.character(powerconsub$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")

##Annotate

> title(main="Global Active Power Vs Time")

##copy to plot2.png
> png("plot2.png", width=480, height=480)
