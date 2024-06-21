Instance: CarePlan-AppointmentsCompleted
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "An RF care plan after the first secondary prophylaxis and follow-up appointments attended."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "5"
* meta.lastUpdated = "2024-06-20T02:00:00Z"

* identifier[NHI] insert NHIIdentifier(SCF7824)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* title = "Care plan with secondary propylaxis underway - two appointments completed"

* insert AddressesConditionExample(SevereRfCondition)

* category = $sct#320721000210102 "Rheumatic fever secondary prevention care plan" 

* intent = #plan

* created       = "2023-06-12T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.start  = "2023-08-01T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.end    = "2033-07-31T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* status = #active

* activity[+].reference = Reference(PlannedBenzathineMedicationWithLignocaine)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-August-Fulfilled)
* activity[+].reference = Reference(FollowUp-Dental-August-Fulfilled)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-September-Booked)

* insert SubjectPatientReference(MadeleineMeringue)
* author insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* careTeam[0] = Reference(SecondaryProphylaxisCareTeam)

* supportingInfo[+] = Reference(PatientMedicationAllergyQuestionnaireResponse)
* supportingInfo[+] = Reference(MedicationsAndFollowUpGuidanceQuestionnaireResponse)
* supportingInfo[+] = Reference(PatientWhanauGoalsPreferencesQuestionnaireResponse)
* supportingInfo[+] = Reference(HealthAssessmentAtSecondaryProphylaxisEncounter)      //  *****

* extension[lifelongSecondaryProphylaxis].url = Canonical(rf-careplan-lifelongSecondaryProphylaxis)
* extension[lifelongSecondaryProphylaxis].valueBoolean = false

// * extension[0].url =Canonical(rf-careplan-onhold-reason)
// * extension[=].valueString = "Patient on holiday overseas"

// * extension[+].url = Canonical(rf-careplan-closure-reason)
// * extension[=].valueString = "Patient left New Zealand"

