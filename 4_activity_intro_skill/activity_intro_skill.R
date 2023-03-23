# Chapter 4 ACTIVITY Intro Skills

## 4.1 problem 1

library(tidyverse)
library(lubridate)

pine_nfdr <- read_csv("1_intro_plotting_R/PINE_NFDR_Jan-Mar_2010.csv")

glimpse(pine_nfdr)

ggplot(pine_nfdr, aes(datetime,cfs, color=StationID))+geom_line()


## 4.2 problem 2

# Make a boxplot to compare the discharge of Pine to NFDR for February 2010.

# Hint: use the pipe operator and the filter() function.

# Hint2: when you filter dates, you have to let R know you’re giving it a date. 
# You can do this by using the mdy() function from lubridate.

### cara manual
feb2010_data <- filter(pine_nfdr,year==2010 & month==2)
ggplot(feb2010_data,aes(x=StationID,y=cfs))+stat_boxplot()

### cara pipe
pine_nfdr %>% 
  filter(year==2010,month==2) %>% 
  ggplot(.,aes(StationID,cfs))+ 
  stat_boxplot()+scale_y_log10()
