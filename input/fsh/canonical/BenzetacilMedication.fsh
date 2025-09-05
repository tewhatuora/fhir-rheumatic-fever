Instance: BenzetacilMedication
InstanceOf: Medication
Description: "Benzetacil branded benzathine penicillin medication used in rheumatic fever secondary prophylaxis"
Usage: #definition

* meta insert RFTag

* id = "BenzetacilMedication"

* identifier[0].use = #official
* identifier[=].value = "BenzetacilMedication"
* identifier[=].period.start = "2025-09-05"

* code insert NZMTMedicationCoding(50217831000117102,[[Benzetacil 900 mg (1.2 million units) injection: powder for, 1 x 900 mg vial]])
* ingredient.itemCodeableConcept insert NZMTMedicationCoding(10134211000116105,[[benzathine penicillin (as benzathine benzylpenicillin tetrahydrate)]])
