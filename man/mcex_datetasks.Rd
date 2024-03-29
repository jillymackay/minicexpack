% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mcex_datetasks.R
\name{mcex_datetasks}
\alias{mcex_datetasks}
\title{Generates a dataframe of the dates of tasks that have been performed. Generally a helper function for mcex_longdatetasks}
\usage{
mcex_datetasks(minicex_data)
}
\arguments{
\item{minicex_data}{A cleaned MiniCEx dataset, should be generated by mcex_read()}
}
\value{
A dataframe containing dates of tasks and count of task type
}
\description{
Generates a dataframe of the dates of tasks that have been performed. Generally a helper function for mcex_longdatetasks
}
\examples{
dateTasks <- mcex_datetasks(minicex_data)
}
