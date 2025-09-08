Instance: LentocillinMedication
InstanceOf: Medication
Description: "Lentocillin branded benzathine penicillin medication used in rheumatic fever secondary prophylaxis"
Usage: #definition

* meta insert RFTag

* id = "LentocillinMedication"

* identifier[0].use = #official
* identifier[=].value = "LentocillinMedication"
* identifier[=].period.start = "2025-09-05"

* code insert NZMTMedicationCoding(50320671000117101,[[Lentocilin S 1200 (1 x 1.2 million units vial, 1 x 60 mg/4 mL ampoule), 1 pack, composite pack]])
* ingredient.itemCodeableConcept insert NZMTMedicationCoding(10134211000116105,[[benzathine penicillin (as benzathine benzylpenicillin tetrahydrate)]])
