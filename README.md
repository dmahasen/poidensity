
# poidensity

<!-- badges: start -->
<!-- badges: end -->



## Installation

You can install the development version of poidensity from [GitHub](https://github.com/dmahasen/poidensity) with:

``` r
# install.packages("pak")
pak::pak("dmahasen/poidensity")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(tmap)
library(poidensity)
poi_list = list("amenity" = "school")
school_sf <- poi_density_area(districts_lk,poi_list,"ADM2_PCODE")

tm_shape(school_sf) +
  tm_fill("poi",style = "jenks") +
  tm_borders()

```

