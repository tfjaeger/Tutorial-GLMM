library(tidyverse)
library(magrittr)
library(R.matlab)

# First let's get the MatLab structure
s = readMat("data/data_ClarkCrowding_TrialLevel.mat")

s <- s[[1]]
d = tibble(.rows = dim(s)[3])
for (j in unlist(dimnames(s)[1])) {
    print(paste(j))
    d %<>%
      mutate(!! sym(j) := s[j,,])
}
  
d %<>%
  rowwise() %>%
  mutate(
    across(
      .cols = !contains("traces"),
      .fns = ~ .x[[1]]))

save(d, file = "data/data_ClarkCrowding_TrialLevel.RData", compress = T)
write_csv(d %>%
            select(-contains("traces")), 
          path = "data/data_ClarkCrowding_TrialLevel.csv")
