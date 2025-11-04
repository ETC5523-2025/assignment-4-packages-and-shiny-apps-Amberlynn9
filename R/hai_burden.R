#' HAI Burden Data (Germany and EU/EEA)
#'
#' A dataset summarising the estimated burden of healthcare-associated infections
#' (HAIs) in Germany and the EU/EEA, based on Zacher et al. (2019).
#'
#' @format A data frame with 90 rows and 6 variables:
#' \describe{
#'   \item{measure}{Type of burden measure (e.g. "HAIs per 100k", "Deaths per 100k", "DALYs per 100k")}
#'   \item{sample}{Sampling group: "German_PPS", "German_convenience", or "EU_EEA"}
#'   \item{infection}{Type of infection (HAP, UTI, BSI, SSI, CDI, or All)}
#'   \item{estimate}{Estimated value per 100,000 population}
#'   \item{ci_low}{Lower bound of uncertainty interval (simulated)}
#'   \item{ci_high}{Upper bound of uncertainty interval (simulated)}
#' }
#'
#' @source Zacher B. et al. (2019). *EuroSurveillance, 24(46): 1900135*.
#'
#' @examples
#' data("hai_burden")
#' head(hai_burden)
"hai_burden"
