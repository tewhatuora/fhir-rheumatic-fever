
Instance: MedicationStatement-August
InstanceOf: MedicationStatement
Description: "Illustrates details of secondary prophylaxis medication given to a patient at an appointment"
Usage: #example

* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00Z" // UTC datetime
* meta insert RFTag

* contained = contained-Lignocaine-dose  // contained resource signifies lignocaine given too

* basedOn = Reference(PlannedBenzathineMedication)
* context = Reference(SecondaryProphylaxisEncounter)
* medicationReference = Reference(BenzathineMedication)
* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])

* category =  $sct#58718002 "Rheumatic fever (disorder)"

* effectiveDateTime = "2023-08-08T03:15:00Z"    // UTC datetime
* dateAsserted = "2023-08-18T03:15:00Z"    // UTC datetime

* status = #completed

* dosage.site insert RFNZCoding(299151000210101,[[Structure of left ventrogluteal region (body structure)]])
* dosage.route insert SNOMEDCoding(78421000,[[Intramuscular route (qualifier value)]])
* dosage.doseAndRate[0].doseQuantity insert UnitOfMeasureQuantity(25,[[mg]],[[mg]]) 

// removed after data dictionary May 22 2024 since the brand is now represented in the referenced Medication instance
// * note insert markdownAnnotation([[Benzathine Brand used:**Bicillin L-A**]])

 // NOTE: We MUST form this reference to satisfy the FHIR validation rule that a reference must exist between a contained instance and its container (or else runtime validation error)medication
* partOf.reference = "#contained-Lignocaine-dose"  

// *************
Instance: contained-Lignocaine-dose
InstanceOf: MedicationStatement
Usage: #inline

* medicationCodeableConcept insert NZMTMedicationCoding(10747581000116100,[[lidocaine hydrochloride anhydrous 1% (20 mg/2 mL) injection, ampoule]])
* dosage.doseAndRate[0].doseQuantity insert UnitOfMeasureQuantity(0.25,[[ml]],[[ml]])

* partOf = Reference(MedicationStatement-August)
* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* status = #completed

