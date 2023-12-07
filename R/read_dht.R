read_dht11 <- function(file) {
  d <- readr::read_csv(file)
  d[["DateTime"]] <- as.POSIXct(d[["datetime"]])
  if(any(names(d) == "humidity")) {
     names(d)[names(d) == "humidity"] <- "Humidity"
  }
  d[["TempF"]] <- d[["temp"]]*9/5 + 32
  d[["Date"]] <- lubridate::date(d[["DateTime"]])
  d
}
