# chapter 6 Activity Intro Stats 

## 6.1 Problem 1
### Load the tidyverse and patchwork libraries and 
### read in the Flashy and Pine datasets.

library(tidyverse)
library(patchwork)

theme_set(theme_classic())

pineQ <- read_csv("1_intro_plotting_R/PINE_Jan-Mar_2010.csv")
flashy_data <- read_csv("1_intro_plotting_R/Flashy_Dat_Subset.csv")

## 6.2 Problem 2
### using flashy, make pdf of average basin rainfall (PPTAVG_BASIN)
### for the NorthEast AGGECOREGION
### add an vertical line for: mean, median, std deviation, IQR
### make it in different color and custom label

flashy_mean <- mean(flashy_data$PPTAVG_BASIN)
flashy_median <- median(flashy_data$PPTAVG_BASIN)
flashy_std_dev <- sd(flashy_data$PPTAVG_BASIN)
flashy_IQR <- IQR(flashy_data$PPTAVG_BASIN)

flashy_pdf <- flashy_data %>% 
  filter(AGGECOREGION=="NorthEast") %>% 
  ggplot(aes(PPTAVG_BASIN)) + stat_density() +
  geom_vline(xintercept = flashy_mean,color="red") +
  geom_vline(xintercept = flashy_median,color="blue") +
  geom_vline(xintercept = flashy_std_dev,color="green") +
  geom_vline(xintercept = flashy_IQR,color="yellow")

flashy_pdf + geom_text(aes(flashy_mean,.025,label=flashy_mean, hjust=-1)) +
  geom_text(aes(flashy_median,.025,label=flashy_median, hjust=-1, vjust=-1)) +
  geom_text(aes(flashy_std_dev,.025,label=flashy_std_dev, hjust=0, vjust=0)) +
  geom_text(aes(flashy_IQR,.025,label=flashy_IQR, hjust=0, vjust=2))
