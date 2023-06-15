#' Returns the students thought to be at Inglis this week
#' @param file_path A path pointing to your timetable excel file
#' @param sheet The sheet your timetable is contained in
#' @param what_week A string of format YYYY-MM-DD which denotes what week do you want to check? Defaults to Sys.Date()
#' @returns A dataframe containing the names, weeks and rotation of each student at each week
#' @examples
#' inglis <- mcex_inglis("data/timetable.xlsx")



mcex_inglis <- function(file_path, sheet, what_week = 0){

  d <- mcex_ttable(file_path, sheet)

  what_week <- if(is.character(what_week)){as.character(what_week)}
  else{Sys.Date()}


  d %>%
    filter(WeekN == lubridate::week(what_week),
           Rotation == "Inglis Veterinary Practice") %>%
    select(c(matric,name))

}
