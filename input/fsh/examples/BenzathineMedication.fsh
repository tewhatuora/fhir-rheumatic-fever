Instance: BenzathineMedication
InstanceOf: Medication
Description: "Example of medication used in rheumatic fever secondary prophylaxis (prevention) as NZMT terminology"
Usage: #example

* meta.profile = Canonical(Medication)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00Z"
* meta insert RFTag

// NZMT codes are published by NZ on NZHTS
* code insert NZMTMedicationCoding(43924201000116108,[[Bicillin LA 1.2 million units/2.3 mL (900 mg/2.3 mL) injection: suspension, 1 x 2.3 mL syringe]])
* ingredient.itemCodeableConcept insert NZMTMedicationCoding(10134211000116105,[[benzathine penicillin (as benzathine benzylpenicillin tetrahydrate)]])

