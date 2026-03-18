#' Calculate species richness for a colony/site.
#'
#' Counts the number of unique seabird species observed in a given colony.
#'
#'
#' @param data A data frame containing seabird counts
#' @param colony Name of the colony/site
#'
#' @return An integer giving the number of species present.
#'
#' @examples
#' species_richness(seabird_counts, "Foula")
#'
#' @export
species_richness <- function(data, colony) {

  data |>
    dplyr::filter(colony == !!colony, count > 0) |>
    dplyr::summarise(richness = dplyr::n_distinct(species)) |>
    dplyr::pull(richness)
}
