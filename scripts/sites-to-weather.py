#!/usr/bin/env python

import os
from math import isnan
from datetime import datetime
from meteostat import Point, Daily
from pandas import read_csv

os.chdir(os.getcwd() + '/data')

start = datetime(2019, 12, 31)
end = datetime(2019, 12, 31)

df = read_csv('ll-100.csv')

with open('weather-data.csv', 'w') as data_file:
  for _, row in df.iterrows():
    point = Point(row['lon'], row['lat'])
    data = Daily(point, start, end)
    data = data.fetch()

    for dd_date, dd in data.iterrows():
      values = ['' if isnan(value) else str(value) for value in dd.values.tolist()]
      values = [str(dd_date.date())] + values
      data_file.write(','.join(values) + '\n')
