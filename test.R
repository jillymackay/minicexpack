errors <- file.path("//cmvm.datastore.ed.ac.uk/cmvm/mvmsan/rdsvsshared/Fieldsec/BVMS Years/Final Year/MiniCEx Analyses/AY 2023-2024/App Data - Save Your MiniCEx Spreadsheet Here/FY MiniCE 2023_2024_RowsToEdit.xlsx")
fil <- file.path("//cmvm.datastore.ed.ac.uk/cmvm/mvmsan/rdsvsshared/Fieldsec/BVMS Years/Final Year/MiniCEx Analyses/AY 2023-2024/App Data - Save Your MiniCEx Spreadsheet Here/FY MiniCE 2023_2024.xlsx")
tt <- "//cmvm.datastore.ed.ac.uk/cmvm/mvmsan/rdsvsshared/Fieldsec/BVMS Years/Final Year/Timetables & Student Groupings/2023-24/USE THIS ONE WORKING COPY FY23-24 core rotation timetable.xlsx"
or_dat <- mcex_read(fil)
dat <- mcex_edit(errors, or_dat)

ttable <- mcex_ttable(tt, sheet = "23-24")

inglis <- mcex_inglis(tt, sheet = "23-24")

inglis2 <- mcex_inglis(tt, sheet = "23-24", what_week = "2023-07-01")


check <- mcex_matriccheck(dat)

mcex_weekn()

# Should return 5
mcex_weekn(CalculationDate = "20230807")

# Should return 7
mcex_weekn(CalculationDate = "20230821")


# should return 24
mcex_weekn(CalculationDate = "20240104")


stuTasks <- mcex_tasks(dat)

stuTasksLong <- mcex_longtasks(dat)

notEnoughTasks <- mcex_enoughtasks(dat, WeekNumberRequirement)

dateTasks <- mcex_datetasks(dat)

dateTasksLong <- mcex_longdatetasks(dat)

mcexplot_datetasks(dat)

mcexplot_tasks(dat)

mcexplot_tasks(dat, DateOfTask, Spp)

mcexplot_facettasks(dat)
