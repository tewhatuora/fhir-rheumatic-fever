Instance: RecurrenceDiagnosisQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Description: "Example response to recurrence diagnosis questionnaire"
Usage: #example

* meta insert RFTag

* questionnaire = Canonical(RecurrenceDiagnosisQuestionnaire)
* status = #completed
* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* authored = "2023-08-01T10:00:00Z"

* item[0].linkId = "ReceivingAntibioticProphylaxis"
* item[=].answer.valueString = "No - Discontinued Prematurely"

* item[+].linkId = "TypeOfProphylaxis"
* item[=].answer.valueString = "Benzathine Penicillin"

* item[+].linkId = "MedicationRoute"
* item[=].answer.valueString = "Intramuscular Injection"

* item[+].linkId = "PrescribedFrequency"
* item[=].answer.valueString = "28 Days"

* item[+].linkId = "ProphylaxisAdherence"
* item[=].answer.valueString = "Patient missed 3 appointments in last 6 months due to transport issues"

* item[+].linkId = "ProphylaxisProvider"
* item[=].answer.valueString = "Community nursing service"

* item[+].linkId = "LastDocumentedDose"
* item[=].answer.valueDate = "2023-06-15"