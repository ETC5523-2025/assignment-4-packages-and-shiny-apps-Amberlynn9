#' Healthcare-Associated Infection Burden (Germany and EU/EEA, 2011–2012)
#'
#' This dataset contains the annual burden per 100,000 population of five types
#' of healthcare-associated infections (HAIs) from Zacher et al. (2019).
#'
#' @format A tibble with 9 rows and 8 columns:
#' \describe{
#'   \item{Measure}{Type of burden measure ("HAIs_per_100k", "Deaths_per_100k", "DALYs_per_100k")}
#'   \item{Sample}{Sample type: "German_PPS", "German_convenience", or "EU_EEA"}
#'   \item{HAP}{Healthcare-associated pneumonia}
#'   \item{UTI}{Urinary tract infection}
#'   \item{BSI}{Primary bloodstream infection}
#'   \item{SSI}{Surgical site infection}
#'   \item{CDI}{Clostridioides difficile infection}
#'   \item{All}{All HAIs combined}
#' }
#'
#' @source Zacher B. et al. (2019). *Application of a new methodology and R package reveals
#' a high burden of healthcare-associated infections in Germany compared to the average in the EU/EEA,
#' 2011–2012.* EuroSurveillance, 24(46): 1900135.
"hai_burden"
