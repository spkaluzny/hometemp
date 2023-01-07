# from Twitter thread:
# https://twitter.com/neilgcurrie/status/1600535679376580609

library(RSQLite)
dbfile <- here::here("SQLITE/hometemp_BMP180.db")
con <- DBI::dbConnect(RSQLite::SQLite(), dbfile)
tables <- DBI::dbListTables(con)

query <- "SELECT * FROM sensor_data"
d <- dbGetQuery(con , statement=query)
dim(d)



