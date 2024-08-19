## code to prepare `london_schools` dataset goes here

library(sf)
library(dplyr)
library(readr)
library(janitor)
library(ggplot2)
library(ggspatial)

schools_london <- read_csv("data-raw/london_all_schools_xy_2016.csv")

schools_london <- schools_london %>% clean_names()
com_sec_school <- schools_london %>% filter(type == "Community School",#Free Schools",
                                            phase == "Secondary",
                                            town=="London") %>%
  select(urn,school_nam,address,postcode,status,gender,x,y) %>%
  st_as_sf( coords = c("x", "y"), crs = "EPSG:4326")

usethis::use_data(com_sec_school, overwrite = TRUE)



