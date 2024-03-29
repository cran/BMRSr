# Functions to build API calls


#' Create an API call for B-data flows
#'
#' @param data_item character string; the id of the B flow
#' @param api_key character string; api key retrieved from the Elexon portal
#' @param settlement_date character string;
#'   settlement date (automatically cleaned by format_date)
#' @param period character string; settlement period
#' @param year character string; year
#' @param month character string; month
#' @param week character string; week
#' @param process_type character string; process type
#' @param start_time character string; start time
#' @param end_time character string; end time
#' @param start_date character string; start date
#' @param end_date character string; end date
#' @param service_type character string; file format (csv or xml)
#' @param api_version character string;
#'   version of the api to use (currently on v1)
#' @param ... additional parameters that will be appended onto the query string
#' @return list; list with entries `url` for the call, `service_type` and `data_item`
#' @family call-building functions
#' @export
#' @examples
#' \dontrun{
#'     build_b_call(data_item = "B1730",
#'     api_key = "12345", settlement_date = "14-12-2016")
#'
#'     build_b_call(data_item = "B1510",
#'     api_key = "12345", start_date = "01 Jan 2019",
#'     start_time = "00:00:00", end_date = "02 Jan 2019",
#'     end_time = "24:00:00", service_type = "csv")
#' }
#'
build_b_call <- function( data_item,
                          api_key,
                          settlement_date = NULL,
                          period = NULL,
                          year = NULL,
                          month = NULL,
                          week = NULL,
                          process_type = NULL,
                          start_time = NULL,
                          end_time = NULL,
                          start_date = NULL,
                          end_date = NULL,
                          service_type = c("csv", "xml"),
                          api_version = "v1",
                          ...) {
  service_type <- match.arg(service_type)
  check_data_item(data_item, "B Flow")
  input_params  <- get_build_arguments(as.list(as.environment(-1)))

  base_url  <- httr::modify_url("https://api.bmreports.com",
                              path= paste0("BMRS/", data_item,"/", api_version)
  )

  # construct query params

  fixed_params <- fix_all_parameters(input_params)


  additional_params <- list(...)


  request  <- list()
  request$url  <- httr::modify_url(base_url, query=c(fixed_params, additional_params))
  request$service_type  <- service_type
  request$data_item  <- data_item

  return(request)
}

#' Create an API call for REMIT flows
#'
#' @param data_item character string; the id of the REMIT flow
#' @param api_key character string; api key retrieved from the Elexon portal
#' @param event_start character string; event start (automatically cleaned by format_date)
#' @param event_end character string; event end (automatically cleaned by format_date)
#' @param publication_from character string; publication from (automatically cleaned by format_date)
#' @param publication_to character string; publication to (automatically cleaned by format_date)
#' @param participant_id character string; participant id
#' @param asset_id character string; asset id
#' @param event_type character string; event type
#' @param fuel_type character string; fuel type
#' @param message_type character string; message type
#' @param message_id character string; message id
#' @param unavailability_type character string; unavailability type
#' @param active_flag character string; active flag
#' @param sequence_id character string; sequence id
#' @param service_type character string; file format (csv or xml)
#' @param api_version character string; version of the api to use (currently on v1)
#' @param ... additional parameters that will be appended onto the query string
#' @return list; list with entries `url` for the call, `service_type` and `data_item`
#' @family call-building functions
#' @examples
#' build_remit_call(data_item = "MessageListRetrieval", api_key = "12345",
#' event_start = "14-12-2016", event_end = "15-12-2016")
#' build_remit_call(data_item = "MessageDetailRetrieval", api_key = "12345",
#' participant_id = 21, service_type = "xml")
#' @export

build_remit_call <- function(data_item, api_key, event_start = NULL, event_end = NULL, publication_from = NULL, publication_to = NULL,
                             participant_id = NULL, asset_id =  NULL, event_type = NULL, fuel_type = NULL, message_type = NULL, message_id = NULL,
                             unavailability_type =  NULL, active_flag = NULL, sequence_id = NULL, service_type = "xml", api_version = "v1", ...){

  check_data_item(data_item, "REMIT")
  input_params  <- get_build_arguments(as.list(as.environment(-1)))

  base_url  <- httr::modify_url("https://api.bmreports.com",
                                path= paste0("BMRS/", data_item,"/", api_version)
  )

  # construct query params

  fixed_params <- fix_all_parameters(input_params)


  if (service_type == "csv"){
    warning("Remit files cannot be returned as .csv - file will be returned as xml")
    service_type <- "xml"
  }

  additional_params <- list(...)

  request <- list()
  request$url  <- httr::modify_url(base_url, query=c(fixed_params, additional_params))
  request$service_type <- service_type
  request$data_item <- data_item
  return(request)
}

#' Create an API call for legacy data
#'
#' @param data_item character string; the id of the legacy data
#' @param api_key character string; api key retrieved from the Elexon portal
#' @param from_date character string; from date (automatically cleaned by format_date)
#' @param to_date character string; to date (automatically cleaned by format_date)
#' @param settlement_date character string; settlement date (automatically cleaned by format_date)
#' @param settlement_period character string; settlement period
#' @param bm_unit_id character string; BM Unit ID
#' @param bm_unit_type character string; BM Unit type
#' @param lead_party_name character string;  lead party name
#' @param ngc_bm_unit_name character string; NGC BM Unit name
#' @param from_cleared_date character string; from cleared date (automatically cleaned by format_date)
#' @param to_cleared_date character string; to cleared dat (automatically cleaned by format_date)
#' @param is_two_day_window character string; is two day window
#' @param from_datetime character string; from datetime
#' @param to_datetime character string; to datetime
#' @param from_settlement_date character string; from settlement date (automatically cleaned by format_date)
#' @param to_settlement_date character string; to settlement date (automatically cleaned by format_date)
#' @param period character string; period
#' @param fuel_type character string; fuel type
#' @param balancing_service_volume character string; balancing service volume
#' @param zone_identifier character string; zone identifier
#' @param start_time character string; start time
#' @param end_time character string; end time
#' @param trade_name character string; trade name
#' @param trade_type character string; trade type
#' @param service_type character string; file format (csv or xml)
#' @param api_version character string; version of the api to use (currently on v1)
#' @param ... additional parameters that will be appended onto the query string
#' @return list; list with entries `url` for the call, `service_type` and `data_item`
#' @family call-building functions
#' @examples
#' build_legacy_call(data_item = "FUELINST", api_key = "12345",
#' from_datetime = "14-12-201613:00:00", to_datetime = "14-12-201614:00:00")
#' build_legacy_call(data_item = "QAS", api_key = "12345",
#' settlement_date = "01 Jun 2019", service_type = "xml")
#' @export

build_legacy_call <- function(data_item, api_key, from_date = NULL, to_date = NULL, settlement_date = NULL, settlement_period =  NULL, bm_unit_id = NULL,
                              bm_unit_type = NULL, lead_party_name = NULL, ngc_bm_unit_name = NULL, from_cleared_date = NULL, to_cleared_date = NULL,
                              is_two_day_window = NULL, from_datetime = NULL, to_datetime = NULL, from_settlement_date = NULL, to_settlement_date = NULL,
                              period = NULL, fuel_type = NULL, balancing_service_volume = NULL, zone_identifier = NULL, start_time = NULL, end_time = NULL,
                              trade_name = NULL, trade_type = NULL, api_version = "v1", service_type = "csv", ...){
  check_data_item(data_item, "Legacy")
  input_params  <- get_build_arguments(as.list(as.environment(-1)))

  base_url  <- httr::modify_url("https://api.bmreports.com",
                                path= paste0("BMRS/", data_item,"/", api_version)
  )

  additional_params <- list(...)

  fixed_params <- fix_all_parameters(input_params)

  request <- list()
  request$url  <- httr::modify_url(base_url, query=c(fixed_params, additional_params))
  request$service_type <- service_type
  request$data_item <- data_item
  return(request)
}

#' Build an API call (uses the appropriate function based on the data item)
#' @param data_item character string; data item to be retrieved
#' @param api_key character string; user's API key
#' @param service_type character string; one of "csv" or "xml" to define return format
#' @param api_version character string; API version to use - currently only on version 1
#' @param warn logical; should you be warned if any of the parameters you've supplied may not be appropriate for that data item?
#' Default is TRUE.
#' @param ... values to be passed to appropriate build_x_call function
#' @family call-building functions
#' @seealso [build_b_call()]
#' @seealso [build_remit_call()]
#' @seealso [build_legacy_call()]
#' @return list; list with entries `url` for the call, `service_type` and `data_item`
#' @examples
#' build_call(data_item = "TEMP", api_key = "12345", from_date = "12 Jun 2018",
#' to_date = "13 Jun 2018", service_type = "csv")
#' build_call(data_item = "QAS", api_key = "12345",
#' settlement_date = "01 Jun 2019", service_type = "xml")
#' @export
build_call <- function(data_item, api_key, service_type = c("csv", "xml"), api_version = "v1", warn = TRUE, ...){
  service_type <- match.arg(service_type)
  allowed_params <- get_parameters(data_item)
  check_data_item_version(data_item, api_version, FALSE)
  prov_params <- list(...)
  if (length(prov_params) > 0){
    warn_params <- c()
    for (i in seq_along(prov_params)){
      if (names(prov_params)[i] %!in% allowed_params){
        warn_params <- c(warn_params, names(prov_params[i]))
      }
    }
    if (warn) {
      if (length(warn_params > 0)) {
        warning(paste("Additional parameter(s):", paste0(warn_params, collapse = ", "), "supplied for chosen data item.\nSuppress this warning with `warn = FALSE`."))
      }
    }
  }
  data_item <- upper_case(data_item)
  typed_call <- get_function(data_item)
  request <- do.call(what = typed_call, args = c(data_item = data_item, api_key = api_key, service_type = service_type, api_version = api_version, prov_params))
  return(request)
}
