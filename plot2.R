fn = "C:/Users/Downloads/Class/Johns Hopkins/Exploratory Data Analysis/household_power_consumption_subset.txt"
dat = read.table(fn, sep = ";", header = TRUE)
dat$DateTime = paste(dat$Date, dat$Time)
dat$DateTime = strptime(dat$DateTime, format = "%d/%m/%Y %H:%M:%S")
dat = subset(dat, DateTime$year == 107 & DateTime$mon == 1 & (DateTime$mday==1 | DateTime$mday == 2))
png(file = "plot2.png", bg = "transparent", units = "px", width = 480, height = 480) 
plot(dat$DateTime, dat[,3], col='black', t='l', ylab="Global Active Power (kilowatts)", xlab = '')
dev.off()
