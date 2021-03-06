
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Script File: openFDAtutorial.R
# Date of creation: 22 Apr 2017
# Date of last modification: 22 Apr 2017
# Author: Seraya Maouche <seraya.maouche@iscb.org>
# Short Description: This script provides functions to access OpenFDA API from R
# This code is based on openFDA description : https://github.com/rOpenHealth/openfda
# OpenFDA : https://open.fda.gov
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# OpenFDA has not yet been added to CRAN

# Install the lastest version of openFDA using devtools::install_github()
install.packages("devtools")
library(devtools)
devtools::install_github("ropenhealth/openfda")

# Load openfda
library("openfda")

# Obtaining help
? fda_exec
# chain_query :	Pipe operator for chaining together operations.
# copy_query:	Make a copy of query (keeps the class).
# extract_field:	Fetch a (nested field) from a list or dataframe.
# fda_api_key:	Attach an API key to the query.
# fda_count:	Count results from a given field.
# fda_debug:	Turn off/on API debugging.
# fda_exec:	Execute a query.
# fda_fetch:	Fetch the given URL as JSON.
# fda_filter:	Apply a filter to a query
# fda_limit:	Set the number of results desired by this query.
# fda_plot:	Plot a count query.
# fda_query:	Create a new query.
# fda_search:	Fetch search results.
# fda_skip:	Set the number of records to skip that match the search parameter.
# fda_url:	Return the URL that will be fetched for the current query.


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

# Plot the patient ages it with ggplot2
library("ggplot2")
qplot(x=term, y=count, data=patient_ages)

# Filter the results to count on using the fda_filter() method
paxil_ages = fda_query("/drug/event.json") %>%
  fda_filter("patient.drug.openfda.generic_name", "paroxetine") %>%
  fda_count("patient.patientonsetage") %>%
  fda_exec()

> Fetching: https://api.fda.gov/drug/event.json?search=patient.drug.openfda.generic_name:paroxetine&count=patient.patientonsetage

# Using the openFDA API with your API key using the function fda_api_key()
patient_ages = fda_query("/drug/event.json") %>%
  fda_api_key("my_FDAapi_key") %>%
  fda_count("patient.patientonsetage") %>%
  fda_exec()

age_query = fda_query("/drug/event.json") %>%
  fda_api_key("MYKEY") %>%
  fda_count("patient.patientonsetage");

paxil_ages = age_query %>% fda_filter("patient.drug.openfda.generic_name", "paroxetine") %>% fda_exec()
zoloft_ages = age_query %>% fda_filter("patient.drug.openfda.generic_name", "sertraline") %>% fda_exec()



