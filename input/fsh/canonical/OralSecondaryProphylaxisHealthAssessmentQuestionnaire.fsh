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
* item[=].required = false

* item[+] insert booleanQuestion(DelaysObtainingMedication,     [[2)]],  [[Were there delays in obtaining medications that interrupted the patient’s treatment?]])
* item[=].required = false

* item[+] insert textQuestion(DelaysObtainingMedicationDetail,  [[2.1)]],[[Enter details of delays in obtaining medication that interrupted patient's treatment (enter text)]])
* item[=].required = false
* item[=].enableWhen.question = "DelaysObtainingMedication"
* item[=].enableWhen.operator = #=
* item[=].enableWhen.answerBoolean = true

* item[+] insert booleanQuestion(SufficientMedication,          [[3)]],  [[Does the patient have enough medication to last until their next check-in?]])
* item[=].required = false

* item[+] insert textQuestion(PlanForObtainingMedications,      [[4)]],  [[Plan for obtaining medications to last until next check-in (enter text)]])
* item[=].required = false
