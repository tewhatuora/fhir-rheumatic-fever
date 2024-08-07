Instance: SecondaryProphylaxisEncounter
InstanceOf: Encounter
Usage: #example
Description: "Example where RF secondary prophylaxis delivered at a Whangarei medical centre"

* meta.profile = Canonical(Encounter)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00Z"
* meta insert RFTag

* status = #finished

* appointment = Reference(SecondaryProphylaxisAppointment-August-Fulfilled)

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
* type =  $sct#58718002 "Rheumatic fever (disorder)"

* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])

* participant[0].individual insert ReferencePractitioner(98ZZQJ,[[Isabel Injecta]])
* participant[1].individual insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])

* period.start = "2023-08-08T02:10:00Z"    // UTC datetime
* period.end = "2023-08-08T03:15:00Z"    // UTC datetime

* contained = RedDiamondWhangarei                           // see DiagnosisandTreatmentLocations.fsh
* location[0].location.reference = "#RedDiamondWhangarei"   // see DiagnosisandTreatmentLocations.fsh

* serviceProvider insert ReferenceOrganisation(GZZ866-A,[[Red Diamond Medical Limited]])
* serviceType = $sct#360271000 "Prophylaxis - procedure intent (qualifier value)" 

