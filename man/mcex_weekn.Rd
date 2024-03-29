% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mcex_weekn.R
\name{mcex_weekn}
\alias{mcex_weekn}
\title{Generates the week requirement for MiniCEx analysis}
\usage{
mcex_weekn(
  CalculationDate = 0,
  FYStartDate = "20230605",
  SummerHolidayStartDate = "20230703",
  XmasHolidayStartDate = "20231218"
)
}
\arguments{
\item{CalculationDate}{A string of YYYYMMDD which represents the current date. Default is Sys.Date()}

\item{FYStartDate}{A string of YYYYMMDD which represents the Monday FY started}

\item{SummerHolidayStartDate}{A string of YYYYMMDD which represents the Monday the summer holiday starts}

\item{XmasHolidayStartDate}{A string of YYYYMMDD which represents the Monday the Christmas holiday starts}
}
\value{
The number of MiniCExs that should have been completed by the current week. Pauses count over Summer and Christmas breaks, and caps at 24
}
\description{
Generates the week requirement for MiniCEx analysis
}
\examples{
mcex_weekn()


}
