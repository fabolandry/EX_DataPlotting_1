
#set directory to that with household_power_consumption.txt
setwd("C:/Users/IGT/Documents/Landry Stuff/EX_DataPlotting_1")

# load libraries
library(sqldf)
library(data.table)
library(lubridate)

# read from source file limiting only 2 days
power.consumption<- read.csv.sql( "C:/Users/IGT/Documents/Landry Stuff/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";", sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",  header=TRUE)

# tidy up data
cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity','SubMetering1','SubMetering2','SubMetering3')
colnames(power.consumption)<-cols
power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
power.consumption<-power.consumption[,c(10,3:9)]

#create the graph 
png(filename='plot1.png',width=480,height=480,units='px')
hist(power.consumption$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Close off graphic device
x<-dev.off()













 



