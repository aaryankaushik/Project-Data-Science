# Logbook

Group members:
1. Aaryan Kaushik
2. Adina Asim
3. Mohammad Sazegar
4. Rahmanda Wibowo

## 2022-12-14

1. We will focus on the topic about the association between rainfall and nitrate level in US region (Montana or Misissippi because those are agricultural regions). High nitrate level in water can be dangerous for drinking water and threatens ecosystem in water.
2. @Adina and @Aaryan will look for water data here https://www.waterqualitydata.us/.
3. @Mohammad will look for rainfall data on the internet.
4. @Rahmanda will look for other good dataset which is still under the topic of clean water as a backup plan.
5. Everyone needs to also look for the data description, assess the quality of the data, and find what can we analyze from the data. Also look that the data contain time feature.
6. Next meeting we will discuss our findings, and see what is the most feasible action from that.
7. The daily meeting will be adjusted to 4pm everyday.

## 2022-12-15

1. The precipitation data can be retrieved from https://psl.noaa.gov/data/index.html, but the data is huge and still need a lot of work.
2. The nitrate data for Montana, US contains a lot of missing values. We got an alternative from https://opendata-daerani.hub.arcgis.com/datasets/DAERANI::river-water-quality-monitoring-1990-to-2018-nitrate/about, but the region is from Northern Ireland.
3. There are some issues when combining a two dataset:
    - There is no common ID.
    - If the dataset is related to geographical stuff, the latitude and longitude may not match between two datasets.
    - If the dataset have time/date, the time/date may not match between two datasets.
    - If one dataset contain less observation, then the combined dataset may be reduced even further.
4. https://ourworldindata.org has many viz and data, but it is a world data (over time). They also store some of the data in https://github.com/owid.

### Action items:
  - Explore the data from https://ourworldindata.org and see what can we do from it.
  - Share our findings in the group chat.
  - Join the working session tomorrow at 10am.

## 2022-12-16

1. Based on working session consultancy: The prof & assistants expect that we own the project ourselves, and they are aware that it can be challenging especially on finding a good dataset. However, they want to know how we can solve any problem during the project (whether it could be by switching topics, switching datasets, data wrangling etc).
2. We decided to stay on association between rainfall and nitrate concentrations topic.
3. Geojson data which contains coordinates was successfully exported to csv, and we have confirmed that the lattitude and longitude values are valid location in certain region in Northern Ireland.  
    <img src="https://raw.githubusercontent.com/aaryankaushik/Project-Data-Science/main/images/logbook/nitrate-dataset-region.jpeg" width="50%" alt="Nitrate dataset region" />
4. The nitrate data contains missing values and is unbalanced (with respect to multiple measurements). This may be a result of survey problem, measurement error or new sites that don't have past years measurements.
5. Most of the sites have no nitrate measurements before 1999. Maybe we can consider the data from 2000 onwards.  
    <img src="https://raw.githubusercontent.com/aaryankaushik/Project-Data-Science/main/images/logbook/no-nitrate-before-1999.jpeg" width="50%" alt="Missing measurements before 1999" />
6. If we plot the minimum and the maximum values of nitrate from each sites, we can see that most sites are clustered around the low minimum and low maximum values. No site is detected around the high minimum and high maximum values. This can indicate that most sites have a relatively low concentration of nitrate in the river water. Further analysis need to be performed to support this argument.  
    <img src="https://raw.githubusercontent.com/aaryankaushik/Project-Data-Science/main/images/logbook/plot-min-max-nitrate-sites.png" width="50%" alt="Min vs max values of nitrate for each sites plot" />
7. We found a research report https://nora.nerc.ac.uk/id/eprint/501505/1/CR03051N.pdf. The research was about Nitrate concentrations in groundwater in Northern Ireland (published in 2003). We can use this as our reference (but take a note that our dataset is about river water).
8. Even though we expect some pollution in some sites, but preliminary result shows that majority of the sites are safe (the result from report on point 6 also shows the same conclusion).

### Action items:
  - Find a good rainfall data on Northern ireland region and compare the coordinates with the nitrate dataset.
  - Find some reference about nitrate level classification (low/medium/high).

## 2022-12-18

1. Merging rainfall and nitrate dataset can be very difficult because when comparing between longitude and latitude from different dataset, there is a high risk of data disrespancy (whether it could be a different format for each rows, different decimals etc).
2. We found an [open API](https://open-meteo.com/en/docs/historical-weather-api#latitude=54.2784&longitude=-5.8382&start_date=2000-01-01&end_date=2000-12-31&hourly=precipitation) to get rainfall data based on latitude and longitude. The API can still return precipitation from older year (2000 onwards).
3. We are pretty much ready with the nitrate data, but still waiting for the final dataset with the rainfall data before we can actually start doing proper statistical method.
4. We can map the site's coordinates using tableau:  
    <img src="https://raw.githubusercontent.com/aaryankaushik/Project-Data-Science/main/images/logbook/nitrate-study-sites.png" width="50%" alt="Sites coordinates in map" />
5. Top 10 sites that have highest NO3 level (and with the most number of observations) is shown in the plot below (nitrate > 10 mg/L is considered harmful):  
    <img src="https://raw.githubusercontent.com/aaryankaushik/Project-Data-Science/main/images/logbook/top-10-sites-nitrate.png" width="50%" alt="Scatter plot of top 10 sites with highest NO3 level" />
6. Linear mixed model can be used to draw inference about the effect of rainfall to the level of nitrate concentration in the (river) water.
7. Not sure if we can apply machine learning prediction, but maybe we can apply unsupervised machine learning like PCA and clustering.

### Action items:
  - While waiting for rainfall data from @Mohammad, we will also try to use API from point 2.
  - Do some exploratory analysis on nitrate data.

### Note:
  - Tomorrow is deadline for Inference for Statistic and Data Science (@Adina and @Rahmanda)
  - @Aaryan might be not available tomorrow because of a doctor's appointment.

## 2022-12-20

1. @Adina has prepared a template for [our poster](https://docs.google.com/presentation/d/1DBbvO71lOpK6dckjRvlo0KpiOCoGmaVe-7xnXwogEbg/edit?usp=sharing) 🎉.
2. @Aaryan analyzed the possibility of doing a balanced data analysis. Next, we also need to see the distribution of all sites from balanced data in a map so that we can see whether the sites are not clustered in just few areas.
3. The lattitude and longitude data from the nitrate dataset were transformed into X and Y so that it can match with the north and east data from the rainfall dataset. However, there are many observations that do not have a match X and Y coordinates between the data set. We are not sure what happened with the rainfall dataset.
4. The rainfall dataset from open-meteo.com API is [ready](https://github.com/aaryankaushik/Project-Data-Science/tree/main/data/rainfall). Somehow the rainfall data from API doesn't match with our existing rainfall dataset. However, the trend pattern seems similar and has a consistent factor of a multiplier (10?). We also see that the existing rainfall data unit is larger compared to API dataset. 
5. Because of time limitation, we decided to use and trust the rainfall dataset from API. The next (or maybe last) step for merging the data is to match the site and the date from between two datasets.

### Action Items:
  - @Aaryan and @Adina will research about analysis methods (EDA, clustering etc) and gathering some knowledges about spatial analysis.
  - @Rahmanda and @Mohammad will continue merging the data and finish it asap.
