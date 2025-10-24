Instance: RecurrenceDiagnosisQuestionnaire
InstanceOf: Questionnaire
Usage: #definition

Description: "Gathers information about prophylaxis and recurrence details for acute rheumatic fever diagnosis"

* url = Canonical(RecurrenceDiagnosisQuestionnaire)

* identifier[0].use = #official
* identifier[=].value = "RecurrenceDiagnosisQuestionnaire"
* identifier[=].period.start = "2024-01-01"

* date = "2024-01-01"
* status = #draft
* experimental = false
* version = "1.0.0"

* name = "RecurrenceDiagnosisQuestionnaire"
* title = "Recurrence Diagnosis Questionnaire"
* purpose = "Gathers information about prophylaxis and recurrence details for acute rheumatic fever diagnosis"
* subjectType = #Patient
* publisher = "Te Whatu Ora"

* item[0] insert pageDisplayItem(page1,[[page1]],[[Please complete this questionnaire to assess recurrence and prophylaxis details for rheumatic fever diagnosis.]])


* item[+] insert singleChoiceQuestion(ReceivingAntibioticProphylaxis,[[1)]],[[Was the patient receiving antibiotic prophylaxis?]])
* item[=].answerOption[0].valueString = "Yes"
* item[=].answerOption[+].valueString = "No - Completed Treatment"
* item[=].answerOption[+].valueString = "No - Discontinued Prematurely"
* item[=].answerOption[+].valueString = "No - Other"
* item[=].answerOption[+].valueString = "Unknown"

* item[+] insert singleChoiceQuestion(TypeOfProphylaxis,[[2)]],[[Type of Prophylaxis]])
* item[=].answerOption[0].valueString = "Benzathine Penicillin"
* item[=].answerOption[+].valueString = "Amoxicillin"
* item[=].answerOption[+].valueString = "Penicillin V"
* item[=].answerOption[+].valueString = "Erythromycin"
* item[=].answerOption[+].valueString = "Roxithromycin"
* item[=].answerOption[+].valueString = "Other"
* item[=].answerOption[+].valueString = "Unknown"
* item[=].answerOption[+].valueString = "None"

* item[+] insert textQuestion(OtherProphylaxis,[[3)]],[[Other Prophylaxis]])
* item[=].enableWhen.question = "TypeOfProphylaxis"
* item[=].enableWhen.operator = #=
* item[=].enableWhen.answerString = "Other"

* item[+] insert singleChoiceQuestion(MedicationRoute,[[4)]],[[Medication Route]])
* item[=].answerOption[0].valueString = "Intramuscular Injection"
* item[=].answerOption[+].valueString = "Subcutaneous Injection"
* item[=].answerOption[+].valueString = "Oral"

* item[+] insert singleChoiceQuestion(PrescribedFrequency,[[5)]],[[Prescribed Frequency]])
* item[=].answerOption[0].valueString = "28 Days"
* item[=].answerOption[+].valueString = "21 Days"
* item[=].answerOption[+].valueString = "Daily"
* item[=].answerOption[+].valueString = "10 Weeks"
* item[=].answerOption[+].valueString = "13 Weeks"
* item[=].answerOption[+].valueString = "Other"

* item[+] insert textQuestion(OtherPrescribedFrequency,[[6)]],[[Other Prescribed Frequency]])
* item[=].enableWhen.question = "PrescribedFrequency"
* item[=].enableWhen.operator = #=
* item[=].enableWhen.answerString = "Other"

* item[+] insert textQuestion(ProphylaxisAdherence,[[7)]],[[What was the patient's adherence to prophylaxis in the last 12 months?]])

* item[+] insert textQuestion(ProphylaxisProvider,[[8)]],[[Who was providing the prophylaxis at the time?]])

* item[+] insert dateQuestion(LastDocumentedDose,[[9)]],[[Date of last documented secondary prophylaxis benzathine dose?]])

* item[+] insert textQuestion(RiskFactorsRecurrence,[[10)]],[[Risk Factors for Recurrence?]])
