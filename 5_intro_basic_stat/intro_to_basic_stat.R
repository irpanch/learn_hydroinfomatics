# Chapter 5 Introduction to Basic Statistics

library(tidyverse)
library(patchwork)

theme_set(theme_classic())

# some question

## what is difference between sample and population
### sample is part of population.
### population is the thing we want to calculate, sample is data 
### measured in population. sample is subset of population


## how do we look at the distribution of data in sample?
### 
###
###
###




#generate a normal distribution
ExNorm <- rnorm(1000, mean = 5) %>% 
  as_tibble()

#look at distributions
#histogram
ExNorm %>%
  ggplot(aes(value)) +
  geom_histogram()

#pdf
ExNorm %>%
  ggplot(aes(value)) +
  stat_density()


par(mfrow=c(1,2))
#histogram
exhist <- ExNorm %>%
  ggplot(aes(value)) +
  geom_histogram()

#pdf
expdf <- ExNorm %>%
  ggplot(aes(value)) +
  stat_density()

#put the plots side by side with + or on top of each other with /
exhist/expdf

# create a population of calcium concentrate
all_the_water <- rnorm(10000, mean=6) %>% as_tibble()

sample_of_water <- sample(all_the_water$value, size = 100,
                          replace = FALSE) %>% as_tibble()

population_hist <- all_the_water %>% 
  ggplot(aes(value))+
  geom_histogram()+
  ggtitle("Population: All the water in the lake")

sample_hist <- sample_of_water %>% 
  ggplot(aes(value))+
  geom_histogram()+
  ggtitle("Your sample of the lake")

population_hist+sample_hist 

# measure central tendency
## goals: finding the middle value (mean, meadian, weighted mean),
## is it skew or not?
## how variable is it

pineQ <- read_csv("1_intro_plotting_R/PINE_Jan-Mar_2010.csv")

# calculate mean and median cfs in pineQ and values in ExNorm
pineMean <- mean(pineQ$cfs)
pineMedian <- median(pineQ$cfs)

xmean <- mean(ExNorm$value)
xmedian <- mean(ExNorm$value)

# plot mean and median
Ex <- ExNorm %>% ggplot(aes(value))+
  geom_histogram()+
  geom_vline(xintercept = xmean,color="red")+
  geom_vline(xintercept = xmedian,color="blue") # mean&median same because normal dist.

PineP <- pineQ %>% ggplot(aes(cfs))+
  geom_histogram()+
  geom_vline(xintercept = pineMean,color="red")+
  geom_vline(xintercept = pineMedian,color="blue")


Ex / PineP



