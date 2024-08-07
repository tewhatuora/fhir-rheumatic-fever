Instance: VirtualEncounter
InstanceOf: Encounter
Usage: #example
Description: "Example of a rheumatic fever patient encounter at a virtual location"

* meta.profile = Canonical(Encounter)
* meta.versionId = "1"
* meta.lastUpdated = "2024-07-18T04:00:00Z"
* meta insert RFTag

* status = #finished

//* appointment = Reference(FollowUp-Dental-August-Fulfilled)

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
* type =  $sct#58718002 "Rheumatic fever (disorder)"

* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])

* participant[+].individual insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])

* period.start = "2024-08-01T02:10:00Z"    // UTC datetime
* period.end = "2023-08-01T03:15:00Z"    // UTC datetime

//* serviceProvider insert ReferenceOrganisation(GZZ851-K,[[Extractive Dental Revenue Limited]])
//* serviceType = $sct#772071006 "Referral to dentist (procedure)" 

* location[+].location = Reference(OnlineLocation)  // see file DiagnosisandTreatmentLocations.fsh
* contained[0] = OnlineLocation                     // see file DiagnosisandTreatmentLocations.fsh
