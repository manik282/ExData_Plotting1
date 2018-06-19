# plot 3
#import relevant lib
if (!require("dplyr")) {
  install.packages("dplyr")
}

library("dplyr")

# import raw data
household_power_consumption <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")

# date time transformation
household_power_consumption$Date = as.character(household_power_consumption$Date)
household_power_consumption$Time = as.character(household_power_consumption$Time)

# subset data
household_subset= household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007" ),]

# date time transformation
household_subset$Date = as.Date(household_subset$Date, "%d/%m/%Y")
household_subset$Datetime = paste(household_subset$Date,household_subset$Time, sep = " " )
household_subset$Datetime = strptime(household_subset$Datetime, "%Y-%m-%d %H:%M:%S")

# variable transformation for display
household_subset$Global_active_power = as.numeric(household_subset$Global_active_power)
household_subset$Global_active_powerkwh = household_subset$Global_active_power/1000

# open png device

png(filename="plot3.png", width = 480, height = 480, units = "px")

plot(x = household_subset$Datetime, y = household_subset$Sub_metering_1,type = "l", ylab = "Energy sub metering",xlab = "", col = "black")
# Add second line
lines(x = household_subset$Datetime,y = household_subset$Sub_metering_2,col="red")
# Add third line
lines(x = household_subset$Datetime,y = household_subset$Sub_metering_3,col="blue")
# Add a legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3" ),col=c("black", "red", "blue"), lty=1:2, cex=1.2)

dev.off()
