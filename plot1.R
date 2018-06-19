# plot 1 
#import relevant lib

if (!require("dplyr")) {
  install.packages("dplyr")
}

library("dplyr")

# import raw data
household_power_consumption <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")

# date time transformation
household_power_consumption$Date = as.character(household_power_consumption$Date)
# subset the data for 2 dates
household_subset= household_power_consumption[household_power_consumption$Date %in% c("1/2/2007","2/2/2007" ),]

# date time transformation
household_subset$Date = as.Date(household_subset$Date, "%d/%m/%Y")

# variable transformation for display
household_subset$Global_active_power = as.numeric(household_subset$Global_active_power)
household_subset$Global_active_powerkwh = household_subset$Global_active_power/1000

# open png device
png(filename="plot1.png", width = 480, height = 480, units = "px")

hist(household_subset$Global_active_powerkwh, col="red", xlab = 'Global active power (kilowatts)',
     main="Global active power") 
dev.off()
