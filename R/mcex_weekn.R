#' Generates the week requirement for MiniCEx analysis
#' @param CalculationDate A string of YYYYMMDD which represents the current date. Default is Sys.Date()
#' @param FYStartDate A string of YYYYMMDD which represents the Monday FY started
#' @param SummerHolidayStartDate A string of YYYYMMDD which represents the Monday the summer holiday starts
#' @param XmasHolidayStartDate A string of YYYYMMDD which represents the Monday the Christmas holiday starts
#' @returns The number of MiniCExs that should have been completed by the current week
#' @examples
#' mcex_weekn()
#'
#'


mcex_weekn <- function(CalculationDate = 0, FYStartDate = "20230605", SummerHolidayStartDate = "20230703", XmasHolidayStartDate = "20231218"){

  FYStartDate <- as.numeric(FYStartDate)

  SummerHolidayStartDate <- as.numeric(SummerHolidayStartDate)

  XmasHolidayStartDate <- as.numeric(XmasHolidayStartDate)

  CalculationDate <- if(is.character(CalculationDate)){as.numeric(CalculationDate)}
  else{Sys.Date()}


  if(CalculationDate < ymd(SummerHolidayStartDate))
    {(as.numeric((CalculationDate - ymd(FYStartDate))) / 7)}
  else {if(CalculationDate < ymd(XmasHolidayStartDate))
    {(as.numeric((CalculationDate - ymd(FYStartDate)) - 28) / 7)}
    else{if(CalculationDate >= ymd(XmasHolidayStartDate)){24}}}


    }





