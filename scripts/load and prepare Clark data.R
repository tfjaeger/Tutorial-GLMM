library(tidyverse)
library(magrittr)
library(R.matlab)

# First let's get the MatLab structure
s = readMat("data/data_ClarkCrowding.mat")

d.fixation = matrix(s$dataCrowding[[1]], nrow=dim(s$dataCrowding[[1]])[3], byrow = T) %>% 
  as.data.frame() %>%
  mutate(
    Subject = 1:10,
    Condition = "Fixation")
d.uncrowded = matrix(s$dataCrowding[[2]], nrow=dim(s$dataCrowding[[2]])[3], byrow = T) %>% 
  as.data.frame() %>%
  mutate(
    Subject = 1:10,
    Condition = "Uncrowded")
d.crowded = matrix(s$dataCrowding[[3]], nrow=dim(s$dataCrowding[[3]])[3], byrow = T) %>% 
  as.data.frame() %>%
  mutate(
    Subject = 1:10,
    Condition = "Crowded")
d = rbind(
  d.fixation,
  d.uncrowded,
  d.crowded)

names(d)[1:6] = dimnames(s$dataCrowding[[1]])[[1]]
d %<>%
  select(Subject, Condition, everything()) %>%
  unnest()

write_csv(d, path = "data/data_ClarkCrowding.csv")



