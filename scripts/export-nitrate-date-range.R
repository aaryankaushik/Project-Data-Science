# Note: Set the working directory according to your local repository
# setwd('C:/Users/Rahmanda Wibowo/Documents/master/semester 3/project data science/project')

library(tidyverse)

data <- read_csv('data/converted_geojson.csv')

data.date <- data %>%
  mutate(date = format(Date, '%Y-%m-%d')) %>%
  select(-OBJECTID) %>%
  arrange(Site_Code, date) %>%
  group_by(Site_Code) %>%
  slice(c(1, n())) %>%
  ungroup()

dd <- data.frame(Site_Code = character(),
                 latitude = double(), longitude = double(),
                 first_date = character(), last_date = character())

j <- 1

for (i in seq(1, nrow(data.date)/2)) {
  cur <- data.date[j, ]
  nex <- data.date[j+1, ]
  first_date <- cur$date
  last_date <- nex$date
  if (first_date > last_date) {
    first_date <- nex$date
    last_date <- cur$date
  }
  dd[i, ] <- list(cur$Site_Code,
               cur$latitude, cur$longitude,
               first_date, last_date)
  j <- j+2
}

write_csv(dd, 'data/nitrate-site-ll-w-date.csv')
