library(tidycensus)
library(tidyverse)
library(viridis)
library(sf)
library(mapview)

fips<-read.csv('fips.csv')

#enter the access key for census data
census_api_key("**",overwrite = TRUE,install=TRUE)


for (i in 1:51){
 fcode<- sprintf("%02d", fips$fips[i])
l2020 <- get_decennial(geography = "tract", variables = 'P2_008N', year = 2020,
                  state=fcode,geometry = TRUE)
outname<-paste0('b',fcode,'.shp')
st_write(l2020,outname)

}