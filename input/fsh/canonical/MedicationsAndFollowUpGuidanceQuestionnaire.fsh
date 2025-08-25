Instance: MedicationsAndFollowUpGuidanceQuestionnaire
InstanceOf: Questionnaire
Usage: #definition

Description: "Gathers information in secondary prophylaxis planning which guides subsequent medication appointments and follow-up"

* url = Canonical(MedicationsAndFollowUpGuidanceQuestionnaire)

* identifier[0].use = #official
* identifier[=].value = "MedicationsAndFollowUpGuidanceQuestionnaire"
* identifier[=].period.start = "2023-10-16"

* date = "2023-11-10"
* status = #draft
* experimental = false
* version = "1.0.1"

* name = "MedicationsAndFollowUpGuidanceQuestionnaire"
* title = "Medications and Follow-up Guidance Questionnaire"
* purpose = "Gathers information in secondary prophylaxis planning which guides subsequent medication appointments and follow-up"
* subjectType = #Patient
* publisher = "Te Whatu Ora"

* item[0] insert pageDisplayItem(page1,[[page1]],[[Please complete this questionnaire to guide practitioners carrying out rheumatic fever secondary prophylaxis.]])

* item[+] insert singleChoiceQuestion(SourceOfOralMedications,[[1)]],[[Source of oral medications? (choose one)]])
* item[=].answerOption[0].valueString = "GP prescription"
* item[=].answerOption[+].valueString = "3 monthly visit from a nurse"
* item[=].answerOption[+].valueString = "Monthly visit from a nurse"
* item[=].answerOption[+].valueString = "Pick-up from a pharmacy"
* item[=].answerOption[+].valueString = "Other"


* item[+] insert singleChoiceQuestion(CaseOnWarfarin,[[2)]],[[Case on warfarin? (Yes/No/Unknown)]])
* item[=].answerValueSet = Canonical(QualifiedYesNoAnswerValueSet)      // Unknown is meaningful to the RF service

* item[+] insert singleChoiceQuestion(WarfarinSupervisionService,[[2.1)]],[[Warfarin supervision service (choose one)]])
* item[=].enableWhen.question = "CaseOnWarfarin"
* item[=].enableWhen.operator = #=
* item[=].enableWhen.answerCoding = $sct#373066001 "Yes (qualifier value)"
* item[=].answerOption[0].valueString = "GP"
* item[=].answerOption[+].valueString = "Pharmacy"
* item[=].answerOption[+].valueString = "Hospital service"
* item[=].answerOption[+].valueString = "Patient"
* item[=].answerOption[+].valueString = "Whanau"

* item[+] insert singleChoiceQuestion(MonitoringResultSource,[[3)]],[[International normalised ratio (INR) monitoring result source (choose one)]])
* item[=].answerOption[0].valueString = "Patient"
* item[=].answerOption[+].valueString = "Parent"
* item[=].answerOption[+].valueString = "Éclair"
* item[=].answerOption[+].valueString = "GP"
* item[=].answerOption[+].valueString = "Pharmacy"
* item[=].answerOption[+].valueString = "INROnline"
* item[=].answerOption[+].valueString = "Other"

* item[+] insert singleChoiceQuestion(FollowUpClinicalService,[[4)]],[[Follow-up clinical service? (choose one)]])
* item[=].answerOption[0].valueString = "Specialist"
* item[=].answerOption[+].valueString = "GP"
* item[=].answerOption[+].valueString = "To be determined"

* item[+] insert singleChoiceQuestion(PrescribingMethod,[[5)]],[[Method of prescribing (choose one)]])
* item[=].answerOption[+].valueString = "Community Medication Authority"
* item[=].answerOption[+].valueString = "Standing Order (local)"
* item[=].answerOption[+].valueString = "Standing Order (national)"
* item[=].answerOption[+].valueString = "Individual prescription"

* item[+] insert singleChoiceQuestion(ReasonOnOralSecondaryProphylaxis,[[6)]],[[Reason on Oral Secondary Prophylaxis (choose one)]])
* item[=].answerOption[0].valueCoding = $sct#407563006 "Treatment not tolerated (situation)"
* item[=].answerOption[+].valueCoding = $sct#91936005 "Allergy to penicillin (finding)"
* item[=].answerOption[+].valueCoding = $sct#292954005 "Penicillin adverse reaction (disorder)"
* item[=].answerOption[+].valueCoding = $sct#724073007 "Declined by caregiver (qualifier value)"
* item[=].answerOption[+].valueCoding = $sct#182895007 "Drug declined by patient (situation)"
* item[=].answerOption[+].valueCoding = $sct#74964007 "Other"
