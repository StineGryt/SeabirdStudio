#' Calculate similarity between two colonies/sites
#'
#' Computes Bray-Curtis similarity index between two sites based on species counts
#'
#' @param data A data frame containing seabird counts
#' @param colony1 First colony name
#' @param colony2 Second colony name
#'
#' @return A numeric value representing similarity (0 = different, 1 = identical)
#'
#' @examples
#' colony_similarity(seabird_counts, "Foula", "Fair Isle")
#'
#' @export
colony_similarity <- function(data, colony1, colony2) {

  df <- data |>
    dplyr::filter(colony %in% c(colony1, colony2)) |>
    tidyr::pivot_wider(
      names_from = species,
      values_from = count
    )

  # Replace missing values
  df[is.na(df)] <- 0

  mat <- as.matrix(df[, -1])
  rownames(mat) <- df$colony

  x <- mat[colony1, ]
  y <- mat[colony2, ]

  # Bray-Curtis similarity
  similarity <- 1 - sum(abs(x - y)) / sum(x + y)

  return(similarity)
}
