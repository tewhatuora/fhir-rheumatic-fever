Instance: BasicCarePlan
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "Example of the most basic RF care plan: not fully setup and indicates only that a patient registered with RF service."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "3"
* meta.lastUpdated = "2024-06-12T06:00:00Z"

* identifier[NHI] insert NHIIdentifier(SCF7824)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* insert AddressesConditionExample(SevereRfConditionExample)

* category = $sct#320721000210102 "Rheumatic fever secondary prevention care plan" 

* title = "Basic care plan representing only the registration of Madeleine Meringue"

* intent = #plan

* created       = "2023-06-12T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.start  = "2023-08-01T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.end    = "2033-07-31T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)

* status = #draft

* insert PatientInstanceReference(subject,MadeleineMeringue)

// * subject = Reference(MadeleineMeringue)
// * subject.type = https://hl7.org/fhir/R4B/codesystem-resource-types.html#resource-types-Patient
// * subject.display = "Madeleine Meringue"


* author insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* careTeam[0] = Reference(SecondaryProphylaxisCareTeam)

// * extension[0].url =Canonical(rf-careplan-onhold-reason)
// * extension[=].valueString = "Patient on holiday overseas"

// * extension[+].url = Canonical(rf-careplan-closure-reason)
// * extension[=].valueString = "Patient left New Zealand"

