## Load Data
Consumo <- read.csv("~/Desktop/ejemplos R/household_power_consumption.txt", header=TRUE, sep=";")


## Transform variables date and time
Consumo$date_time <- paste(Consumo$Date, Consumo$Time) 
Consumo$datetime <- strptime(Consumo$date_time, "%d/%m/%Y %H:%M:%S")
Consumo$date_time <- as.Date(Consumo$datetime)


## Coerce Character variables to numeric
Consumo$Global_active_power <- as.numeric(Consumo$Global_active_power)
Consumo$Global_reactive_power <- as.numeric(Consumo$Global_reactive_power)
Consumo$Voltage <- as.numeric(Consumo$Voltage)
Consumo$Sub_metering_1 <- as.numeric(Consumo$Sub_metering_1)
Consumo$Sub_metering_2 <- as.numeric(Consumo$Sub_metering_2)
Consumo$Sub_metering_3 <- as.numeric(Consumo$Sub_metering_3)


## Subset the dataframe using the given dates
Consumo_TBJO <- subset(Consumo, date_time == "2007-02-01" |  date_time == "2007-02-02" )

### PLOT 4
png(file = "plot4.png")
par( mfrow = c(2,2))

## 1st plot
plot(Consumo_TBJO$datetime, Consumo_TBJO$Global_active_power, type = "l" ,ylab = "Global Active Power", xlab = "")


## 2nd plot
with(Consumo_TBJO, plot(datetime, Voltage, type = "l"))

## 3rd plot
plot(Consumo_TBJO$datetime,Consumo_TBJO$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(Consumo_TBJO$datetime, Consumo_TBJO$Sub_metering_2, col = "red")
lines(Consumo_TBJO$datetime, Consumo_TBJO$Sub_metering_3, col = "blue")
legend("toprigh", lty = c(1,1,1),col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       box.lty = 0, cex = 0.7, y.intersp = 0.8, x.intersp = 0.7)

## 4rd plot
with(Consumo_TBJO, plot(datetime, Global_reactive_power, type = "l"))

dev.off()
