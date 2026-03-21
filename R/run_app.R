#' Run the seabird Shiny app
#'
#' An interactive app to explore seabird colony compositions.
#'
#' @export
run_seabird_app <- function() {

  shiny::runApp(
    system.file("shiny", package = "SeabirdStudio")
  )

}
