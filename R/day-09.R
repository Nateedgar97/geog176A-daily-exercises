install.packages("sf")
install.packages("stars")
install.packages("units")
install.packages("raster")
install.packages("mapview")
install.packages("leaflet")
install.packages("gdalUtilities")

install.packages("whitebox", repos="http://R-Forge.R-project.org")

remotes::install_github("ropensci/getlandsat")
remotes::install_github("ropensci/USAboundaries")
remotes::install_github("ropensci/USAboundariesData")
remotes::install_github("ropenscilabs/rnaturalearthdata")

library(sf)

sf::sf_extSoftVersion()



