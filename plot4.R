##read file household_power_consumption.txt
> powercon<-read.csv("C:/Users/navratan/Documents/household_power_consumption.txt",header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## subset file data for dates 2007-02-01 and 2007-02-02
> powerconsub <- subset(powercon, Date %in% c("1/2/2007","2/2/2007"))
##format date and time 
> powerconsub$Date <- as.Date(powerconsub$Date, format="%d/%m/%Y")
> powerconsub$Time <- strptime(powerconsub$Time, format="%H:%M:%S")
> powerconsub[1:1440,"Time"] <- format(powerconsub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
> powerconsub[1441:2880,"Time"] <- format(powerconsub[1441:2880,"Time"],"2007-02-01 %H:%M:%S")

# initiating a composite plot 
par(mfrow=c(2,2))

## generate plot
> with(powerconsub,{
+     plot(powerconsub$Time,as.numeric(as.character(powerconsub$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
+     plot(powerconsub$Time,as.numeric(as.character(powerconsub$Voltage)), type="l",xlab="datetime",ylab="Voltage")
+     plot(powerconsub$Time,powerconsub$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
+     with(powerconsub,lines(Time,as.numeric(as.character(Sub_metering_1))))
+     with(powerconsub,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
+     with(powerconsub,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
+     legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
+     plot(powerconsub$Time,as.numeric(as.character(powerconsub$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
+ })

##copy to plot4.png
> png("plot4.png", width=480, height=480)
