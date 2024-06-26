Instance: PlannedBenzathineMedication
InstanceOf: RheumaticFeverMedicationRequest
Description: "Illustrates a request for active secondary prophylaxis medication that can appear in a rheumatic fever care plan"
Usage: #example

* meta.profile = Canonical(RheumaticFeverMedicationRequest|1.0.0)
* meta.versionId = "3"
* meta.lastUpdated = "2024-05-29T04:00:00Z" // UTC datetime

* authoredOn = "2023-07-12T04:22:55.965Z"

* basedOn = Reference(CarePlan-SecondaryProphylaxisPlanned)

* intent = #plan

* medicationReference = Reference(BenzathineMedication)

* performer insert ReferencePractitioner(99ZAAA,[[Isabel Injecta]])

* requester insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

* subject insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])

* status = #active

* dosageInstruction.site insert SNOMEDCoding(78333006,[[Structure of gluteus medius muscle (body structure)]])
* dosageInstruction.route insert SNOMEDCoding(78421000,[[Intramuscular route (qualifier value)]])
* dosageInstruction.doseAndRate[0].doseQuantity insert UnitOfMeasureQuantity(25,[[mg]],[[mg]]) 
//* moved to extension below -- dosageInstruction.additionalInstruction insert SNOMEDCoding(1511000175108,[[Every twenty eight days (qualifier value)]]) 

* extension[medicationFrequency].url = Canonical(rf-medicationrequest-medicationfrequency)
* extension[medicationFrequency].valueCoding = $sct#1511000175108 "Every twenty eight days (qualifier value)"

* dispenseRequest.validityPeriod.start = "2023-08-01T00:12:00Z"
* dispenseRequest.validityPeriod.end = "2026-07-31T00:12:00Z"
