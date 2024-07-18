Instance: SecondaryProphylaxisEncounter
InstanceOf: Encounter
Usage: #example
Description: "Example where RF secondary prophylaxis delivered at a Whangarei medical centre"

* meta.profile = Canonical(Encounter)
* meta.versionId = "1"
* meta.lastUpdated = "2023-10-06T08:00:00Z"

* status = #finished

* appointment = Reference(SecondaryProphylaxisAppointment-August-Fulfilled)

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"

* subject insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])

* participant[0].individual insert ReferencePractitioner(99ZAAA,[[Isabel Injecta]])
* participant[1].individual insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])

* period.start = "2023-08-08T02:10:00Z"    // UTC datetime
* period.end = "2023-08-08T03:15:00Z"    // UTC datetime

* contained[0] = RedDiamondWhangarei

* location[0].location = Reference(RedDiamondWhangarei)

* serviceProvider insert ReferenceOrganisation(GZZ866-A,[[Red Diamond Medical Limited]])
* serviceType = $sct#360271000 "Prophylaxis - procedure intent (qualifier value)" 

