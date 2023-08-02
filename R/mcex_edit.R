#' Reads and cleans a minicex dataset. Utilises mcex_read
#' @param edit_path A path pointing to your excel file with edited rows
#' @param minicex_data A cleaning MiniCEx table (you probably generated this with mcex_read())
#' @returns A dataframe containing cleaned MiniCEx data
#' @examples
#' dat <- mcex_edit("data/minicex edits.xlsx")
#'


mcex_edit <- function(edit_path, minicex_data) {



  erdat <- mcex_read(edit_path) %>%
    filter(!is.na(rowID)) %>%
    select(rowID)

  repldat <- mcex_read(edit_path) %>%
    filter(!is.na(rowID)) %>%
    filter(!remove %in% c("Y", "y")) %>%
    select(-remove)

  newdat <- minicex_data %>%
    filter(!rowID %in% erdat$rowID) %>%
    rbind(repldat)


  return(newdat)
}
