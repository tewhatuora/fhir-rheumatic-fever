Instance: DraftCarePlan
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "Example of an RF care plan where setup is complete but no secondary prevention activities yet planned."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "3"
* meta.lastUpdated = "2024-06-12T06:00:00Z"

* identifier[NHI] insert NHIIdentifier(SCF7824)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* insert AddressesConditionExample(SevereRfConditionExample)

* title = "Draft care plan for Madeleine Meringue (no secondary prevention planned)"

* category = $sct#320721000210102 "Rheumatic fever secondary prevention care plan" 

* intent = #plan

* created       = "2023-06-12T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.start  = "2023-08-01T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.end    = "2033-07-31T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* status = #draft

* insert PatientInstanceReference(subject,MadeleineMeringue)
* author insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* careTeam[0] = Reference(SecondaryProphylaxisCareTeam)

* supportingInfo[0] = Reference(PatientMedicationAllergyQuestionnaireResponse)          // ****
* supportingInfo[+] = Reference(MedicationsAndFollowUpGuidanceQuestionnaireResponse)    // ****
* supportingInfo[+] = Reference(PatientWhanauGoalsPreferencesQuestionnaireResponse)     // ****

* extension[lifelongSecondaryProphylaxis].url = Canonical(rf-careplan-lifelongSecondaryProphylaxis)
* extension[lifelongSecondaryProphylaxis].valueBoolean = false

// * extension[0].url =Canonical(rf-careplan-onhold-reason)
// * extension[=].valueString = "Patient on holiday overseas"

// * extension[+].url = Canonical(rf-careplan-closure-reason)
// * extension[=].valueString = "Patient left New Zealand"

