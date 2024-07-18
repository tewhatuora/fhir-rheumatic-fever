ValueSet: RheumaticFeverConditionSymptomaticAtDiagnosisValueSet
Id: rf-condition-symptomaticatdiagnosis-code
Title: "Codes for rheumatic heart disease symptom status at time of diagnosis"
Description:  "This value set defines codes which describe whether a patient was symptomatic at the time of rheumatic fever diagnosis"
* ^version = "1.0.0"
* ^experimental = false
* ^status = #draft

* $sct#264931009 "Symptomatic (qualifier value)"
* $sct#67335000  "Asymptomatic diagnosis of (contextual qualifier) (qualifier value)"

// Consider moving to NZHTS canonical in the future but for the meantime this IG is the canonical definition of this valueset
// * ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/rheumatic-fever-rheumatic-heart-disease-severity"

