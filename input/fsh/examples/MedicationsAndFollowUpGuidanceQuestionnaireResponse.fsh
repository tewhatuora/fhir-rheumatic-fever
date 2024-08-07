Instance: MedicationsAndFollowUpGuidanceQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Description: "Example payload demonstrating guidance defined for secondary prophylaxis patient medication and follow-up."
Usage: #example

* meta.profile = Canonical(QuestionnaireResponse)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00Z"
* meta insert RFTag

* status = #completed
* authored = "2024-06-20T04:00:00Z"
* questionnaire = Canonical(MedicationsAndFollowUpGuidanceQuestionnaire|1.0.0)
* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* author insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* basedOn = Reference(RegisteredPatient)

// NOTE: item numbering does not have to match the Questionnaire because answers relate to questions through link_id

* item[0] insert answerItemX(SourceOfOralMedications,[[1)]],[[Source of oral medications? (choose one)]])
* item[=].answer.valueString = "Monthly visit from a nurse"

* item[+] insert answerItemX(CaseOnWarfarin,[[2)]],[[Case on warfarin? (Yes/No/Unknown)]])
* item[=].answer.valueCoding = $sct#373066001 "Yes (qualifier value)"

* item[+] insert answerItemX(WarfarinSupervisionService,[[2.1)]],[[Warfarin supervision service (choose one)]])
* item[=].answer.valueString = "Pharmacy"

* item[+] insert answerItemX(MonitoringResultSource,[[3)]],[[International normalised ratio (INR) monitoring result source (choose one)]])
* item[=].answer.valueString = "Éclair"

* item[+] insert answerItemX(FollowUpClinicalService,[[4)]],[[Follow-up clinical service? (choose one)]])
* item[=].answer.valueString = "GP"

* item[+] insert answerItemX(PrescribingMethod,[[5)]],[[Method of prescribing (choose one)]])
* item[=].answer.valueString = "Standing Order (local)"
