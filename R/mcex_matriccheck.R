#' Performs a check that matriculation numbers in minicex data matches the autosupplied
#' @param minicex_data A dataframe of cleaned MiniCEx data (you will likely have used mcex_read() to generate this)
#' @returns A table of MiniCEx entries where the matriculation numbers do not match with the form submitter
#' @examples
#' check <- mcex_matriccheck()
#'
#'




mcex_matriccheck <- function (minicex_data){

  minicex_data %>%
    mutate(automatric = str_extract(Email, "\\D\\d\\d\\d\\d\\d\\d\\d"),
           matmatch = str_equal(x = automatric, y= matric)) %>%
    filter(matmatch == FALSE) %>%
    select(rowID, StudentName, AutoName, matric, Rotation, Email, Assessor, SelfComplete) %>%
    rename("Row ID" = rowID,
           "Student Name" = StudentName,
           "Name of Submitting Account" = AutoName,
           "Matriculation Number" = matric,
           "Was it a self complete" = SelfComplete)


}

