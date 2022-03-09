library(caladaptr)
library(dplyr)
library(units)
library(raster)
library(sf)
library(tmap)

sac_tasmax_projected <- ca_loc_aoipreset(type="counties") %>%     ## specify a location
  ca_gcm(c("HadGEM2-ES", "CNRM-CM5", "CanESM2","MIROC5",            ## select GCM(s)
           "ACCESS1-0", "CCSM4", "CESM1-BGC", 
           "CMCC-CMS", "GFDL-CM3", "HadGEM2-CC")) %>%     
  ca_scenario(c("rcp45")) %>%                               ## select emission scenarios(s)
  ca_cvar(c("tasmax")) %>%                                          ## select climate variables
  ca_period("year") %>%                                             ## select a temporal aggregation period
  ca_years(start = 2006, end = 2070)                                ## select start and end dates

sac_tasmax_projected_rst <- sac_tasmax_projected %>% ca_getrst_stars(quiet = TRUE, out_dir="C:/Users/lukesau/Desktop/esp106-erin_rodriguez/Project")
head(sac_tasmax_projected_rst)

sac_tasmax_historical<- ca_loc_aoipreset(type="counties") %>%     ## specify a location
  ca_gcm(c("HadGEM2-ES", "CNRM-CM5", "CanESM2","MIROC5",            ## select GCM(s)
           "ACCESS1-0", "CCSM4", "CESM1-BGC", 
           "CMCC-CMS", "GFDL-CM3", "HadGEM2-CC")) %>%     
  ca_scenario(c("historical")) %>%                               ## select emission scenarios(s)
  ca_cvar(c("tasmax")) %>%                                          ## select climate variables
  ca_period("year") %>%                                             ## select a temporal aggregation period
  ca_years(start = 1970, end = 2005)                                ## select start and end dates

sac_tasmax_historical_rst <- sac_tasmax_historical %>% ca_getrst_stars(quiet = TRUE, out_dir="C:/Users/lukesau/Desktop/esp106-erin_rodriguez/Project")
head(sac_tasmax_historical_rst)

