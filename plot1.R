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

### PLOT 1
png(file = "plot1.png")
hist(Consumo_TBJO$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
dev.off()
