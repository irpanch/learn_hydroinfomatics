# 1-intro-plotting_R

library(tidyverse)

Pine <- read_csv("1_intro_plotting_R/PINE_Jan-Mar_2010.csv")

SNP <- read_csv("1_intro_plotting_R/PINE_NFDR_Jan-Mar_2010.csv")

RBI <- read_csv("1_intro_plotting_R/Flashy_Dat_Subset.csv")

ggplot(data=Pine, aes(x=datetime, y=cfs))+geom_line()

ggplot(data=Pine, aes(x=datetime, y=cfs))+geom_point(pch=25,color="blue")


# 2.6
ggplot(data=Pine, aes(x=datetime, y=cfs, color=cfs))+
  geom_line()+
  ylab("Debit (cfs)")+
  xlab(element_blank())+
  theme_classic()

# 2.7
ggplot(data=SNP,aes(x=datetime, y=cfs, color=StationID))+
  geom_line()

# 2.8 Facets
ggplot(data=SNP, aes(x=datetime, y=cfs))+
  geom_line()+
  facet_wrap(facets = "StationID", nrow = 2)

# 2.9 Two variable faceting
ggplot(data=SNP, aes(x=datetime, y=cfs))+
  geom_line()+
  facet_grid(StationID ~ month,scales = "free")

# 


             