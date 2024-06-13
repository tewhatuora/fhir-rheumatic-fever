Instance: SecondaryProphylaxisAugustEncounterBundle
InstanceOf: Bundle
Description: "Example of a Bundled POST which creates instances of Encounter, MedicationStatement and QuestionnaireResponse in one operation"
Usage: #example

* meta.profile = Canonical(Bundle)
* meta.versionId = "2"
* meta.lastUpdated = "2024-05-17T06:10:00Z"

* type = #transaction

// See rulesets/RFSecondaryProphylaxisAppointmentRecording.fsh for code of the three ruleset macros used below
// Bundle ENTRY 1/3 Encounter
* entry[0].fullUrl = "http://example.org/fhir/Encounter/1001"         // Made up identfier for referencing purposes 
* entry[=].request.method = #POST
* entry[=].request.url = "Encounter"
* entry[=].resource.resourceType = "Encounter"
* entry[=].resource insert makeEncounterContent

// ENTRY 2/3 Medication Statement
* entry[+].fullUrl = "http://example.org/fhir/MedicationStatement/1002"      // Made up identfier for referencing purposes
* entry[=].request.method = #POST
* entry[=].request.url = "MedicationStatement"
* entry[=].resource.resourceType = "MedicationStatement"
* entry[=].resource insert makeMedStmtContent

// ENTRY 3/3 QuestionnaireResponse Statement
* entry[+].fullUrl = "http://example.org/fhir/QuestionnaireResponse/1003"    // Made up identfier for referencing purposes
* entry[=].request.method = #POST
* entry[=].request.url = "QuestionnaireResponse"
* entry[=].resource.resourceType = "QuestionnaireResponse"
* entry[=].resource insert makeQRContent
