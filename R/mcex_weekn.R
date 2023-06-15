#' Generates the week requirement for MiniCEx analysis
#' @param CalculationDate A string of YYYYMMDD which represents the current date. Default is Sys.Date()
#' @param FYStartDate A string of YYYYMMDD which represents the Monday FY started
#' @param SummerHolidayStartDate A string of YYYYMMDD which represents the Monday the summer holiday starts
#' @param XmasHolidayStartDate A string of YYYYMMDD which represents the Monday the Christmas holiday starts
#' @returns The number of MiniCExs that should have been completed by the current week. Pauses count over Summer and Christmas breaks, and caps at 24
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


  if(ymd(CalculationDate) < ymd(SummerHolidayStartDate))
    {(as.numeric((ymd(CalculationDate) - ymd(FYStartDate))) / 7)}
  else {if(ymd(CalculationDate) < ymd(XmasHolidayStartDate))
    {(as.numeric(ymd(CalculationDate) - ymd(FYStartDate)) - 28)/7    }
    else{if(ymd(CalculationDate) >= ymd(XmasHolidayStartDate)){24}}}


    }





