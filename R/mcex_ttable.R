#' Reads and cleans a Final Year timetable file
#' @param file_path A path pointing to your timetable excel file
#' @param sheet The sheet your timetable is contained in
#' @returns A dataframe containing the names, weeks and rotation of each student at each week
#' @examples
#' timetable <- mcex_ttable("data/timetable.xlsx")
#'



mcex_ttable <- function(file_path, sheet){


  readxl::read_excel(file_path, sheet) %>%
    filter(str_detect(`...4`, "\\D\\d\\d\\d\\d\\d\\d\\d")) %>%
    mutate(name = paste0(`...5`," ", `...6`))  %>%
    rename(rown = "...1",
           matric = "...4",
           firstname = "...5",
           secondname = "...6",
           coremodgroup = "Final Year 2023-24",
           corerotgroup = "...8",
           "05-06-23" = "...12",
           "12-06-23" =  "...13",
           "19-06-23" = "...14",
           "26-06-23" =  "...15",
           "03-07-23" ="...16",
           "10-07-23" = "...17",
           "17-07-23" = "...18",
           "24-07-23" = "...19",
           "31-07-23"  ="...20",
           "07-08-23"  ="...21",
           "14-08-23"  ="...22",
           "21-08-23" ="...23",
           "28-08-23" ="...24",
           "04-09-23" ="...25",
           "11-09-23" ="...26",
           "18-09-23" ="...27",
           "25-09-23" ="...28",
           "02-10-23" ="...29",
           "09-10-23" ="...30",
           "16-10-23" ="...31",
           "23-10-23" ="...32",
           "30-10-23" ="...33",
           "06-11-23" ="...34",
           "13-11-23" ="...35",
           "20-11-23" ="...36",
           "27-11-23" ="...37",
           "04-12-23" ="...38",
           "11-12-23" ="...39",
           "18-12-23" ="...40",
           "25-12-23" ="...41",
           "01-01-24" ="...42",
           "08-01-24" ="...43",
           "15-01-24" ="...44",
           "22-01-24" ="...45",
           "29-01-24" ="...46",
           "05-02-24" ="...47",
           "12-02-24" ="...48",
           "19-02-24" ="...49") %>%
    select(c(matric, name, "05-06-23":"19-02-24")) %>%
    mutate_at(.vars = vars (c("05-06-23":"19-02-24")),
              .funs = function(x) case_when(is.na(x) ~ "NA",
                                            TRUE ~ as.character(x))) %>%
    pivot_longer(cols = -c(matric, name),
                 names_to = "Week",
                 values_to = "Rotation") %>%
    mutate (Rotation = case_when(Rotation == "NA" ~ NA,
                                 TRUE ~ as.character(Rotation)),
            WeekN = dmy(Week),
            WeekN = lubridate::week(WeekN),
            Rotation =  zoo::na.locf(Rotation),
            matric = tolower(matric))

}
