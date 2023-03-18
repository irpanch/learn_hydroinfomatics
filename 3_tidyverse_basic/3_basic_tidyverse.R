water_pH <- 5.4
water_pH

seq(from=1, to=10, by=1)
seq(10,1)

library(tidyverse)
rbi <- read_csv("1_intro_plotting_R/Flashy_Dat_Subset.csv")
View(rbi)

head(rbi)

rbi_NT <- read.csv("1_intro_plotting_R/Flashy_Dat_Subset.csv")
head(rbi_NT)

# 3.8 filter
filter(rbi,STATE=="ME")

filter(rbi,STATE=="ME" & RBI >0.25)

# 3.9 arrange
arrange(rbi,desc(RBI))

# 3.10 select
select(rbi,STANAME,STATE,RBI)

select(rbi,site_no:DRAIN_SQKM) #kolom sampai kolom yang mana

# 3.11 Mutate

mutate(rbi, T_RANGE = T_MAX_SITE - T_MIN_SITE) #harus ada spasi setelah koma

mutate(rbi,site_no=as.character(site_no))

# 3.12 summarize

summarize(rbi,meanrbi = mean(RBI), maxrbi = max(RBI), minrbi=min(RBI))

rbistate <- group_by(rbi, STATE)
summarize(rbistate, meanrbi = mean(RBI), maxrbi = max(RBI), minrbi=min(RBI))

# 3.13 pipe
rbi %>% 
  group_by(STATE) %>% 
  summarize(meanrbi=mean(RBI), maxrbi = max(RBI), minrbi=min(RBI))

# 3.15 NAs
x <- c(1,2,3,4,NA)
mean(x,na.rm = T)
