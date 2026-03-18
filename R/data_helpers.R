#' List available colonies/sites
#'
#' Returns a vector of unique site names in the dataset subset.
#'
#' @param data A data frame containing seabird counts
#'
#' @return A character vector of colony names
#'
#' @examples
#' list_colonies(seabird_counts)
#'
#' @export
list_colonies <- function(data) {

  sort(unique(data$colony))

}
