# Note: Set the working directory according to your local repository
# setwd('C:/Users/Rahmanda Wibowo/Documents/master/semester 3/project data science/project')

library(tidyverse)

data <- read_csv('data/converted_geojson.csv')
glimpse(data)

# Overall distribution of NO3
hist(data$NO3_N_MGL)

# How many unique sites are there? 890
length(unique(data$Site_Code))

# How is the distribution of count NO3 per sites? (unbalanced data)
data %>%
  select(Site_Code, NO3_N_MGL) %>%
  group_by(Site_Code) %>%
  count() %>%
  ggplot(aes(n)) +
  geom_histogram()

# Max and min NO3 per sites?
min_max_NO3_per_sites <- data %>%
  select(Site_Code, NO3_N_MGL) %>%
  group_by(Site_Code) %>%
  summarise(min = min(NO3_N_MGL), max = max(NO3_N_MGL))

min_max_NO3_per_sites.no_na <- min_max_NO3_per_sites %>% filter(!is.na(min))
(max(min_max_NO3_per_sites.no_na$min) - min(min_max_NO3_per_sites.no_na$min))/2
(max(min_max_NO3_per_sites.no_na$max) - min(min_max_NO3_per_sites.no_na$max))/2

ann <- data.frame(
  x = c(-Inf, -Inf, Inf, Inf),
  y = c(-Inf, Inf, -Inf, Inf),
  label = c('low min + low max', 'low min + high max', 'high min + low max', 'high min + high max'),
  hjust = c(0, 0, 1, 1),
  vjust = c(0, 1, 0, 1)
)

ggplot(min_max_NO3_per_sites, aes(min, max, label = Site_Code)) +
  geom_point(size = 1) +
  geom_text(size = 2, vjust = -0.5) +
  geom_hline(yintercept = 6.8, linetype = 'dashed') +
  geom_vline(xintercept = 2.245, linetype = 'dashed') +
  geom_text(data = ann, size = 3, aes(x, y, hjust = hjust, vjust = vjust, label = label)) +
  xlab('min NO3_N_MGL') +
  ylab('max NO3_N_MGL')

# Missing values
data.na <- data %>%
  group_by(Site_Code) %>%
  summarise(count = n(), count_na = sum(is.na(NO3_N_MGL))) %>%
  mutate(percentage = count_na / count * 100)
data.na
nrow(data.na %>% filter(percentage == 100))
nrow(data.na %>% filter(percentage == 0))
which.max((data.na %>% filter(percentage == 0))$count) # index 17
hist(data[17, ]$NO3_N_MGL)

# Sites without missing values
good_sites <- (data.na %>% filter(percentage < 100))$Site_Code
data.clean <- data %>% filter(Site_Code %in% good_sites)
length(good_sites) # 767 sites
nrow(data.clean) # 140459
nrow(data.clean) / nrow(data) * 100 # 99.3%
hist(data.clean$NO3_N_MGL) # dist NO3 is still skewed
data.clean %>%
  select(Site_Code, NO3_N_MGL) %>%
  group_by(Site_Code) %>%
  count() %>%
  ggplot(aes(n)) +
  geom_histogram()

# Which obs that have NO3_N_MGL > 5 or > 10
data.no3n_gt5 <- data.clean %>% filter(NO3_N_MGL > 5)
length(unique(data.no3n_gt5$Site_Code)) # 219
nrow(data.no3n_gt5) / nrow(data.clean) * 100 # 1.48%

top10 <- data.no3n_gt5 %>% group_by(Site_Code) %>% summarise(n = n()) %>% top_n(10, n)

ggplot(data.no3n_gt5 %>% filter(Site_Code %in% top10$Site_Code), aes(Date, NO3_N_MGL, color = Site_Code)) +
  geom_point()
