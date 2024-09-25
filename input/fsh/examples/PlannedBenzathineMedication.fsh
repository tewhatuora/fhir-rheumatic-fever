Instance: PlannedBenzathineMedication
InstanceOf: RheumaticFeverMedicationRequest
Description: "Illustrates a request for active secondary prophylaxis medication that can appear in a rheumatic fever care plan"
Usage: #example

* meta.profile = Canonical(RheumaticFeverMedicationRequest)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00Z" // UTC datetime
* meta insert RFTag

* authoredOn = "2023-07-12T04:22:55.965Z"

* basedOn = Reference(SecondaryProphylaxisPlanned)

* intent = #plan

* medicationReference = Reference(BenzathineMedication)

* performer insert ReferencePractitioner(98ZZQJ,[[Isabel Injecta]])

* requester insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])

* status = #active

* dosageInstruction.site insert SNOMEDCoding(78333006,[[Structure of gluteus medius muscle (body structure)]])
* dosageInstruction.route insert SNOMEDCoding(78421000,[[Intramuscular route (qualifier value)]])
* dosageInstruction.doseAndRate[0].doseQuantity insert UnitOfMeasureQuantity(25,[[mg]],[[mg]]) 
//* moved to extension below -- dosageInstruction.additionalInstruction insert SNOMEDCoding(1511000175108,[[Every twenty eight days (qualifier value)]]) 

* extension[medicationFrequency].url = Canonical(rf-medicationrequest-medicationfrequency)
* extension[medicationFrequency].valueCoding = $sct#1511000175108 "Every twenty eight days (qualifier value)"

* dispenseRequest.validityPeriod.start = "2023-08-01T00:12:00Z"
* dispenseRequest.validityPeriod.end = "2026-07-31T00:12:00Z"
