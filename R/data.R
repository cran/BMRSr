#' An example dataset from BMRS showing generation by fuel type.
#'
#' A dataset containing UK generation by fuel type between 1 July 2019 and 3 July 2019 at half-hourly intervals.
#'
#' @format A data frame with 8655 rows and 6 variables:
#' \describe{
#'   \item{record_type}{data item}
#'   \item{settlement_date}{Settlement Date of the observation}
#'   \item{settlement_period}{Settlement Period of the observation}
#'   \item{spot_time}{Spot Time of the observation; this is essentially an amalgamation of settlement_date and settlement_period}
#'   \item{ccgt}{Generation from Combined Cycle Gas Turbines (MW)}
#'   \item{oil}{Generation from oil (MW)}
#'   \item{coal}{Generation from coal(MW)}
#'   \item{nuclear}{Generation from nuclear (MW)}
#'   \item{wind}{Generation from wind (MW)}
#'   \item{ps}{Generation from pumped storage (MW)}
#'   \item{npshyd}{Generation from hydro (non-pump storage; MW)}
#'   \item{ocgt}{Generation from Open Cycle Gas Turbines (MW)}
#'   \item{other}{Generation from other, not-listed sources (MW)}
#'   \item{intfr}{Generation from the French interconnector (MW)}
#'   \item{intirl}{Generation from the Northern Irish interconnector (MW)}
#'   \item{intned}{Generation from the Dutch interconnector (MW)}
#'   \item{intew}{Generation from the Irish interconnector (MW)}
#'   \item{biomass}{Generation from biomass (MW)}
#'   \item{intnem}{Generation from Belgian interconnector (MW)}
#' }
#' @source \url{https://www.bmreports.com/bmrs/?q=help/about-us}
"generation_dataset_example"
