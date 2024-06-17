Instance: HealthAssessmentAtOralProphylaxisEncounter
InstanceOf: QuestionnaireResponse
Description: "Example of patient health assessment from an encounter for oral secondary prophylaxis medication."
Usage: #example

* meta.profile = Canonical(QuestionnaireResponse)
* meta.versionId = "1"
* meta.lastUpdated = "2024-06-17T07:00:00Z"

* status = #completed
* authored = "2023-08-08T01:08:00.504Z"   // UTC, assumed to be the time of information collection during the appointment
* questionnaire = Canonical(OralSecondaryProphylaxisHealthAssessmentQuestionnaire|1.0.0)

* subject insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])
* author insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* basedOn = Reference(DraftCarePlan)
* encounter = Reference(Encounter-SecondaryProphylaxisAppointment)

* item[+] insert answerItemX(MedicationIssues,                [[1)]],  [[Has the patient had any issues taking their medications?]])
* item[=].answer.valueBoolean = false 

* item[+] insert answerItemX(DelaysObtainingMedication,       [[2)]],  [[Were there delays in obtaining medications that interrupted the patient’s treatment?]])
* item[=].answer.valueBoolean = true

* item[+] insert answerItemX(DelaysObtainingMedicationDetail, [[2.1)]],[[Enter details of delays in obtaining medication that interrupted patient's treatment (enter text)]])
* item[=].answer.valueString = "Due to a spike in oral medication prescription throughout Lower Hutt, Madeleine had difficulties obtaining medication"

* item[+] insert answerItemX(SufficientMedication,            [[3)]],  [[Does the patient have enough medication to last until their next check-in?]])
* item[=].answer.valueBoolean = true

* item[+] insert answerItemX(PlanForObtainingMedications,     [[4)]],  [[Plan for obtaining medications to last until next check-in (enter text)]])
* item[=].answer.valueString = "Get more"
// end of new oral SP items