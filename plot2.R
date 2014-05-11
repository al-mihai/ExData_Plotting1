data<-read.table("household_power_consumption.txt", dec=".", fill=TRUE, quote="\"", 
                 row.names=NULL,
                 header=TRUE, sep=";")

data$Time<-paste(data$Date, data$Time, sep=" ")
data$Time<-strptime(data$Time, "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power<-suppressWarnings(as.numeric(as.character(data$Global_active_power)))

startDate<-as.Date('02/01/2007',format='%m/%d/%Y')
endDate<-as.Date('02/02/2007',format='%m/%d/%Y')

dt<-data[data$Date>=startDate & data$Date<=endDate,]

plot(dt$Time, dt$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", width = 480, height = 480, bg="white")
dev.off()
