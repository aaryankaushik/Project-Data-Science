#!/usr/bin/env python

import os
import json
import csv

os.chdir(os.getcwd() + '/data')

geo_filename = 'nitrate-nothern-ireland-1990-2018.geojson'
csv_filename = 'converted_geojson.csv'

def feature_to_row(feature, header):
  l = []
  for k in header:
    l.append(feature['properties'][k])
  coords = feature['geometry']['coordinates']
  assert (len(coords) == 2)
  l.extend(coords)
  return l

with open(geo_filename, 'r') as geo_file:
  with open(csv_filename, 'w', newline='') as csv_file:
    geojson_data = json.load(geo_file)
    features = geojson_data['features']

    csv_writer = csv.writer(csv_file)

    is_header = True
    header = []

    for feature in features:
      if is_header:
        is_header = False
        header = list(feature['properties'].keys())
        header.extend(['longitude','latitude'])
        csv_writer.writerow(header)

      csv_writer.writerow(feature_to_row(feature, feature['properties'].keys()))

