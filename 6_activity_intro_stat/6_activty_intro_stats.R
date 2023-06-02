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

## 6.3 Problem 3
### perform saphiro-wilk test. is the data normal distribution?

shapiro.test(flashy_data$PPTAVG_BASIN)

### because p-value is larger than 0.05, then the data is in normal dist.
qqnorm(flashy_data$PPTAVG_BASIN)
qqline(flashy_data$PPTAVG_BASIN)


## 6.4 Problem 4
### plotting Pine and NFDR data. two pdf in the same plot. log the x axis.

pineMean <- mean(pineQ$cfs)
pineMedian <- median(pineQ$cfs)
pineN_mean <- mean(pine_nfdr$cfs)
pineN_median <- median(pine_nfdr$cfs)

PineP <- pineQ %>% ggplot(aes(cfs))+
  geom_histogram()+
  geom_vline(xintercept = pineMean,color="red")+
  geom_vline(xintercept = pineMedian,color="blue") +
  scale_x_continuous(trans='log10') +
  ggtitle("Discharge at PineQ Station") +
  theme(plot.title = element_text(hjust = 0.5))

PineN <- pine_nfdr %>% ggplot(aes(cfs))+
  geom_histogram()+
  geom_vline(xintercept = pineN_mean,color="red")+
  geom_vline(xintercept = pineN_median,color="blue")+
  scale_x_continuous(trans='log10')+
  ggtitle("Discharge at Pine NFDR Station") +
  theme(plot.title = element_text(hjust = 0.5))

PineP / PineN

## add some mean and median text
PineP_2 <- PineP + geom_text(aes(pineMean,400,label=pineMean, hjust=-0.2, vjust=0))+
  geom_text(aes(pineMedian,400,label=pineMedian, hjust=-0.2, vjust=0))

PineN_2 <- PineN + geom_text(aes(pineN_mean,400,label=pineN_mean, hjust=-0.1, vjust=0))+
  geom_text(aes(pineN_median,400,label=pineN_median, hjust=1, vjust=0))

PineP_2 / PineN_2


## 6.5 Problem 5
### measure the variable 

### variance and standard deviation. sensitive to outliers.
var(pineQ$cfs)
var(pine_nfdr$cfs)

sd(pineQ$cfs)
sd(pine_nfdr$cfs)

### coefficient of variance
sd(pineQ$cfs)/mean(pineQ$cfs)
sd(pine_nfdr$cfs)/mean(pine_nfdr$cfs)

### IQR. resistance to outlier
IQR(pineQ$cfs)
IQR(pine_nfdr$cfs)

## 6.6 Problem 6
### compute 3 measure of spread and 2 measure of central tendency
### sd, cv and IQR. mean and median

pine_nfdr %>% group_by(StationID) %>% 
  summarize(max_cfs=max(cfs),
            mean_cfs=mean(cfs),
            median_cfs=median(cfs),
            var_cfs=var(cfs),
            sd_cfs=sd(cfs),
            IQR_cfs=IQR(cfs))
### The Pine watershed has more flow (bigger in maximum) also more variable 
### discharge, we can see it on variance, standard deviation, and IQR is 
### more bigger than NFDR watershed