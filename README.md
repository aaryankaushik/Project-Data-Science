# Project-Data-Science

## Prequisite

We uses [anaconda](https://www.anaconda.com/products/distribution) to manage development environment. Please install it first and then proceed to the next step.

## Setup

Clone the repository and activate the conda env like below.

```
$ git clone git@gitlab.com:aaryankaushik/Project-Data-Science.git`
$ cd Project-Data-Science
$ conda env create -f environment.yml
$ conda activate ds-project
```

It should install all necessary dependencies and you should be ready to code!

# Scripts

- To export geojson to csv, cd to this repo directory and run:
    ```
    python scripts/convert-geojson-to-csv.py
    ```
