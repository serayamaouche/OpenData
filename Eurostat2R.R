#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Script File: Eurostat2R.R
# Date of creation: 21 Apr 2017
# Date of last modification: 23 Apr 2017
# Author: Seraya Maouche <seraya.maouche@iscb.org>
# Short Description: This script provides functions to use Eurostat Open Data in R
# This code is based on openFDA description : https://github.com/rOpenHealth/openfda
# Eurostat Data : http://ec.europa.eu/eurostat/data/database
# Eurostat Data on Data.gouv.fr, the French Open Platform for Open Data (https://www.data.gouv.fr)
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# Install Eurostat R Package
install.packages("eurostat")

# Installing a dvelopment version from github
library(devtools)
install_github("ropengov/eurostat")


# Install required packages
reqPackages <- c("xml2","rvest","ggplot2","countrycode","tidyr","dplyr","knitr")
#  Install packages
inst <- match(reqPackages, .packages(all=TRUE))
need <- which(is.na(inst))
if (length(need) > 0) install.packages(reqPackages[need])
  
# Load packages
lapply(reqPackages, require, character.only=T)

# Load eurostat
library(eurostat)

# Obtaining help
# The Eurostat R package is based on the SmarterPoland package (https://cran.r-project.org/web/packages/SmarterPoland/index.html).
knitr::kable(as.data.frame(ls("package:eurostat")))


# Get Eurostat data listing
datasetList <- get_eurostat_toc()

# # Check the first items
library(knitr)
kable(head(datasetList))
|title                                                    |code      |type    |last update of data |last table structure change |data start |data end |values |
|:--------------------------------------------------------|:---------|:-------|:-------------------|:---------------------------|:----------|:--------|:------|
|Database by themes                                       |data      |folder  |NA                  |NA                          |NA         |NA       |NA     |
|General and regional statistics                          |general   |folder  |NA                  |NA                          |NA         |NA       |NA     |
|European and national indicators for short-term analysis |euroind   |folder  |NA                  |NA                          |NA         |NA       |NA     |
|Business and consumer surveys (source: DG ECFIN)         |ei_bcs    |folder  |NA                  |NA                          |NA         |NA       |NA     |
|Consumer surveys (source: DG ECFIN)                      |ei_bcs_cs |folder  |NA                  |NA                          |NA         |NA       |NA     |
|Consumers - monthly data                                 |ei_bsco_m |dataset |30.03.2017          |30.03.2017                  |1980M01    |2017M03  |NA     |

  
# Search Eurostat for Cancer datasets  
kable(head(search_eurostat("cancer")))
|title                                                                                                                   |code           |type    |last update of data |last table structure change |data start |data end |values |
|:-----------------------------------------------------------------------------------------------------------------------|:--------------|:-------|:-------------------|:---------------------------|:----------|:--------|:------|
|Self-reported last colorectal cancer screening test by sex, age and educational attainment level                        |hlth_ehis_pa5e |dataset |20.03.2017          |20.03.2017                  |2014       |2014     |NA     |
|Self-reported last colorectal cancer screening test by sex, age and degree of urbanisation                              |hlth_ehis_pa5u |dataset |21.02.2017          |NA                          |2014       |2014     |NA     |
|Breast cancer and cervical cancer screenings                                                                            |hlth_ps_scre   |dataset |12.01.2017          |07.07.2016                  |2000       |2015     |NA     |
|Self-reported colorectal cancer screening test by sex, age and educational attainment level among people aged 50-74 (%) |hlth_ehis_hc4  |dataset |20.03.2014          |29.08.2013                  |2008       |2008     |NA     |

  
# Downloading data from Eurostat
# Two methods of download are available : the bulk download (the fastest method) facility and the Web Services’ JSON API. The later 
# method has a limitation of maximum 50 sub-indicators at a time
# To download only a small section of the dataset the JSON API is faster and it allows a seletion of data before download. 

# For the original data, see
# http://ec.europa.eu/eurostat/tgm/table.do?tab=table&init=1&plugin=1&language=en&pcode=tsdtr210
id <- search_eurostat("cancer",type = "table")$code[1]
print(id)
  
































