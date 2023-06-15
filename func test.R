# mcex_weekn testing


# Prior to 20230703 should be normal
# if less than the 20231218 should be normal-4





WeekNumberRequirement <- mcex_weekn()

# Should return 5
WeekNumberRequirementJuly <- mcex_weekn(CalculationDate = "20230807")


# should return 24
WeekNumberRequirementDec <- mcex_weekn(CalculationDate = "20240104")

# Normal Value
as.numeric(Sys.Date() - lubridate::ymd(20230605))

# If After Summer Holiday
(as.numeric(lubridate::ymd(20230807) - lubridate::ymd(20230605)) - 28)/7
