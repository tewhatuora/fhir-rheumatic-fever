Instance: DiagnosisRiskFactorsQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Description: "Example response to diagnosis risk factors questionnaire"
Usage: #example

* meta insert RFTag

* questionnaire = Canonical(DiagnosisRiskFactorsQuestionnaire)
* status = #completed
* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* authored = "2023-08-01T10:00:00Z"

* item[0].linkId = "SoreThroat4Weeks"
* item[=].answer.valueCoding = $sct#373066001 "Yes (qualifier value)"

* item[+].linkId = "AntibioticsSoreThroat"
* item[=].answer.valueCoding = $sct#373066001 "Yes (qualifier value)"

* item[+].linkId = "AntibioticsDetails"
* item[=].answer.valueString = "Amoxicillin 500mg TDS for 10 days"

* item[+].linkId = "SoreThroatTreatedProperly"
* item[=].answer.valueCoding = $sct#373067005 "No (qualifier value)"

* item[+].linkId = "FamilyHistoryARFRHD"
* item[=].answer.valueCoding = $sct#373066001 "Yes (qualifier value)"

* item[+].linkId = "FamilyHistoryDetails"
* item[=].answer.valueString = "Mother diagnosed with rheumatic heart disease at age 25, required valve replacement"

* item[+].linkId = "FamilyHistoryRelationship"
* item[=].answer.valueCoding = $sct#40683002 "Parent (person)"

* item[+].linkId = "PastMedicalHistoryARF"
* item[=].answer.valueCoding = $sct#373067005 "No (qualifier value)"

* item[+].linkId = "EvidencePreviousRHD"
* item[=].answer.valueCoding = $sct#373067005 "No (qualifier value)"