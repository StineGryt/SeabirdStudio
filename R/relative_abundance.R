#' Calculate relative abundance of species in a colony/site.
#'
#' Computes the proportion of each species within a given site.
#'
#' @param data A data frame containing seabird counts
#' @param colony Name of the colony/site
#'
#' @return A data frame with species and their relative abundance
#'
#' @examples
#' relative_abundance(seabird_counts, "Foula")
#'
#' @export
relative_abundance <- function(data, colony) {
  data |>
    dplyr::filter(colony == !!colony) |>
    dplyr::mutate(prop = count / sum(count)) |>
    dplyr::select(species, prop)
}
