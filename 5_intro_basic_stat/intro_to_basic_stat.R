# Chapter 5 Introduction to Basic Statistics

library(tidyverse)
library(patchwork)

theme_set(theme_classic())

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
exhist/expdf # ini error

# ini coba pakai cara lain, karena yang dibuku error.

# install.packages("gridExtra")  #ini pertama aja.           
library("gridExtra")     

grid.arrange(exhist, expdf, nrow = 2)  
