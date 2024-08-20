#' Compute POI density
#'
#' @param area_sf object of class sf
#' @param poi_list list of POIs
#' @param area_id string of column name
#'
#' @return object of class sf
#' @export
#' @importFrom purrr pluck
#' @importFrom tidyr replace_na
#' @importFrom units drop_units
#' @importFrom dplyr left_join mutate
#' @import osmdata
#' @import sf
#' @examples
#' poi_list = list("amenity" = "school")
#' poi_sf <- poi_density_area(districts_lk,poi_list,"ADM2_PCODE")
poi_density_area <- function(area_sf,poi_list,area_id) {

  #stopifnot("area is not a sf object",)

  poi_sf <- area_sf %>%
    st_bbox() %>% # get the boundary
    opq() %>%
    add_osm_features (features = poi_list) %>%
    osmdata_sf() %>%
    pluck("osm_points")

  poi_count <-
    poi_sf %>%
    st_join(area_sf) %>%
    st_drop_geometry() %>%
    dplyr::count(.data[[area_id]],name = "poi")


  poi_count_sf <- area_sf %>%
    left_join(poi_count,by=area_id) %>%
    replace_na(list(poi=0))

  poi_count_sf$area <- st_area(poi_count_sf) %>% drop_units()

  poi_density_sf <- poi_count_sf %>% mutate(poi_density = poi/area * 10^6)

  return(poi_density_sf)

}
