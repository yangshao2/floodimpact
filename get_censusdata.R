#please install libraries before run this script
#install.packages('tidycensus')
#install.packages('sf')

library(tidycensus)
library(tidyverse)
library(viridis)
library(sf)
#library(mapview)

fips<-read.csv('fips.csv')

#Enter the access key for census data;
#A key can be acquired at http://api.census.gov/data/key_signup.html
census_api_key("**",overwrite = TRUE,install=TRUE)


for (i in 1:51){
 fcode<- sprintf("%02d", fips$fips[i])
l2020 <- get_decennial(geography = "tract", variables = 'P2_008N', year = 2020,
                  state=fcode,geometry = TRUE)
outname<-paste0('b',fcode,'.shp')
st_write(l2020,outname)

}