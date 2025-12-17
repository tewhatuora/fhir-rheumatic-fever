Instance: PenicillinMedication
InstanceOf: Medication
Description: "Penicillin VK (phenoxymethylpenicillin) medication used in rheumatic fever treatment"
Usage: #definition

* meta insert RFTag

* id = "PenicillinMedication"

* identifier[0].use = #official
* identifier[=].value = "PenicillinMedication"
* identifier[=].period.start = "2025-09-05"

// NZMT codes are published by NZ on NZHTS
* ingredient.itemCodeableConcept insert NZMTMedicationCoding(10180401000116109,[[phenoxymethylpenicillin]])