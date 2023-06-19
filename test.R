
fil <- file.path("C:\\Users\\jmackay4\\Documents\\data\\Mini CEx Local Mirror\\FY MiniCE 2023_2024.xlsx")
tt <- "//cmvm.datastore.ed.ac.uk/cmvm/mvmsan/rdsvsshared/Fieldsec/BVMS Years/Final Year/Timetables & Student Groupings/2023-24/USE THIS ONE WORKING COPY FY23-24 core rotation timetable.xlsx"
dat <- mcex_read(fil)


ttable <- mcex_ttable(tt, sheet = "2022-2023")

inglis <- mcex_inglis(tt, sheet = "2022-2023")

inglis2 <- mcex_inglis(tt, sheet = "2022-2023", what_week = "2023-07-01")


check <- mcex_matriccheck(dat)

WeekNumberRequirement <- mcex_weekn()

# Should return 5
WeekNumberRequirementJuly <- mcex_weekn(CalculationDate = "20230707")


# should return 24
WeekNumberRequirementDec <- mcex_weekn(CalculationDate = "20240104")


stuTasks <- mcex_tasks(dat)

stuTasksLong <- mcex_longtasks(dat)

notEnoughTasks <- mcex_enoughtasks(dat, WeekNumberRequirement)

dateTasks <- mcex_datetasks(dat)

dateTasksLong <- mcex_longdatetasks(dat)

mcexplot_datetasks(dat)

mcexplot_tasks(dat)

mcexplot_tasks(dat, DateOfTask, Spp)

mcexplot_facettasks(dat)
