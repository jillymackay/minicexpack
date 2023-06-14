#' Generates the week requirement for MiniCEx analysis
#' @param FYStartDate A string of YYYYMMDD which represents the Monday FY started
#' @returns The number of MiniCExs that should have been completed by the current week
#' @examples
#' mcex_weekn()
#'
#'


mcex_weekn <- function(FYStartDate = "20230605"){

  FYStartDate <- as.numeric(FYStartDate)


  if ((as.numeric((Sys.Date() - ymd(FYStartDate))) / 7) <= 12 )
    {as.numeric((as.numeric((Sys.Date() - ymd(FYStartDate))) / 7))}
  else
  {if (as.numeric((Sys.Date() - ymd(FYStartDate) - 28 - 28 - 28) / 7)<=24)
  {as.numeric((Sys.Date() - ymd(FYStartDate) - 28 - 28 - 28) / 7)}
    else {24}}




}

