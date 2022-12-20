#!/usr/bin/env python

import os
import time
from urllib import request, parse
import json
from pandas import read_csv

os.chdir(os.getcwd() + '/data')

df = read_csv('nitrate-site-ll-w-date.csv')

headers = ['Site_Code', 'date', 'rain_sum', 'latitude', 'longitude']

# Note: Batch is needed, but right now we do it manually
# To do batch, please read the last batch info below and start from there
# Caution: Don't merge all batch data into a single file, because it will get extremely large very quickly

with open('rainfall-data.csv', 'w') as data_file:
  data_file.write(','.join(headers) + '\n')

  # Last batch: 800:890
  # Next batch: None
  # Total rows: 890
  for _, row in df.iloc[800:].iterrows():
    base_url = 'https://archive-api.open-meteo.com/v1/era5?'
    url_params = {
      'latitude': row['longitude'],
      'longitude': row['latitude'],
      'start_date': row['first_date'],
      'end_date': row['last_date'],
      'daily': 'rain_sum',
      'timezone': 'UTC'
    }
    url = base_url + parse.urlencode(url_params)

    print(f"request rainfall data for {row['Site_Code']} - {row['first_date']}-{row['last_date']}")
    with request.urlopen(url) as payload:
      data = json.load(payload)
      for index, rain_sum in enumerate(data['daily']['rain_sum']):
        date = data['daily']['time'][index]
        values = [row['Site_Code'], date, rain_sum, row['longitude'], row['latitude']]
        values = [str(value) for value in values]
        data_file.write(','.join(values) + '\n')
