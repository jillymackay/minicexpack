#' Creates a dataframe of the number of tasks per student
#' @param dataframe A dataframe of tidy MiniCEx data (you will likely have used mcex_read to generate this)
#' @returns A dataframe of number of tasks per student
#' @examples
#' tasks <- mcex_tasks(minicex)
#'
#'
#'
#'



mcex_tasks <- function(dataframe) {

  dataframe %>%
    summarise(ClinicalExam = sum(ClinicalExam),
              Diagnostics = sum(Diagnostics),
              MedTx = sum(MedTx),
              SurgTx = sum(SurgTx),
              CommsSkills = sum(CommsSkills),
              Other = sum(Other),
              Dentistry_extra = sum(Dentistry_extra),
              PPE_extra = sum(PPE_extra),
              totalTasks = sum(taskCounter)) %>%
    mutate(totalThemes = ClinicalExam + Diagnostics + MedOrSurgTx + MedTx +SurgTx + CommsSkills + Isolation + Other)
}
