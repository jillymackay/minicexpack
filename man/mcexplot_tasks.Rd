% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mcexplot_tasks.R
\name{mcexplot_tasks}
\alias{mcexplot_tasks}
\title{Generates a generic plot utilised in analysis where the number of tasks can be viewed via specified vars}
\usage{
mcexplot_tasks(
  minicex_data,
  x_var = c(matric, week),
  fill_var = c(Spp, OverallAssessorFeedback)
)
}
\arguments{
\item{minicex_data}{A cleaned MiniCEx dataset, should be generated by mcex_read()}

\item{x_var}{The variable for the x axis, can be either matric or week. Default is matric}

\item{fill_var}{A factor from the dataset to fill the data.Can be Spp or OverallAssessorFeedback}
}
\value{
A plot describing number of tasks by student
}
\description{
Generates a generic plot utilised in analysis where the number of tasks can be viewed via specified vars
}
\examples{
mcexplot_tasks(longdate_tasks)
}