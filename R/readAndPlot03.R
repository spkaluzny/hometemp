DBFILE <- "/home/spk/DATA/HOMETEMP/SQLITE/hometemp_BMP180.db"
library("RSQLite")
library("lubridate")
library("dplyr")
library("ggplot2")
#
sqlite <- dbDriver("SQLite")
dbCon <- dbConnect(sqlite, DBFILE)
tempDF <- dbGetQuery(dbCon, 'select * from sensor_data')
tempDF$TempF <- tempDF$temperature * 9 / 5 + 32
tempDF$DateTime <- as.POSIXct(tempDF$timestamp)
tempDF$DayOfYear <- yday(tempDF$DateTime)
todayDayOfYear <- tempDF$DayOfYear[nrow(tempDF)]
tempDF$Year <- year(tempDF$DateTime)
thisYear <- tempDF$Year[nrow(tempDF)]
options(bitmapType='cairo')
png(file="/home/spk/public_html/graphs/tempPlot03.png", width = 700, height = 700)
tempDF %>%
  filter(Year == thisYear) %>%
  filter(DayOfYear == todayDayOfYear | DayOfYear == (todayDayOfYear - 1)) %>%
  ggplot(aes(x = DateTime, y = TempF)) +
    geom_line()
dev.off()
