Instance: DentalFollowUpEncounter
InstanceOf: Encounter
Usage: #example
Description: "Example of a rheumatic fever patient encounter for dental specialist follow-up"

* meta.profile = Canonical(Encounter)
* meta.versionId = "1"
* meta.lastUpdated = "2024-06-20T00:00:00Z"

* status = #finished

* appointment = Reference(FollowUp-Dental-August-Fulfilled)

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"

* subject insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])

* participant[+].individual insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])

* period.start = "2023-08-15T02:10:00Z"    // UTC datetime
* period.end = "2023-08-15T03:15:00Z"    // UTC datetime

* serviceProvider insert ReferenceOrganisation(GAX123-C,[[Push Pull Dental Company]])
* serviceType = $sct#772071006 "Referral to dentist (procedure)" 

* location[+].location = Reference(PushPullDentalClinic)
* contained[0] = PushPullDentalClinic
