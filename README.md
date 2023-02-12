# Project-Data-Science
The course takes place @ UHasselt from December 12th until 23rd, 2023.
The goal of this project week is to introduce a real-life challenge.
For this, we take the Data Analysis Competition 2023,  issued by The International Association for Statistical Computing (IASC):
https://iasc-isi.org/2022/10/11/call-of-the-data-analysis-competition-2023/

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
