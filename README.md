Replication data and programs for “Per-Shipment Costs and the Lumpiness of International Trade”
===============================================================================================
by Cecília Hornok and Miklós Koren
----------------------------------

This file describes the program and data files for replicating the descriptive statistics and the estimation results in the paper 
> [Hornok, Cecília and Miklós Koren. “Per-Shipment Costs and the Lumpiness of International Trade,” Review of Economics and Statistics, *forthcoming*](http://miklos.koren.hu/papers/peer_reviewed_publications/administrative_barriers_to_trade/).

Please cite the above paper when using these programs.

Use the repository browser above to preview and download individual files, or [download the entire folder](https://github.com/korenmiklos/per-shipment-costs-replication/archive/v1.0.1.zip) as a single ZIP-file (588MB). If you have git, use 
```
git clone https://github.com/korenmiklos/per-shipment-costs-replication.git
cd per-shipment-costs-replication
make
```

Code
----
All programs are under folder `code/`. The following Stata do-files need to be run in sequence to replicate our results. The do-files have been tested on Stata 13.0 and should work across a variety of platforms with the exception of `02_dowload_data.do`, which expects a Unix-like environment, such as Unix, Linux or Mac OS X. We have also included a makefile, so, in a Unix-like environment, you can just run `make` from the shell.

- `01_install_packages.do` Installs the necessary Stata packages. As with all other .do files, this should be run from the main replication folder as `do code/01_install_packages.do`
- `02_download_data.do` Downloads all data from the available internet resources and saves them to the folder `data/`. This script uses a Unix shell, so requires Unix, Linux or Mac OS X. If you are running Windows, check how to use zip and gzip from the command line. We have saved the output of this script in `data/` for your convenience, so you can skip the downloads.
- `03_create_country_variables.do` Converts the various datasets into Stata format and merges them. The output is `data/derived/merged_importer_data.dta`.
- `04_read_us_trade.do` Reads data from the monthly trade statistics published by the U.S. Census Bureau, merges with importer-country variables and reports shipment-level statistics. The output is `data/derived/usa_export_2009_with_gravity.dta`.
- `05_read_spanish_trade.do` Reads data from the shipment-level trade statistics published by the Agencia Tributaria, merges with importer-country variables and reports shipment-level statistics. The output is `data/derived/spain_export_2009_with_gravity.dta`.
- `06_descriptives.do` Creates Table 1 in paper and correlation statistics for the Doing Business indicators.
- `07_regressions.do` Runs the estimations creating Tables 3-7. Output is `exhibit/table*.xls`.

Data
----
All data are under folder data. Subfolders indicate the data sources.
- `census/trade/*/*.txt`. We use the U.S. Foreign Trade Statistics reported by the Census Bureau for year 2009 on the most detailed level. The .txt files are copied from the DVDs. Please see https://www.census.gov/foreign-trade/reference/products/catalog/fl_exp.txt for a codebook.
- `agenciatributaria/*.csv`. The twelve files contain the shipment-level export data of Spain in 2009 by month. These data are reported by the Spanish Tax Authority (Agencia Tributaria) and are publicly available under http://www.agenciatributaria.es/. Please see http://www.agenciatributaria.es/static_files/AEAT/Aduanas/Contenidos_Privados/Estadisticas_Comercio_Exterior/comercio_exterior/datos_mensuales_maxima_desagregacion/diseno226.pdf  for a codebook.
- `eurostat/ert_bil_eur_m.tsv`. Monthly averages of the bilateral exchange rate of US$ to the euro in 2009. Source is Eurostat. (downloaded on 8 September 2014) http://epp.eurostat.ec.europa.eu/portal/page/portal/exchange_rates/data/database
- `eurostat/CN_BEC_2009.xls`. Conversion code from CN8 to BEC product classification. (downloaded on 26 August 2014) http://ec.europa.eu/eurostat/ramon/other_documents/combined%20nomenclature/conversion_tables/cn_bec_8809.zip
- `unsd/hs2bec.xls`. Conversion code from HS6 to BEC product classification. We use the correspondence table on the “HS2007 - BEC correlation”. (downloaded on 26 August 2014) http://unstats.un.org/unsd/trade/conversions/HS2007-BEC4%20Correlation%20and%20conversionTable.xls
- `worldbank/doingbusiness/*.html`. The indicators by procedure are downloadable only on a country-by-country case from http://www.doingbusiness.org/data. The 2009 survey data is from the Doing Business report published in 2010. Since the detailed indicators are not published in the dataset, we used web.archive.org to download the historical data (downloaded on 8 September 2014).
- `worldbank/ny.gdp.mktp.cd.dta` and `ny.gdp.pcap.cd.dta`. GDP and GDP per capita (both in current US$) in 2009 are sourced from the World Development Indicators database of the World Bank. We used the Stata command wbopendata, which relies on the World Bank Data API.
- `wikipedia/island.csv`. Island dummy variable based on: http://en.wikipedia.org/wiki/List_of_island_countries (accessed on 18 January 2014)
- `bergstrand/EIA2013.xlsx`. Economic integration agreements database on Jeffrey Bergstrand’s homepage. We renamed the file “Current Working Document May 31 2013” for convenience to `EIA2013.xlsx`. (downloaded on 18 January 2014) http://www3.nd.edu/~jbergstr/DataEIAsMay2013/EIADatabaseMay2013.zip
- `own/country_list.csv`. List of the 172 destination countries in the U.S. estimation sample. Combines the country codes used in `bergstrand/EIA2013.xlsx`, `worldbank/doingbusiness/` and all other datasets.
- `cepii/geo_cepii.dta` and `cepii/dist_cepii.dta` are the distance data from CEPII. Please cite the original data as: Mayer, T. & Zignago, S. (2011) Notes on CEPII’s distances measures : the GeoDist Database CEPIIWorking Paper 2011-25 - See more at: http://www.cepii.fr/CEPII/en/bdd_modele/presentation.asp?id=6#sthash.ADIwQtB6.dpuf

Exhibits
--------
The `exhibits/` folder contains .txt and .xls files with Tables 3-7. These tables have been formatted for the paper. Please note that minor changes in some of the internet resources and rounding might cause small numerical discrepancies relative to the published tables. None of these discrepancies is substantial.

Internet resources
------------------
Trade agreements entering into force between 2005 and 2009. The EIA data is only up to 2005. We adjust to the 2009 situation based on information from the following internet sources:
http://www.ustr.gov/trade-agreements/free-trade-agreements
http://wits.worldbank.org/gptad/library.aspx#
http://www.fas.org/sgp/crs/row/R41143.pdf
