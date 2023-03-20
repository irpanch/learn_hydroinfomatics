# Chapter 4 ACTIVITY Intro Skills

## 4.1 problem 1

library(tidyverse)
library(lubridate)

pine_nfdr <- read_csv("1_intro_plotting_R/PINE_NFDR_Jan-Mar_2010.csv")

glimpse(pine_nfdr)

ggplot(pine_nfdr, aes(datetime,cfs, color=StationID))+geom_line()


## 4.2 problem 2