# Name: Nate Edgar
# Date: 8/20/20
# Purpose: Exercise 11


#Put in packages

library(tidyverse)
library(sf)


#Filter to only include Santa Barbara & hometown

my_two_cities=readr::read_csv("data/uscities.csv") %>%
st_as_sf(coords=c("lng","lat"),crs=4326) %>%
  filter(state_name=="California") %>%
  filter(city%in%c("Santa Barbara","Pasadena"))


#Using...

st_distance(my_two_cities)



#Using An equal area projection (EPSG: 5070)

st_distance(st_transform(my_two_cities, 5070))



#Using eqidistance projection: '+proj=eqdc +lat_0=40 +lon_0=-96 +lat_1=20 +lat_2=60 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs'
#Save it:
proj_cs='+proj=eqdc +lat_0=40 +lon_0=-96 +lat_1=20 +lat_2=60 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs'

st_distance(st_transform(my_two_cities,'+proj=eqdc +lat_0=40 +lon_0=-96 +lat_1=20 +lat_2=60 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs'))

library(units)

x = st_distance(my_two_cities) %>%
  set_units("km") %>%
  drop_units()

x  + 100


