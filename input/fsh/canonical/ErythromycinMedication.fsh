Instance: ErythromycinMedication
InstanceOf: Medication
Description: "Erythromycin medication used in rheumatic fever treatment"
Usage: #definition

* meta insert RFTag

* id = "ErythromycinMedication"

* identifier[0].use = #official
* identifier[=].value = "ErythromycinMedication"
* identifier[=].period.start = "2025-09-05"

// NZMT codes are published by NZ on NZHTS
* ingredient.itemCodeableConcept insert NZMTMedicationCoding(10226211000116100,[[erythromycin]])