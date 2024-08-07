Instance: DiagnosisEncounter
InstanceOf: Encounter
Usage: #example
Description: "Encounter capturing context of a patient's rheumatic fever diagnosis"

* meta.profile = Canonical(Encounter)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00Z"
* meta insert RFTag

* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"

* serviceType insert SNOMEDCoding(22232009,[[Hospital (environment)]])
* type =  $sct#58718002 "Rheumatic fever (disorder)"

* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* participant.individual insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])

* serviceProvider insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

* period.start = "2023-03-12T02:00:00Z"    // UTC datetime

* contained[0] = PublicHospital             // see DiagnosisandTreatmentLocations.fsh
* contained[+] = SageWestbrookHomeAddress
* contained[+] = WhangareiGirlsHighSchool   // see DiagnosisandTreatmentLocations.fsh

* location[0].location = Reference(PublicHospital)              // see DiagnosisandTreatmentLocations.fsh
* location[+].location = Reference(SageWestbrookHomeAddress)
* location[+].location = Reference(WhangareiGirlsHighSchool)    // see DiagnosisandTreatmentLocations.fsh
