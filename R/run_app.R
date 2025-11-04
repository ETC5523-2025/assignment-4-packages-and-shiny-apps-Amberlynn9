#' Launch the Shiny App
#'
#' This function launches the Shiny application.
#' @export
run_app <- function() {
  app_dir <- system.file("app", package = "etc5523nhu")
  shiny::runApp(app_dir, display.mode = "normal")
}

