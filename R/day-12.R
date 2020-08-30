# Name: Nate Edgar
# Date: 8/20/20
# Purpose: Exercise 12


#Put in packages:

library(tidyverse)
library(sf)


#Filter to only Oregon & get rid of Puerto Rico, Alaska & Hawaii:

states = USAboundaries::us_states() %>%
filter(!name %in% c("Puerto Rico","Alaska","Hawaii"))

oregon = states %>%
  filter(name=="Oregon")



#Filter to states that touch Oregon using a spatial filter & the correct predicate:

oregon_border = st_filter(states, oregon, .predicate = st_touches)



#Quick Check To See What Plots Will Look Like:

plot(states$geometry)
plot(states$geometry)
plot(oregon_border$geometry, col = "red", add = T)



#Making The Nice Looking Plots:

states_touching_oregon=ggplot(data = oregon_border)+
  geom_sf(data = states) +
  geom_sf(fill="red", alpha = .3) +
  labs(title = "States That Touch Oregon",
     caption = "Based on USAboundaries Package",
     subtitle = "By Nate Edgar")+
    theme_bw()

ggsave(states_touching_oregon,file="img/StatesThatTouchOregon.png")


