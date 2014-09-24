MONTHS = 01 02 03 04 05 06 07 08 09 10 11 12
AT_MONTHS = jan feb mar apr may jun jul aug sep oct nov dec
all: 06_descriptives.log 07_regressions.log 
01_install_packages.log: code/01_install_packages.do
	stata-se -b do $<
02_download_data.log data/census/trade/12/EXP_COMM.TXT $(foreach month,$(MONTHS),data/census/trade/$(month)/EXP_DETL.TXT) data/agenciatributaria/*.csv data/census/country.txt data/cepii/geo_cepii.dta data/cepii/dist_cepii.dta data/worldbank/ny.gdp.mktp.cd.dta data/worldbank/ny.gdp.pcap.cd.dta data/worldbank/doingbusiness/trading_across_borders_2009.dta data/bergstrand/EIA2013.xlsx data/eurostat/ert_bil_eur_m.tsv data/eurostat/CN_BEC_2009.xls data/unsd/hs2bec.xls: code/02_download_data.do 
	stata-se -b do $<
	# make sure downloaded files have current date
	touch $@
03_create_country_variables.log data/derived/merged_importer_data.dta data/census/country_list.dta: code/03_create_country_variables.do data/own/country_list.csv data/census/country.txt data/cepii/geo_cepii.dta data/cepii/dist_cepii.dta data/wikipedia/island.csv data/worldbank/ny.gdp.mktp.cd.dta data/worldbank/ny.gdp.pcap.cd.dta data/worldbank/doingbusiness/trading_across_borders_2009.dta data/bergstrand/EIA2013.xlsx 
	stata-se -b do $<
04_read_us_trade.log data/derived/usa_export_2009_with_gravity.dta: code/04_read_us_trade.do data/census/trade/12/EXP_COMM.TXT $(foreach month,$(MONTHS),data/census/trade/$(month)/EXP_DETL.TXT) data/unsd/hs2bec.xls data/census/country_list.dta  data/derived/merged_importer_data.dta
	stata-se -b do $<
05_read_spanish_trade.log data/derived/spain_export_2009_with_gravity.dta: code/05_read_spanish_trade.do $(foreach month,$(AT_MONTHS),data/agenciatributaria/$(month).csv) data/eurostat/ert_bil_eur_m.tsv data/eurostat/CN_BEC_2009.xls data/census/country_list.dta data/derived/merged_importer_data.dta  
	stata-se -b do $<
06_descriptives.log: code/06_descriptives.do data/worldbank/doingbusiness/trading_across_borders_2009.dta
	stata-se -b do $<
07_regressions.log: code/07_regressions.do data/derived/usa_export_2009_with_gravity.dta data/derived/spain_export_2009_with_gravity.dta
	stata-se -b do $<
