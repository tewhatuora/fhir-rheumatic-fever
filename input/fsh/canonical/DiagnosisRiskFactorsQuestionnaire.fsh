Instance: DiagnosisRiskFactorsQuestionnaire
InstanceOf: Questionnaire
Usage: #definition

Description: "Gathers risk factor information during rheumatic fever diagnosis assessment"

* url = Canonical(DiagnosisRiskFactorsQuestionnaire)

* identifier[0].use = #official
* identifier[=].value = "DiagnosisRiskFactorsQuestionnaire"
* identifier[=].period.start = "2024-01-01"

* date = "2024-01-01"
* status = #draft
* experimental = false
* version = "1.0.0"

* name = "DiagnosisRiskFactorsQuestionnaire"
* title = "Diagnosis Risk Factors Questionnaire"
* purpose = "Gathers risk factor information during rheumatic fever diagnosis assessment"
* subjectType = #Patient
* publisher = "Te Whatu Ora"

* item[0] insert pageDisplayItem(page1,[[page1]],[[Please complete this questionnaire to assess risk factors for rheumatic fever diagnosis.]])

* item[+] insert singleChoiceQuestion(SoreThroat4Weeks,[[1)]],[[Did the patient have a sore throat in the four weeks prior to onset?]])
* item[=].answerValueSet = Canonical(QualifiedYesNoAnswerValueSet)

* item[+] insert singleChoiceQuestion(AntibioticsSoreThroat,[[2)]],[[Did the patient receive antibiotics for a sore throat?]])
* item[=].answerValueSet = Canonical(QualifiedYesNoAnswerValueSet)

* item[+] insert textQuestion(AntibioticsDetails,[[3)]],[[Antibiotics used for sore throat / Strep A treatment]])
* item[=].enableWhen.question = "AntibioticsSoreThroat"
* item[=].enableWhen.operator = #=
* item[=].enableWhen.answerCoding = $sct#373066001 "Yes (qualifier value)"

* item[+] insert singleChoiceQuestion(SoreThroatTreatedProperly,[[4)]],[[Was the patient's sore throat appropriately treated?]])
* item[=].answerValueSet = Canonical(QualifiedYesNoAnswerValueSet)

* item[+] insert singleChoiceQuestion(FamilyHistoryARFRHD,[[5)]],[[Family History of ARF / RHD?]])
* item[=].answerValueSet = Canonical(QualifiedYesNoAnswerValueSet)

* item[+] insert textQuestion(FamilyHistoryDetails,[[5.1)]],[[Details of Family History]])
* item[=].enableWhen.question = "FamilyHistoryARFRHD"
* item[=].enableWhen.operator = #=
* item[=].enableWhen.answerCoding = $sct#373066001 "Yes (qualifier value)"

* item[+] insert multiChoiceQuestion(FamilyHistoryRelationship,[[6)]],[[Family History Relationship to Patient]])
* item[=].enableWhen.question = "FamilyHistoryARFRHD"
* item[=].enableWhen.operator = #=
* item[=].enableWhen.answerCoding = $sct#373066001 "Yes (qualifier value)"
* item[=].answerOption[0].valueCoding = $sct#375005 "Sibling (person)"
* item[=].answerOption[+].valueCoding = $sct#40683002 "Parent (person)"
* item[=].answerOption[+].valueCoding = $sct#38312007 "Grandparent (person)"
* item[=].answerOption[+].valueCoding = $sct#25211005 "Aunt (person)"
* item[=].answerOption[+].valueCoding = $sct#38048003 "Uncle (person)"
* item[=].answerOption[+].valueCoding = $sct#55538000 "Cousin (person)"
* item[=].answerOption[+].valueCoding = $sct#125677006 "Other relative (person)"

* item[+] insert singleChoiceQuestion(PastMedicalHistoryARF,[[7)]],[[Any past medical history that may have been ARF?]])
* item[=].answerValueSet = Canonical(QualifiedYesNoAnswerValueSet)

* item[+] insert singleChoiceQuestion(EvidencePreviousRHD,[[8)]],[[Any evidence of previous RHD?]])
* item[=].answerValueSet = Canonical(QualifiedYesNoAnswerValueSet)

* item[+] insert textQuestion(PMHXDetailsARFRHD,[[9)]],[[Details of PMHX of possible ARF / RHD]])
* item[=].enableWhen[0].question = "PastMedicalHistoryARF"
* item[=].enableWhen[=].operator = #=
* item[=].enableWhen[=].answerCoding = $sct#373066001 "Yes (qualifier value)"
* item[=].enableWhen[+].question = "EvidencePreviousRHD"
* item[=].enableWhen[=].operator = #=
* item[=].enableWhen[=].answerCoding = $sct#373066001 "Yes (qualifier value)"
* item[=].enableBehavior = #any