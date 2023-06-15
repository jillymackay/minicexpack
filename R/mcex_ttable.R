#' Reads and cleans a Final Year timetable file
#' @param file_path A path pointing to your timetable excel file
#' @param sheet The sheet your timetable is contained in
#' @returns A dataframe containing the names, weeks and rotation of each student at each week
#' @examples
#' timetable <- mcex_ttable("data/timetable.xlsx")
#'



mcex_ttable <- function(file_path, sheet){


  readxl::read_excel(file_path, sheet) %>%
    filter(str_detect(`...2`, "\\D\\d\\d\\d\\d\\d\\d\\d")) %>%
    mutate(name = paste0(`...3`," ", `...4`)) %>%
    rename(rown = "...1",
           matric = "...2",
           firstname = "...3",
           secondname = "...4",
           coremodgroup = "Final Year 2023-24",
           corerotgroup = "...6",
           "05-06-23" = "...7",
           "12-06-23" =  "...8",
           "19-06-23" = "...9",
           "26-06-23" =  "...10",
           "03-07-23" ="...11",
           "10-07-23" = "...12",
           "17-07-23" = "...13",
           "24-07-23" = "...14",
           "31-07-23"  ="...15",
           "07-08-23"  ="...16",
           "14-08-23"  ="...17",
           "21-08-23" ="...18",
           "28-08-23" ="...19",
           "04-09-23" ="...20",
           "11-09-23" ="...21",
           "18-09-23" ="...22",
           "25-09-23" ="...23",
           "02-10-23" ="...24",
           "09-10-23" ="...25",
           "16-10-23" ="...26",
           "23-10-23" ="...27",
           "30-10-23" ="...28",
           "06-11-23" ="...29",
           "13-11-23" ="...30",
           "20-11-23" ="...31",
           "27-11-23" ="...32",
           "04-12-23" ="...33",
           "11-12-23" ="...34",
           "18-12-23" ="...35",
           "25-12-23" ="...36",
           "01-01-24" ="...37",
           "08-01-24" ="...38",
           "15-01-24" ="...39",
           "22-01-24" ="...40",
           "29-01-24" ="...41",
           "05-02-24" ="...42",
           "12-02-24" ="...43",
           "19-02-24" ="...44") %>%
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
