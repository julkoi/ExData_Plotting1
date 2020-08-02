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

### PLOT 3
png(file = "plot3.png")
plot(Consumo_TBJO$datetime,Consumo_TBJO$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(Consumo_TBJO$datetime, Consumo_TBJO$Sub_metering_2, col = "red")
lines(Consumo_TBJO$datetime, Consumo_TBJO$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1),col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)
dev.off()
