Extension: RfConditionDiagnosticCertaintyExtension
Id:  rf-condition-diagnosticcertainty
Title: "Certainty of rheumatic fever diagnosis"
Description: "Certainty of rheumatic fever diagnosis"
Context: Condition
* value[x] only Coding
* value[x] from RheumaticFeverConditionDiagnosticCertaintyValueSet (required)


Extension: RfConditionRhdSeverityExtension
Id:  rf-condition-rhdseverity
Title: "Severity of rheumatic heart disease"
Description: "Severity of rheumatic heart disease determines the severity of a patient's rheumatic fever condition."
Context: Condition
* value[x] only Coding
* value[x] from rf-condition-rhdseverity-code (required)


Extension: RfConditionAssessmentDateExtension
Id:  rf-condition-assessmentdate
Title: "Date of assessment of rheumatic heart disease severity"
Description: "Tracks the RF-specific date when rheumatic heart disease severity was assessed."
Context: Condition
* value[x] only dateTime


Extension: RfConditionSymptomaticAtDiagnosisExtension
Id:  rf-condition-symptomaticAtDiagnosis
Title: "Symptom status at diagnosis"
Description: "Symptom status at time of rheumatic fever diagnosis"
Context: Condition
* value[x] only Coding
* value[x] from RheumaticFeverConditionSymptomaticAtDiagnosisValueSet (required)
