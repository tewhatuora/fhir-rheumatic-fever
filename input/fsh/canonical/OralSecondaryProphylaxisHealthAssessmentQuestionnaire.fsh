Instance: OralSecondaryProphylaxisHealthAssessmentQuestionnaire
InstanceOf: Questionnaire
Usage: #definition

Description: "Gathers information about patient health at an oral secondary prophylaxis medication appointment"

* url = Canonical(OralSecondaryProphylaxisHealthAssessmentQuestionnaire)

* identifier[0].use = #official
* identifier[=].value = "OralSecondaryProphylaxisHealthAssessmentQuestionnaire"
* identifier[=].period.start = "2024-06-17"

* version = "1.0.0"
* date = "2024-06-17"
* status = #draft
* experimental = false

* name = "OralSecondaryProphylaxisHealthAssessmentQuestionnaire"
* title = "Oral Secondary Prophylaxis Health Assessment Questionnaire"
* purpose = "Gathers information about patient health at an appointemnt for oral secondary prophylaxis medication"
* subjectType = #Patient
* publisher = "Te Whatu Ora"

* item[0] insert pageDisplayItem(page1,[[page1]],[[Please complete this questionnaire at the oral secondary prophylaxis appointment to assess a rheumatic fever patient's health.]])

* item[+] insert booleanQuestion(MedicationIssues,              [[1]],  [[Has the patient had any issues taking their medications?]])

* item[+] insert booleanQuestion(DelaysObtainingMedication,     [[2)]],  [[Were there delays in obtaining medications that interrupted the patient’s treatment?]])

* item[+] insert textQuestion(DelaysObtainingMedicationDetail,  [[2.1)]],[[Enter details of delays in obtaining medication that interrupted patient's treatment (enter text)]])
* item[=].enableWhen.question = "DelaysObtainingMedication"
* item[=].enableWhen.operator = #=
* item[=].enableWhen.answerBoolean = true

* item[+] insert booleanQuestion(SufficientMedication,          [[3)]],  [[Does the patient have enough medication to last until their next check-in?]])

* item[+] insert textQuestion(PlanForObtainingMedications,      [[4)]],  [[Plan for obtaining medications to last until next check-in (enter text)]])

* item[+] insert booleanQuestion(AnyOtherConcerns,[[5)]],[[Were There Any Other Concerns or Issues Identified During the Visit?]])
* item[=].initial.valueBoolean = false

* item[+] insert textQuestion(OtherConcernsDetail,[[5.1)]],[[If yes, describe details, actions taken, and follow-up planned (enter text)]])
* item[=].enableWhen.question = "AnyOtherConcerns"
* item[=].enableWhen.operator = #=
* item[=].enableWhen.answerBoolean = true

* item[+] insert multiChoiceQuestion(HealthEducationTopicsDiscussed,[[6)]],[[Health education topics discussed? (multiple choice)]])
* item[=].answerOption[0].valueString = "Secondary prophylaxis"
* item[=].answerOption[+].valueString = "Sore Throat Management"
* item[=].answerOption[+].valueString = "Skin Infection Management"
* item[=].answerOption[+].valueString = "Dental Health"
* item[=].answerOption[+].valueString = "Endocarditis Prophylaxis"
* item[=].answerOption[+].valueString = "Nutrition"
* item[=].answerOption[+].valueString = "Physical Activity"
* item[=].answerOption[+].valueString = "Healthy Home Environments"
* item[=].answerOption[+].valueString = "Sexual Health"
* item[=].answerOption[+].valueString = "Other"

* item[+] insert textQuestion(HealthEducationOtherDetail,[[6.1)]],[[Enter details of other health education topic discussed (enter text)]])
* item[=].enableWhen.question = "HealthEducationTopicsDiscussed"
* item[=].enableWhen.operator = #=
* item[=].enableWhen.answerString = "Other"

* item[+] insert booleanQuestion(RecentOrUpcomingAppointments,[[7)]],[[Any recent or upcoming follow-up appointments?]])

* item[+] insert textQuestion(RecentOrUpcomingAppointmentsDetails,[[7.1)]],[[Enter details and dates of any recent or upcoming follow-up appointments (enter text)]])
* item[=].enableWhen.question = "RecentOrUpcomingAppointments"
* item[=].enableWhen.operator = #=
* item[=].enableWhen.answerBoolean = true

* item[+] insert textQuestion(PlanForNextMedicationAppointment,[[8)]],[[Comments for the next appointment (enter text)]])

