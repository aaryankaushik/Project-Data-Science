# Note: Set the working directory according to your local repository
setwd('C:/Users/Rahmanda Wibowo/Documents/master/semester 3/project data science/project')

library(tidyverse)

batch_num <- 3
num_site_code.start <- 10206
num_site_code.end <- 10313

rainfall.filename <- paste(
  'data/rainfall/rainfall-data-batch-',
  batch_num,
  '-F',
  num_site_code.start, 
  '-F',
  num_site_code.end,
  '.csv',
  sep = ""
)
data.rainfall <- read_csv(rainfall.filename)
data.rainfall$date <- as.character(data.rainfall$date)
data.rainfall <- data.rainfall %>% arrange(Site_Code, date)
sites <- unique(data.rainfall$Site_Code)

data.nitrate <- read_csv('data/converted_geojson.csv')
data.nitrate <- data.nitrate %>%
  select(OBJECTID, Site_Code, latitude, longitude, Date, NO3_N_MGL) %>%
  mutate(
    date = format(Date, '%Y-%m-%d')
  ) %>%
  filter(Site_Code %in% sites) %>%
  arrange(Site_Code, date)
  

data.merge <- data.frame(OBJECTID = double(), Site_Code = character(),
                         latitude = double(), longitude = double(),
                         date = character(), NO3_N_MGL = double(), rain_sum = double()) 

# The loop is intentionally made this so that
# the rainfall data loop doesn't have to start from
# start again every single time -> gain some efficiency
# Note: This only works if the data is sorted by Site_Code and date
i <- 1
j <- 1
while (i <= nrow(data.nitrate)) {
  item <- data.nitrate[i, ]
  rain_sum <- NA
  num_site_code <- as.numeric(str_replace(item$Site_Code, 'F', ''))
  
  print(paste("inserting data for", item$Site_Code, item$date))
  
  while(j <= nrow(data.rainfall)) {
    item_rainfall <- data.rainfall[j, ]
    if (item$Site_Code == item_rainfall$Site_Code && item$date == item_rainfall$date) {
      rain_sum <- item_rainfall$rain_sum  
      j <- j + 1
      break
    }
    j <- j + 1
  }
  data.merge[i, ] <- list(item$OBJECTID, item$Site_Code, 
                      item$latitude, item$longitude,
                      item$date, item$NO3_N_MGL, rain_sum) 
  i <- i + 1
}

output.filename <- paste(
  "data/nitrate-rainfall-data-F", 
  num_site_code.start, 
  "-F", 
  num_site_code.end,
  ".csv",
  sep = ""
)

write_csv(data.merge, output.filename)
