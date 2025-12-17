Instance: RoxithromycinMedication
InstanceOf: Medication
Description: "Roxithromycin medication used in rheumatic fever treatment"
Usage: #definition

* meta insert RFTag

* id = "RoxithromycinMedication"

* identifier[0].use = #official
* identifier[=].value = "RoxithromycinMedication"
* identifier[=].period.start = "2025-09-05"

// NZMT codes are published by NZ on NZHTS
* ingredient.itemCodeableConcept insert NZMTMedicationCoding(10070901000116100,[[roxithromycin]])
