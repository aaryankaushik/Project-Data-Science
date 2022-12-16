#!/usr/bin/env python

import os
import json

os.chdir(os.getcwd() + '/data')

geojson_file = open('nitrate-nothern-ireland-1990-2018.geojson')
geojson = json.load(geojson_file)

features = ['OBJECTID', 'Site_Code', 'Site_Status_21Oct2020', 'Station_Name',
            'Primary_Basin', 'X', 'Y', 'Date', 'Time2', 'Depth', 'NO3_N_MGL']

features_with_location = features + ['lattitude', 'longitude']

with open('converted-geojson-data.csv', 'w') as data_file:
  data_file.write(','.join(features_with_location) + '\n')

  for record in geojson['features']:
    values = []

    for feature in features:
      values.append(record['properties'][feature])

    values.extend(record['geometry']['coordinates'])

    values = [str(value) for value in values]

    data_file.write(','.join(values) + '\n')

geojson_file.close()