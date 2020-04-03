# Python Interface for NIST-Curated CDCS Data

This folder defines a python package containing a versioned, read-optimized archive of the CORD-19 data. This is designed to be used as a foundation for the `CovidData` object in the separate [cv-py](https://github.com/usnistgov/cv-py) library. 

This is not meant to be used directly, but rather as a template for the build-process that generates release files for the repository as a whole. It is structured as follows:

- `cord19_cdcs`: python project managed using [poetry](https://python-poetry.org/), which gets built into a tarball and downloaded/used as a data package by `cv-py`. 
- `build_scripts`: helper files that expose scripts to the overall build process, made to interface properly with the poetry pyenv's by making use of [taskipy](https://github.com/illBeRoy/taskipy)  
    - `data_tf`: uses [dask](https://dask.org/) to scalably transform cached JSON to read-optimized Parquet format, which gets used by `cv-py`. 