#' Creates a long dataframe of the number of tasks per student
#' @param minicex_data A dataframe of cleaned MiniCEx data (you will likely have used mcex_read() to generate this)
#' @returns A dataframe of number of tasks per student
#' @examples
#' stuTasksLong <- mcex_longtasks(minicex_data)
#'
#'
#'
#'



mcex_longtasks <- function (minicex_data) {


  minicex_data %>%
    mcex_tasks() %>%
    pivot_longer(cols = -c(matric, totalTasks), names_to = "Task", values_to = "count")


}
