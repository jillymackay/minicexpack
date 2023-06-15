
fil <- file.path("C:\\Users\\jmackay4\\Documents\\data\\Mini CEx Local Mirror\\FY MiniCE 2023_2024.xlsx")

dat <- mcex_read(fil)


WeekNumberRequirement <- mcex_weekn()

# Should return 4
WeekNumberRequirementJuly <- mcex_weekn(CalculationDate = "20230708")

stuTasks <- mcex_tasks(dat)

stuTasksLong <- mcex_longtasks(dat)

notEnoughTasks <- mcex_enoughtasks(dat, WeekNumberRequirement)

dateTasks <- mcex_datetasks(dat)

dateTasksLong <- mcex_longdatetasks(dat)

mcexplot_datetasks(dat)

mcexplot_tasks(dat)

mcexplot_tasks(dat, DateOfTask, Spp)

mcexplot_facettasks(dat)
