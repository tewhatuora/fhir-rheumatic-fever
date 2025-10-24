Instance: BenzathineMedication
InstanceOf: Medication
Description: "Benzathine penicillin medication"
Usage: #definition

* meta insert RFTag

* id = "BenzathineMedication"

* identifier[0].use = #official
* identifier[=].value = "BenzathineMedication"
* identifier[=].period.start = "2025-09-05"

// NZMT codes are published by NZ on NZHTS
* code insert NZMTMedicationCoding(43924201000116108,[[Bicillin LA 1.2 million units/2.3 mL (900 mg/2.3 mL) injection: suspension, 1 x 2.3 mL syringe]])
* ingredient.itemCodeableConcept insert NZMTMedicationCoding(10134211000116105,[[benzathine penicillin (as benzathine benzylpenicillin tetrahydrate)]])

