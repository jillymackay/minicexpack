#' Creates a dataframe of the number of tasks per student
#' @param minicex_data A dataframe of tidy MiniCEx data (you will likely have used mcex_read to generate this)
#' @returns A dataframe of number of tasks per student
#' @examples
#' tasks <- mcex_tasks(minicex_data)
#'
#'
#'
#'



mcex_tasks <- function(minicex_data) {

  minicex_data %>%
    group_by(matric) %>%
    summarise(ClinicalExam = sum(ClinicalExam),
              Diagnostics = sum(Diagnostics),
              MedTx = sum(MedTx),
              SurgTx = sum(SurgTx),
              CommsSkills = sum(CommsSkills),
              Dentistry = sum(Dentistry),
              totalTasks = sum(taskCounter))
 }
