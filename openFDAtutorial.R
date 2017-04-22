
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Script File: openFDAtutorial.R
# Date of creation: 22 Apr 2017
# Date of last modification: 22 Apr 2017
# Author: Seraya Maouche <seraya.maouche@iscb.org>
# Short Description: This script provides functions to access OpenFDA API from R
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# OpenFDA has not yet been added to CRAN

# Install the lastest version of openFDA using devtools::install_github()
install.packages("devtools")
library(devtools)
devtools::install_github("ropenhealth/openfda")

# Load openfda
library("openfda")

# Queries generally have the following format
# fda_query(endpoint) %>%
#   fda_filter(field, value) %>%
#   fda_count(field) OR fda_search() %>%
#   fda_exec()

patient_ages = fda_query("/drug/event.json") %>%
               fda_count("patient.patientonsetage") %>%
               fda_exec()
> Fetching: https://api.fda.gov/drug/event.json?search=&count=patient.patientonsetage 
head(patient_ages)
  term count
1   60 76181
2   65 70109
3   55 68470
4   62 68195
5   58 67417
6   63 66664
names(patient_ages)



