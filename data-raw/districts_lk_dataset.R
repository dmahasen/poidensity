## code to prepare `districts_lk` dataset goes here

library(sf)
library(dplyr)
districts_lk <- st_read("data-raw/lk_districts/lka_admbnda_adm2_slsd_20220816.shp")
districts_lk <- districts_lk %>% select(c(ADM2_EN,ADM2_PCODE))

usethis::use_data(districts_lk, overwrite = TRUE)
