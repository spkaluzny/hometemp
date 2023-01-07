read_sqlite_bmp180 <- function(file) {
  sqlite <- RSQLite::dbDriver("SQLite")
  dbCon <- RSQLite::dbConnect(sqlite, file)
  tempDF <- RSQLite::dbGetQuery(dbCon, 'select * from sensor_data')
  tempDF$TempF <- tempDF$temperature * 9 / 5 + 32
  tempDF$DateTime <- as.POSIXct(tempDF$timestamp)
  tempDF$Date <- lubridate::date(tempDF$DateTime)
  tempDF$DayOfYear <- lubridate::yday(tempDF$DateTime)
  tempDF$fDayOfYear <- order(tempDF$DayOfYear)
  tempDF
}
