# Logbook

Group members:
1. Aaryan Kaushik
2. Adina Asim
3. Mohammad Sazegar
4. Rahmanda Wibowo

## 2022-12-14

- We will focus on the topic about the association between rainfall and nitrate level in US region (Montana or Misissippi because those are agricultural regions). High nitrate level in water can be dangerous for drinking water and threatens ecosystem in water.
- @Adina and @Aaryan will look for water data here https://www.waterqualitydata.us/.
- @Mohammad will look for rainfall data on the internet.
- @Rahmanda will look for other good dataset which is still under the topic of clean water as a backup plan.
- Everyone needs to also look for the data description, assess the quality of the data, and find what can we analyze from the data. Also look that the data contain time feature.
- Next meeting we will discuss our findings, and see what is the most feasible action from that.
- The daily meeting will be adjusted to 4pm everyday.

## 2022-12-15

- The precipitation data can be retrieved from https://psl.noaa.gov/data/index.html, but the data is huge and still need a lot of work.
- The nitrate data for Montana, US contains a lot of missing values. We got an alternative from https://opendata-daerani.hub.arcgis.com/datasets/DAERANI::river-water-quality-monitoring-1990-to-2018-nitrate/about, but the region is from Northern Ireland.
- There are some issues when combining a two dataset:
  1. There is no common ID.
  2. If the dataset is related to geographical stuff, the latitude and longitude may not match between two datasets.
  3. If the dataset have time/date, the time/date may not match between two datasets.
  4. If one dataset contain less observation, then the combined dataset may be reduced even further.
- https://ourworldindata.org has many viz and data, but it is a world data (over time). They also store some of the data in https://github.com/owid.

### Action items:
  - Explore the data from https://ourworldindata.org and see what can we do from it.
  - Share our findings in the group chat.
  - Join the working session tomorrow at 10am.

## 2022-12-16

- Based on working session consultancy: The prof & assistants expect that we own the project ourselves, and they are aware that it can be challenging especially on finding a good dataset. However, they want to know how we can solve any problem during the project (whether it could be by switching topics, switching datasets, data wrangling etc).
- We decided to stay on association between rainfall and nitrate concentrations topic.
- Geojson data which contains coordinates was successfully exported to csv, and we have confirmed that the lattitude and longitude values are valid location in certain region in Northern Ireland.
<img src="https://raw.githubusercontent.com/aaryankaushik/Project-Data-Science/main/images/logbook/nitrate-dataset-region.jpeg" width="50%" alt="Nitrate dataset region" />

- The nitrate data contains missing values and is unbalanced (with respect to multiple measurements). This may be a result of survey problem, measurement error or new sites that don't have past years measurements.
- Most of the sites have no nitrate measurements before 1999.
<img src="https://raw.githubusercontent.com/aaryankaushik/Project-Data-Science/main/images/logbook/no-nitrate-before-1999.jpeg" width="50%" alt="Missing measurements before 1999" />

- If we plot the minimum and the maximum values of nitrate from each sites, we can see that most sites are clustered around the low minimum and low maximum values. No site is detected around the high minimum and high maximum values. This can indicate that most sites have a relatively low concentration of nitrate in the river water. Further analysis need to be performed to support this argument.
<img src="https://raw.githubusercontent.com/aaryankaushik/Project-Data-Science/main/images/logbook/plot-min-max-nitrate-sites.png" width="50%" alt="Min vs max values of nitrate for each sites plot" />

- We found a research report https://nora.nerc.ac.uk/id/eprint/501505/1/CR03051N.pdf. The research was about Nitrate concentrations in groundwater in Northern Ireland (published in 2003). We can use this as our reference (but take a note that our dataset is about river water).
- Even though we expect some pollution in some sites, but preliminary result shows that majority of the sites are safe (the result from report on point 5 also shows the same conclusion).

### Action items:
  - Find a good rainfall data on Northern ireland region and compare the coordinates with the nitrate dataset.
  - Find some reference about nitrate level classification (low/medium/high).
