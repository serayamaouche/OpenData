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

# Load openfda
library("eurostat")

# Installing a dvelopment version from github
library(devtools)
install_github("ropengov/eurostat")


# Obtaining help
# The Eurostat R package is based on the SmarterPoland package (https://cran.r-project.org/web/packages/SmarterPoland/index.html).
