#' Compute POI density within Specified Proximity
#'
#' @param locations_sf object of class sf contains locations of interest
#' @param poi_list list of POIs
#' @param location_id string of location identifier
#' @param radius search radius around each location in meters
#'
#' @return object of class sf
#' @export
#' @importFrom sf st_buffer
#'
#' @examples
#' library(ggplot2)
#'  library(ggspatial)
#'
#' poi_list = list(
#' "amenity" = "cafe",
#' "amenity" = "fast_food")
#'
#' poi_sf <- poi_density_proximity(com_sec_school,poi_list,"urn",500)
#' ggplot() +
#' annotation_map_tile(zoomin = 0, progress = "none")+
#' geom_sf(data = poi_sf,colour = "red", mapping = aes(fill = poi_density))+
#' geom_sf(data = com_sec_school)+
#' theme_void()

poi_density_proximity <- function(locations_sf,poi_list,location_id,radius=500) {
  bs_buff <-st_buffer(locations_sf, radius)

  poi_sf <- poi_density_area(bs_buff,poi_list,location_id)

  return(poi_sf)
}
