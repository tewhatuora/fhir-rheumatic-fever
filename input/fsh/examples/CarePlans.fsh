// Examples of care plans in different statuses

Instance: CarePlan-AppointmentsCompleted
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "An RF care plan after the first secondary prophylaxis and follow-up appointments attended."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "5"
* meta.lastUpdated = "2024-07-10T05:00:00Z"

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



Instance: CarePlan-Closed
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "Example of an RF care plan that has been closed because the patient went overseas."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "3"
* meta.lastUpdated = "2024-07-10T05:00:00Z"

* identifier[NHI] insert NHIIdentifier(SCF7824)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* title = "Care plan closed with only one appointment completed"

* insert AddressesConditionExample(SevereRfCondition)

* category = $sct#320721000210102 "Rheumatic fever secondary prevention care plan" 

* intent = #plan

* created       = "2023-06-12T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.start  = "2023-08-01T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.end    = "2033-07-31T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* status = #revoked

* activity[+].reference = Reference(PlannedBenzathineMedication)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-August-Fulfilled)
* activity[+].reference = Reference(FollowUp-Dental-August-Booked)
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

// * extension[closureReason].url = Canonical(rf-careplan-closure-reason)
// * extension[closureReason].valueString = "Patient has become enlightened and now lives in Nepal"



Instance: CarePlan-OnHold
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "Example of an RF care plan that has gone on-hold, after the first secondary prophylaxis appointment has been attended."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "4"
* meta.lastUpdated = "2024-07-10T05:00:00Z"

* identifier[NHI] insert NHIIdentifier(SCF7824)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* title = "Care plan went on hold after first appointment completed"

* insert AddressesConditionExample(SevereRfCondition)

* category = $sct#320721000210102 "Rheumatic fever secondary prevention care plan" 

* intent = #plan

* created       = "2023-06-12T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.start  = "2023-08-01T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.end    = "2033-07-31T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)

* status = #on-hold

* activity[+].reference = Reference(PlannedBenzathineMedication)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-August-Fulfilled)
* activity[+].reference = Reference(FollowUp-Dental-August-Booked)
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

// * extension[onHoldReason].url = Canonical(rf-careplan-onhold-reason)
// * extension[onHoldReason].valueString = "Patient has gone on the big OE"




Instance: CarePlan-PatientRegistered-R
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "RF care plan where patient registered and basic questionnaires completed, but no detail diagnosis or appointments yet."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "1"
* meta.lastUpdated = "2024-07-10T05:00:00Z"
* meta insert RSecurityLabel

* identifier[NHI] insert NHIIdentifier(SCF7824)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* insert AddressesConditionExample(SevereRfCondition)

* title = "Care plan in initial state after Madeleine Meringue registered (R-labelled)"

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




Instance: CarePlan-PatientRegistered
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "RF care plan where patient registered and basic questionnaires completed, but no detail diagnosis or appointments yet."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "5"
* meta.lastUpdated = "2024-07-10T05:00:00Z"

* identifier[NHI] insert NHIIdentifier(SCF7824)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* insert AddressesConditionExample(SevereRfCondition)

* title = "Care plan in initial state after Madeleine Meringue registered"

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

* extension[statusChangeEvent].url = Canonical(rf-careplan-statusChangeHistory)

* extension[statusChangeEvent][+] insert StatusChangeEvent(
    $careplan-status-codes#unknown, 
    $careplan-status-codes#draft,
    [[2023-06-19]], 
    [[new patient]]
  )

// * extension[statusChangeHistory][+].extension[fromStatus].valueCoding = RequestStatus#unknown
// * extension[statusChangeHistory][=].extension[toStatus].valueCoding = RequestStatus#draft
// * extension[statusChangeHistory][=].extension[changeDate].valueDate = "2023-06-19"
// * extension[statusChangeHistory][=].extension[changeReason].valueString = "new patient"




Instance: CarePlan-SecondaryProphylaxisPlanned
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "Example of an RF care plan with secondary prophylaxis medication planned and three appointments booked."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "4"
* meta.lastUpdated = "2024-07-10T05:00:00Z"

* identifier[NHI] insert NHIIdentifier(SCF7824)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* title = "Care plan ready to go with all medication planned and appointments booked"

* insert AddressesConditionExample(SevereRfCondition)

* category = $sct#320721000210102 "Rheumatic fever secondary prevention care plan" 

* intent = #plan

* created       = "2023-06-12T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.start  = "2023-08-01T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.end    = "2033-07-31T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)

* status = #active

* activity[+].reference = Reference(PlannedBenzathineMedicationWithLignocaine)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-August-Booked)
* activity[+].reference = Reference(FollowUp-Dental-August-Booked)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-September-Booked)

* insert SubjectPatientReference(MadeleineMeringue)
* author insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* careTeam[0] = Reference(SecondaryProphylaxisCareTeam)

* supportingInfo[+] = Reference(PatientMedicationAllergyQuestionnaireResponse)
* supportingInfo[+] = Reference(MedicationsAndFollowUpGuidanceQuestionnaireResponse)
* supportingInfo[+] = Reference(PatientWhanauGoalsPreferencesQuestionnaireResponse)

* extension[lifelongSecondaryProphylaxis].url = Canonical(rf-careplan-lifelongSecondaryProphylaxis)
* extension[lifelongSecondaryProphylaxis].valueBoolean = false


