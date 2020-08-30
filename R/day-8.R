
library(tidyverse)
library(sf)

conus=USAboundaries::us_states() %>%
  filter(!state_name %in% c("Puerto Rico",
                            "Alaska",
                            "Hawaii"))


us_c_ml=st_combine(conus) %>%
  st_cast("MULTILINESTRING")

plot(us_c_ml)




us_u_ml=st_union(conus) %>%
  st_cast("MULTILINESTRING")

plot(us_u_ml)


