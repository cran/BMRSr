## ----setup, include = FALSE---------------------------------------------------
library(BMRSr)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
#  api_key <- "your_api_key_here"

## -----------------------------------------------------------------------------
get_parameters("FUELINST")

## ----eval = FALSE-------------------------------------------------------------
#  generation_data <- full_request(data_item = "FUELINST",
#                                  api_key = api_key,
#                                  from_datetime = "01 07 2019 00:00:00",
#                                  to_datetime = "03 07 2019 00:00:00",
#                                  parse = TRUE,
#                                  clean_dates = TRUE)

## ----eval = FALSE-------------------------------------------------------------
#  api_key <- "your_api_key_here"
#  
#  get_parameters("FUELINST")

## ----eval = FALSE-------------------------------------------------------------
#  generation_data_request <- build_call(data_item = "FUELINST",
#                                        api_key = api_key,
#                                        from_datetime = "01 07 2019 00:00:00",
#                                        to_datetime = "03 07 2019 00:00:00",
#                                        service_type = "csv")

## ----eval = FALSE-------------------------------------------------------------
#  get_data_item_type("FUELINST")
#  #This tells us which build_x_call() function to use
#  
#  generation_data_request <- build_legacy_call(data_item = "FUELINST",
#                                               api_key = api_key,
#                                               from_datetime = "01 07 2019 00:00:00",
#                                               to_datetime = "03 07 2019 00:00:00",
#                                               service_type = "csv")

## ----eval = FALSE-------------------------------------------------------------
#  generation_data_response <- send_request(request = generation_data_request)

## ----eval = FALSE-------------------------------------------------------------
#  generation_data <- parse_response(response = generation_data_response,
#                                    format = "csv",
#                                    clean_dates = TRUE)

## ----eval = FALSE-------------------------------------------------------------
#  generation_data <- build_call(data_item = "FUELINST",
#                                api_key = api_key,
#                                from_datetime = "01 07 2019 00:00:00",
#                                to_datetime = "03 07 2019 00:00:00",
#                                service_type = "csv") %>%
#    send_request() %>%
#    parse_response()

## ----eval= TRUE, echo = FALSE-------------------------------------------------
generation_data <- generation_dataset_example

## ----eval = TRUE, fig.width=7, fig.height=7, warning=FALSE--------------------
#Load the libraries for a bit more cleaning and then plotting...
library(ggplot2, quietly = TRUE, warn.conflicts = FALSE)
library(tidyr, quietly = TRUE, warn.conflicts = FALSE)
library(dplyr, quietly = TRUE, warn.conflicts = FALSE)

#Change the fuel types from columns to a grouping (tidy format)
generation_data <- generation_data %>%
  dplyr::mutate(settlement_period = as.factor(settlement_period)) %>%
  tidyr::gather(key = "fuel_type", value = "generation_mw", ccgt:intnem)

#Make a line graph of the different generation types
ggplot2::ggplot(data = generation_data, aes(x = spot_time, y = generation_mw, colour = fuel_type)) +
  ggplot2::geom_line()

