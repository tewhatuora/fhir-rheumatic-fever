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

* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* author insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* basedOn = Reference(CarePlan-PatientRegistered)
* encounter = Reference(SecondaryProphylaxisEncounter)

* item[+] insert answerItemX(MedicationIssues,                [[1)]],  [[Has the patient had any issues taking their medications?]])
* item[=].answer.valueBoolean = false 

* item[+] insert answerItemX(DelaysObtainingMedication,       [[2)]],  [[Were there delays in obtaining medications that interrupted the patient’s treatment?]])
* item[=].answer.valueBoolean = true

* item[+] insert answerItemX(DelaysObtainingMedicationDetail, [[2.1)]],[[Enter details of delays in obtaining medication that interrupted patient's treatment (enter text)]])
* item[=].answer.valueString = "Due to a spike in oral medication prescriptions throughout Northland, Sage had difficulties obtaining medication"

* item[+] insert answerItemX(SufficientMedication,            [[3)]],  [[Does the patient have enough medication to last until their next check-in?]])
* item[=].answer.valueBoolean = true

* item[+] insert answerItemX(PlanForObtainingMedications,     [[4)]],  [[Plan for obtaining medications to last until next check-in (enter text)]])
* item[=].answer.valueString = "Get more"
// end of new oral SP items

* item[+] insert answerItemX(AnyOtherConcerns,[[5)]],[[Were There Any Other Concerns or Issues Identified During the Visit?]])
* item[=].answer.valueBoolean = true

* item[+] insert answerItemX(OtherConcernsDetail,[[5.1)]],[[If yes, describe details, actions taken, and follow-up planned (enter text)]])
* item[=].answer.valueString = "Sage has decided to set up her own pharmaceutical company to resolve medication supply issues."


* item[+] insert answerItemX(HealthEducationTopicsDiscussed,[[6)]],[[Health education topics discussed? (multiple choice)]])
* item[=].answer[0].valueString = "Secondary prophylaxis"
* item[=].answer[+].valueString = "Nutrition"
* item[=].answer[+].valueString = "Other"

* item[+] insert answerItemX(HealthEducationOtherDetail,[[6.1)]],[[Enter details of other health education topic discussed (enter text)]])
* item[=].answer.valueString = "Sage and I were discussing the importance of punctuality but ran out of time."

* item[+] insert answerItemX(RecentOrUpcomingAppointments,[[7)]],[[Any recent or upcoming follow-up appointments?]])
* item[=].answer.valueBoolean = true

* item[+] insert answerItemX(RecentOrUpcomingAppointmentsDetails,[[7.1)]],[[Enter details and dates of any recent or upcoming follow-up appointments (enter text)]])
* item[=].answer.valueString = "Sage has an upcoming follow-up with the cardiologist."

* item[+] insert answerItemX(PlanForNextMedicationAppointment,[[8)]],[[Comments for the next appointment (enter text)]])
* item[=].answer.valueString = "Keep it rolling"