% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fix.R
\name{fix_parameter}
\alias{fix_parameter}
\title{Fixes parameters provided in the \code{build_x_call()} functions}
\usage{
fix_parameter(param, before = NULL, ...)
}
\arguments{
\item{param}{list; named list with the parameter name and value (e.g. \code{list(settlement_date = "01/01/2020")})}

\item{before}{function; function to fix the parameter. \code{param} will be passed as the first argument to this function.
Default NULL does nothing}

\item{...}{additional arguments passed to the \code{before} function}
}
\value{
modified \code{param} object (if \code{before} isn't NULL)
}
\description{
Fixes parameters provided in the \code{build_x_call()} functions
}
\seealso{
fix_all_parameters
}
