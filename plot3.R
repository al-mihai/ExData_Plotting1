data<-read.table("household_power_consumption.txt", dec=".", fill=TRUE, quote="\"", 
                 row.names=NULL,
                 header=TRUE, sep=";")

data$Time<-paste(data$Date, data$Time, sep=" ")
data$Time<-strptime(data$Time, "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power<-suppressWarnings(as.numeric(as.character(data$Global_active_power)))

data$Sub_metering_1<-suppressWarnings(as.numeric(as.character(data$Sub_metering_1)))
data$Sub_metering_2<-suppressWarnings(as.numeric(as.character(data$Sub_metering_2)))
data$Sub_metering_3<-suppressWarnings(as.numeric(as.character(data$Sub_metering_3)))

startDate<-as.Date('02/01/2007',format='%m/%d/%Y')
endDate<-as.Date('02/02/2007',format='%m/%d/%Y')

dt<-data[data$Date>=startDate & data$Date<=endDate,]

plot(dt$Time, dt$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(dt$Time, dt$Sub_metering_2, col="red")
lines(dt$Time, dt$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), lwd=c(2,2,2),col=c("black","red","blue"), cex=0.4, inset=c(0.01,0.01)) 

dev.copy(png, file = "plot3.png", width = 480, height = 480, bg="white")
dev.off()
