#' Reads and cleans a minicex dataset. Helper function for mcex_edit()
#' @param file_path A path pointing to your MiniCEx excel file
#' @returns A dataframe containing cleaned MiniCEx data
#' @examples
#' dat <- mcex_read("data/minicex.xlsx")







mcex_read <- function(file_path) {
  readxl::read_excel(file_path) %>%
    janitor::clean_names()  %>%
    select(-c(start_time, completion_time)) %>%
    mutate(date_of_feedback = as.Date(date_of_feedback, format = '%Y-%m-%d %H:%M:%S', origin = "1900-01-01 24:00:00")) %>%
    rename("rowID" = "id",
           "Email" = "email",
           "AutoName" = "name",
           "StudentName" = "student_name",
           "GivenMatric" = "student_matriculation_number_eg_s190001",
           "Assessor" = "assessor_name",
           "SelfComplete" = "is_the_student_completing_this_form_on_behalf_of_the_assessor",
           "Rotation" = "rotation_week",
           "Species" = "what_species_did_you_work_with",
           "Referral" = "was_this_task_a_referral_level_procedure_see_guidance",
           "MainTask" = "please_indicate_the_nature_of_the_task_what_was_the_main_activity",
           "TaskSummary" = "brief_summary_of_the_task",
           "DateEvent" = "date_of_feedback",
           "Organisation" = "organisation_well_organised_approach_to_the_task_evidence_of_suitable_preparation_beforehand",
           "Communication" = "communication_effectively_communicates_with_client_colleagues_including_appropriate_use_of_language_non_verbal_skills_and_rapport" ,
           "History" = "history_taking_where_applicable_methodical_approach_relevant_information_gathered_appropriate_recording",
           "PhysicalExam" = "physical_examination_of_patient_where_applicable_methodical_approach_competent_examination_performed_relevant_data_gathered_and_recorded_considerate_patient_handling_throughout",
           "ClinicalSkills" = "clinical_skills_task_competently_performed_with_without_instruction_good_manual_dexterity_safe_and_appropriate_handling_of_equipment" ,
           "ClinicalReasoning" = "clinical_reasoning_appropriate_treatment_plan_formulated_based_on_information_available_rational_selection_of_further_diagnostic_tests_procedures_or_next_steps",
           "OverallAssessorFeedback" = "assessor_feedback_on_students_overall_professionalism_and_competence_on_this_occasion",
           "Feedback_forNextTime" = "please_provide_some_overall_feedback_for_the_student_on_what_they_did_well_and_what_they_could_improve_on_next_time",
           "StudentReflection" = "student_self_reflection_on_feedback_received_and_next_steps",
           "StudentDeclaration" = "student_declaration_i_confirm_that_i_have_checked_the_contents_of_this_form_with_my_assessor_prior_to_submission_and_they_have_approved_it") %>%
    mutate(GivenMatric = tolower(GivenMatric),
           matric = str_extract(GivenMatric, "\\D\\d\\d\\d\\d\\d\\d\\d"),
           matric = case_when (is.na(matric) ~ str_extract(Email, "\\D\\d\\d\\d\\d\\d\\d\\d"),
                               TRUE ~ as.character(matric)),
           DateOfTask = lubridate::ymd(str_extract(DateEvent, "\\d\\d\\d\\d\\-\\d\\d\\-\\d\\d")),
           taskCounter = 1,
           Spp = as.factor(Species),
           Rotation = as_factor(Rotation),
           MainTask = as_factor(MainTask),
           TaskSummary = tolower(TaskSummary),
           ClinicalExam = str_detect(MainTask, "Clinical Examination"),
           Diagnostics = str_detect(MainTask, "Diagnostic Procedures"),
           MedTx = str_detect(MainTask, "Medical Treatment"),
           SurgTx = str_detect(MainTask, "Surgical Treatment"),
           CommsSkills = str_detect(MainTask, "Communication Skills"),
           Dentistry = str_detect(MainTask, "Dentistry"),
           Other = str_detect(MainTask, "Other"),
           OverallAssessorFeedback = factor(OverallAssessorFeedback, levels = c("Above expected level",
                                                                                "At expected level",
                                                                                "Below expected level")),
           WeekN = ymd(DateOfTask),
           WeekN = lubridate::week(WeekN)) %>%

    mutate_at(.vars = vars(c("Organisation":"ClinicalReasoning")),
              .funs = function(x) case_when(x == "N/A" ~ NA,
                                            TRUE ~ as.character(x)))   %>%
    mutate_at(.vars = vars(c("Organisation":"ClinicalReasoning")),
              .funs = function(.) factor(., levels = c("The student didn't require any assistance from me",
                                                       "The student didn't require much assistance from me",
                                                       "I had to provide help at several points",
                                                       "I had to do most/all of the task")))

}

