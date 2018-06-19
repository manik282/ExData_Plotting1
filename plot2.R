# plot 2
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
png(filename="plot2.png", width = 480, height = 480, units = "px")
plot(x = household_subset$Datetime, y = household_subset$Global_active_powerkwh,type = "l", ylab = "Global active power (kilowatts)",
     xlab = "")
dev.off()



