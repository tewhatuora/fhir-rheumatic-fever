Instance: Encounter-Diagnosis
InstanceOf: Encounter
Usage: #example
Description: "Encounter capturing context of a patient's rheumatic fever diagnosis"

* meta.profile = Canonical(Encounter)
* meta.versionId = "2"
* meta.lastUpdated = "2024-05-17T08:00:00Z"

* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"

* serviceType insert SNOMEDCoding(22232009,[[Hospital (environment)]])

* subject insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])
* participant.individual insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])

* period.start = "2023-03-12T02:00:00Z"    // UTC datetime

* contained[0] = StarshipHospital
* contained[+] = MadeleinesHome
* contained[+] = MasseyHighSchool

* location[0].location = Reference(StarshipHospital)
* location[+].location = Reference(MadeleinesHome)
* location[+].location = Reference(MasseyHighSchool)






