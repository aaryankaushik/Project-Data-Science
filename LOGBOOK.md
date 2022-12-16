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
4. The nitrate data contains missing values and is unbalanced (with respect to multiple measurements). This may be a result of survey problem, measurement error or new sites that don't have past years measurements.
5. Most of the sites have no nitrate measurements before 1999.
6. We found a research report https://nora.nerc.ac.uk/id/eprint/501505/1/CR03051N.pdf. The research was about Nitrate concentrations in groundwater in Northern Ireland (published in 2003). We can use this as our reference (but take a note that our dataset is about river water).
7. Even though we expect some pollution in some sites, but preliminary result shows that majority of the sites are safe (the result from report on point 5 also shows the same conclusion).

### Action items:
  - Find a good rainfall data on Northern ireland region and compare the coordinates with the nitrate dataset.
  - Find some reference about nitrate level classification (low/medium/high).