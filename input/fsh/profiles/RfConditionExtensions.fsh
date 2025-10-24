Extension: RfConditionDiagnosticCertaintyExtension
Id:  rf-condition-diagnosticcertainty
Title: "Certainty of rheumatic fever diagnosis"
Description: "Certainty of rheumatic fever diagnosis"
Context: Condition
* value[x] only Coding
* value[x] from RFConditionDiagnosticCertaintyValueSet (required)


Extension: RfConditionRhdSeverityExtension
Id:  rf-condition-rhdseverity
Title: "Severity of rheumatic heart disease"
Description: "Severity of rheumatic heart disease determines the severity of a patient's rheumatic fever condition."
Context: Condition
* value[x] only Coding
* value[x] from RFConditionRHDSeverityValueSet (required)


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
* value[x] from RFConditionSymptomaticAtDiagnosisValueSet (required)


Extension: RfConditionAssertionDateExtension
Id:  rf-condition-assertiondate
Title: "Date of assertion of rheumatic heart disease severity"
Description: "Tracks the RF-specific date when rheumatic heart disease severity was asserted."
Context: Condition
* value[x] only dateTime


Extension: RfDiagnosisOverriddenExtension
Id:  rf-diagnosis-overridden
Title: "Rheumatic fever diagnosis overridden"
Description: "Indicates that the assigned rheumatic fever diagnosis has been overridden by a clinician"
Context: Condition
* value[x] only boolean


Extension: RfDiagnosisOverrideReasonExtension
Id:  rf-diagnosis-override-reason
Title: "Reason for overriding rheumatic fever diagnosis"
Description: "Reason for overriding the assigned rheumatic fever diagnosis"
Context: Condition
* value[x] only string