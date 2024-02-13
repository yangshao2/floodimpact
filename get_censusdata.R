#please install libraries before run this script
#install.packages('tidycensus')
#install.packages('sf')

library(tidycensus)
library(tidyverse)
library(viridis)
library(sf)
#library(mapview)

fips<-read.csv('https://github.com/yangshao2/floodimpact/raw/main/fips.csv')

#Enter the access key for census data, replace **
#A key can be acquired at http://api.census.gov/data/key_signup.html
census_api_key("**",overwrite = TRUE,install=TRUE)

#P1_001N !!Total Population
#P2_002N    Hispanic
#P2_005N    !!Total:!!Not Hispanic or Latino:!!Population of one race:!!White alone
#P2_006N   !!Total:!!Not Hispanic or Latino:!!Population of one race:!!Black or African American
#P2_008N !!Total:!!Not Hispanic or Latino:!!Population of one race:!!Asian alone


for (i in 1:nrow(fips)){
 fcode<- sprintf("%02d", fips$fips[i])
l2020 <- get_decennial(geography = "tract", variables = 'P1_001N', year = 2020,
                  state=fcode,geometry = TRUE)
outname<-paste0('b',fcode,'.shp')
st_write(l2020,outname)

}