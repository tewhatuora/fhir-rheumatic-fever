Instance: TardocillinMedication
InstanceOf: Medication
Description: "Tardocillin branded benzathine penicillin medication used in rheumatic fever secondary prophylaxis"
Usage: #definition

* meta insert RFTag

* id = "TardocillinMedication"

* identifier[0].use = #official
* identifier[=].value = "TardocillinMedication"
* identifier[=].period.start = "2025-09-05"

* code insert NZMTMedicationCoding(50320661000117106,[[Tardocillin 1200 injection: suspension, 1 x 4 mL vial]])
* ingredient.itemCodeableConcept insert NZMTMedicationCoding(48123881000116100,[[benzathine penicillin (as benzathine benzylpenicillin tetrahydrate) + lidocaine]])

