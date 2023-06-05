#' Creates a long dataframe of the number of tasks per student
#' @param tasks A dataframe of tasks per student (you will likely have used mcex_tasks to generate this)
#' @returns A dataframe of number of tasks per student
#' @examples
#' dat <- mcex_longtasks(tasks)
#'
#'
#'
#'



mcex_longtasks <- function (tasks) {
  tasks %>%
    pivot_longer(cols = -c(matric, totalTasks), names_to = "Task", values_to = "count") %>%
    mutate(taskCounter2 = case_when(count >  0 ~ 1,
                                    count < 1 ~ 0,
                                    TRUE ~ 400))

}
