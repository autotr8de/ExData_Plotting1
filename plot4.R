fn = "C:/Users/Downloads/Class/Johns Hopkins/Exploratory Data Analysis/household_power_consumption_subset.txt"
dat = read.table(fn, sep = ";", header = TRUE)
dat$DateTime = paste(dat$Date, dat$Time)
dat$DateTime = strptime(dat$DateTime, format = "%d/%m/%Y %H:%M:%S")
dat = subset(dat, DateTime$year == 107 & DateTime$mon == 1 & (DateTime$mday==1 | DateTime$mday == 2))
png(file = "plot4.png", bg = "transparent", units = "px", width = 480, height = 480)
par(mfcol=c(2,2))
# 1
plot(dat$DateTime, dat[,3], col='black', t='l', ylab="Global Active Power", xlab = '')

# 2
plot(dat$DateTime, dat$Sub_metering_1, col='black', t='l', ylab="Energy sub metering", xlab = '')
lines(dat$DateTime, dat$Sub_metering_2, col='red', t='l')
lines(dat$DateTime, dat$Sub_metering_3, col='purple', t='l')
legend("topright", legend=colnames(dat)[7:9], col=c('black', 'red', 'purple'), lty = 1)

# 3
plot(dat$DateTime, dat$Voltage, col='black', t='l', ylab="Voltage", xlab = 'datetime')

# 4
plot(dat$DateTime, dat$Global_reactive_power, col='black', t='l', ylab="Global_reactive_power", xlab = 'datetime')

dev.off()
