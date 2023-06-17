# chapter 7

install.packages("dataRetrieval")
library(dataRetrieval)
library(tidyverse)
library(lubridate)

#important: note the site number gets input as a character
site <- "03171000"

#Information about the site
siteinfo <- readNWISsite(site)

#What data is available for the site?
#Daily values, mean values

dataAvailable <- whatNWISdata(siteNumber=site, service="dv",
                             statCd = "00003")

View(dataAvailable)
