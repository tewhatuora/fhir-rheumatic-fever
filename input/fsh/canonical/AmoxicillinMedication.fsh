Instance: AmoxicillinMedication
InstanceOf: Medication
Description: "Amoxicillin medication used in rheumatic fever treatment"
Usage: #definition

* meta insert RFTag

* id = "AmoxicillinMedication"

* identifier[0].use = #official
* identifier[=].value = "AmoxicillinMedication"
* identifier[=].period.start = "2025-09-05"

// NZMT codes are published by NZ on NZHTS
* ingredient.itemCodeableConcept insert NZMTMedicationCoding(20023151000116107,[[amoxicillin]])