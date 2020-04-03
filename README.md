
Curated Archive for COVID-19 Research Challenge Dataset (cord19-cdcs-nist)
==========================================================================

This GitHub repository contains a downloadable snapshot of National Institute of Standards and Technology's [COVID-19 Data Repository](https://covid19-data.nist.gov), curated from the COVID-19 Open Research Dataset ([CORD-19](https://pages.semanticscholar.org/coronavirus-research.)) provided by the [Allen Institute for AI](https://allenai.org).

The COVID-19 Data Repository provides searchable CORD-19 data and metadata, including full-text extracted from the original CORD-19 JavaScript Object Notation (JSON) files. It is built using the [Configurable Data Curation System](https://www.nist.gov/itl/ssd/information-systems-group/configurable-data-curation-system-cdcs/about-cdcs) (CDCS) developed at NIST

## Downloading the Data
The purpose of this repository is to provide a platform-neutral means for bulk downloads of curated COVID-19 data. These downloadable archives are versioned using GitHub Releases, based on the Data Repository's schema and time-stamped archival dates, making programmatic access to the latest data (or, consistent dependency management for reproducibility) much easier for users. 

To download, head over to the [releases page](https://github.com/usnistgov/cord19-cdcs-nist/releases) and select a desired release and zip-archived format, or simply download the latest [JSON](https://github.com/usnistgov/cord19-cdcs-nist/releases/download/latest/JSON.zip), [XML](https://github.com/usnistgov/cord19-cdcs-nist/releases/download/latest/XML.zip), or [CSV](https://github.com/usnistgov/cord19-cdcs-nist/releases/download/latest/CSV.zip) versions at those links directly.  


## Data Packages
To further facilitate rapid interface and reproducible data science work-flows, this repository builds data packages that can directly interface with common statistics languages, usable through separately installable libraries that assemble data and tools for analyzing the CORD-19 data in one, convenient place:

 Language   |   Repository
 ---        |   ---
 Python     |   [cv-py](https://github.com/usnistgov/cv-py)
 
More languages are certainly possible, depending on community need. Data packages can be downloaded directly from this repositories [releases page](https://github.com/usnistgov/cord19-cdcs-nist/releases), or through instructions found at the language-specific repositories above. More information can be found at the readme inside each language-specific `<lang>-interface` folder.

