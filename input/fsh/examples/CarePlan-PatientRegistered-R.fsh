Instance: CarePlan-PatientRegistered-R
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "RF care plan where patient registered and basic questionnaires completed, but no detail diagnosis or appointments yet."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "1"
* meta.lastUpdated = "2024-06-20T10:00:00Z"
* meta insert RSecurityLabel

* identifier[NHI] insert NHIIdentifier(SCF7824)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* insert AddressesConditionExample(SevereRfCondition)

* title = "Draft care plan for Madeleine Meringue (no secondary prevention planned)"

* category = $sct#320721000210102 "Rheumatic fever secondary prevention care plan" 

* intent = #plan

* created       = "2023-06-12T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.start  = "2023-08-01T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.end    = "2033-07-31T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* status = #draft

* insert SubjectPatientReference(MadeleineMeringue)
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

