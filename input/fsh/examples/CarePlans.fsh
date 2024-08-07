// //////// //////// //////// //////// //////// //////// //////// //////// //////// //////// //////// 
// Examples of care plans in different lifecycle stages



// //////// //////// //////// //////// //////// //////// //////// //////// //////// //////// //////// 
Instance: RegisteredPatient-R
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "RF care plan where patient registered and basic questionnaires completed, but no detail diagnosis or appointments yet."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00"
* meta insert RFTag
* meta insert RSecurityLabel

* identifier[NHI] insert NHIIdentifier(ZKC7284)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* insert AddressesConditionExample(SevereRfCondition)

* title = "Care plan in initial state after Sage Westbrook registered (R-labelled)"

* category insert RFNZCoding(rf-nz,[[rheumatic fever]])

* intent = #plan

* created       = "2023-06-12T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.start  = "2023-08-01T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.end    = "2033-07-31T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* status = #draft

* insert SubjectPatientReference(SageWestbrook)
* author insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* careTeam[0] = Reference(SecondaryProphylaxisCareTeam)

* supportingInfo[0] = Reference(PatientMedicationAllergyQuestionnaireResponse)          // ****
* supportingInfo[+] = Reference(MedicationsAndFollowUpGuidanceQuestionnaireResponse)    // ****
* supportingInfo[+] = Reference(PatientWhanauGoalsPreferencesQuestionnaireResponse)     // ****

* extension[lifelongSecondaryProphylaxis].url = Canonical(rf-careplan-lifelongSecondaryProphylaxis)
* extension[lifelongSecondaryProphylaxis].valueBoolean = false

* extension[statusChange][+] insert StatusChange(
    draft,
    [[2023-06-19]], 
    [[new patient]]
  )


// //////// //////// //////// //////// //////// //////// //////// //////// //////// //////// //////// 
Instance: RegisteredPatient
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "RF care plan where patient registered and basic questionnaires completed, but no detail diagnosis or appointments yet."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00"
* meta insert RFTag

* identifier[NHI] insert NHIIdentifier(ZKC7284)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* insert AddressesConditionExample(SevereRfCondition)

* title = "Care plan in initial state after Sage Westbrook registered"

* category insert RFNZCoding(rf-nz,[[rheumatic fever]])

* intent = #plan

* created       = "2023-06-12T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.start  = "2023-08-01T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.end    = "2033-07-31T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* status = #draft

* insert SubjectPatientReference(SageWestbrook)
* author insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* careTeam[0] = Reference(SecondaryProphylaxisCareTeam)

* supportingInfo[0] = Reference(PatientMedicationAllergyQuestionnaireResponse)          // ****
* supportingInfo[+] = Reference(MedicationsAndFollowUpGuidanceQuestionnaireResponse)    // ****
* supportingInfo[+] = Reference(PatientWhanauGoalsPreferencesQuestionnaireResponse)     // ****

* extension[lifelongSecondaryProphylaxis].url = Canonical(rf-careplan-lifelongSecondaryProphylaxis)
* extension[lifelongSecondaryProphylaxis].valueBoolean = false

* extension[statusChange][+] insert StatusChange(
    draft,
    [[2023-06-19]], 
    [[new patient]]
  )


// //////// //////// //////// //////// //////// //////// //////// //////// //////// //////// //////// 
Instance: SecondaryProphylaxisPlanned
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "Example of an RF care plan with secondary prophylaxis medication planned and three appointments booked."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00"
* meta insert RFTag

* identifier[NHI] insert NHIIdentifier(ZKC7284)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* title = "Care plan ready to go with all medication planned and appointments booked"

* insert AddressesConditionExample(SevereRfCondition)

* category insert RFNZCoding(rf-nz,[[rheumatic fever]])

* intent = #plan

* created       = "2023-06-12T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.start  = "2023-08-01T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.end    = "2033-07-31T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)

* status = #active

* activity[+].reference = Reference(PlannedBenzathineMedicationWithLignocaine)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-August-Booked)
* activity[+].reference = Reference(FollowUp-Dental-August-Booked)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-September-Booked)

* insert SubjectPatientReference(SageWestbrook)
* author insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* careTeam[0] = Reference(SecondaryProphylaxisCareTeam)

* supportingInfo[+] = Reference(PatientMedicationAllergyQuestionnaireResponse)
* supportingInfo[+] = Reference(MedicationsAndFollowUpGuidanceQuestionnaireResponse)
* supportingInfo[+] = Reference(PatientWhanauGoalsPreferencesQuestionnaireResponse)

* extension[lifelongSecondaryProphylaxis].url = Canonical(rf-careplan-lifelongSecondaryProphylaxis)
* extension[lifelongSecondaryProphylaxis].valueBoolean = false

* extension[statusChange][+] insert StatusChange(
    draft,
    [[2023-06-19]], 
    [[new patient]]
  )
* extension[statusChange][+] insert StatusChange(
    active,
    [[2023-07-01]], 
    [[Initial secondary prophylaxis planned]]
  )


// //////// //////// //////// //////// //////// //////// //////// //////// //////// //////// //////// 
Instance: AllAppointmentsCompleted
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "An RF care plan after the first secondary prophylaxis and follow-up appointments attended."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00"
* meta insert RFTag

* identifier[NHI] insert NHIIdentifier(ZKC7284)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* title = "Care plan with secondary propylaxis underway - two appointments completed"

* insert AddressesConditionExample(SevereRfCondition)

* category insert RFNZCoding(rf-nz,[[rheumatic fever]])

* intent = #plan

* created       = "2023-06-12T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.start  = "2023-08-01T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.end    = "2033-07-31T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* status = #active

* activity[+].reference = Reference(PlannedBenzathineMedicationWithLignocaine)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-August-Fulfilled)
* activity[+].reference = Reference(FollowUp-Dental-August-Fulfilled)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-September-Booked)

* insert SubjectPatientReference(SageWestbrook)
* author insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* careTeam[0] = Reference(SecondaryProphylaxisCareTeam)

* supportingInfo[+] = Reference(PatientMedicationAllergyQuestionnaireResponse)
* supportingInfo[+] = Reference(MedicationsAndFollowUpGuidanceQuestionnaireResponse)
* supportingInfo[+] = Reference(PatientWhanauGoalsPreferencesQuestionnaireResponse)
* supportingInfo[+] = Reference(HealthAssessmentAtSecondaryProphylaxisEncounter)      //  *****

* extension[lifelongSecondaryProphylaxis].url = Canonical(rf-careplan-lifelongSecondaryProphylaxis)
* extension[lifelongSecondaryProphylaxis].valueBoolean = false

* extension[statusChange][+] insert StatusChange(
    draft,
    [[2023-06-19]], 
    [[new patient]]
  )
* extension[statusChange][+] insert StatusChange(
    active,
    [[2023-07-01]], 
    [[Initial secondary prophylaxis planned]]
  )




// //////// //////// //////// //////// //////// //////// //////// //////// //////// //////// //////// 
Instance: OnHold
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "Example of an RF care plan that has been put ON-HOLD after the first secondary prophylaxis appointment, because the patient is overseas."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00"
* meta insert RFTag

* identifier[NHI] insert NHIIdentifier(ZKC7284)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* title = "Care plan on-hold after first appointment completed"

* insert AddressesConditionExample(SevereRfCondition)

* category insert RFNZCoding(rf-nz,[[rheumatic fever]]) 

* intent = #plan

* created       = "2023-06-12T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.start  = "2023-08-01T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.end    = "2033-07-31T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)

* status = #on-hold

* activity[+].reference = Reference(PlannedBenzathineMedication)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-August-Fulfilled)
* activity[+].reference = Reference(FollowUp-Dental-August-Booked)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-September-Booked)

* insert SubjectPatientReference(SageWestbrook)
* author insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* careTeam[0] = Reference(SecondaryProphylaxisCareTeam)

* supportingInfo[+] = Reference(PatientMedicationAllergyQuestionnaireResponse)
* supportingInfo[+] = Reference(MedicationsAndFollowUpGuidanceQuestionnaireResponse)
* supportingInfo[+] = Reference(PatientWhanauGoalsPreferencesQuestionnaireResponse)
* supportingInfo[+] = Reference(HealthAssessmentAtSecondaryProphylaxisEncounter)      //  *****

* extension[lifelongSecondaryProphylaxis].url = Canonical(rf-careplan-lifelongSecondaryProphylaxis)
* extension[lifelongSecondaryProphylaxis].valueBoolean = false

* extension[statusChange][+] insert StatusChange(
    draft,
    [[2023-06-19]], 
    [[new patient]]
  )
* extension[statusChange][+] insert StatusChange(
    active,
    [[2023-07-01]], 
    [[Initial secondary prophylaxis planned]]
  )
* extension[statusChange][+] insert StatusChange(
    on-hold,
    [[2023-08-01]], 
    [[Patient has gone on big OE]]
  )



// //////// //////// //////// //////// //////// //////// //////// //////// //////// //////// //////// 
Instance: Closed
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "Example of a RF care plan CLOSED after the patient recently went overseas."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00" 
* meta insert RFTag

* identifier[NHI] insert NHIIdentifier(ZKC7284)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* title = "Care plan closed after one appointment completed"

* insert AddressesConditionExample(SevereRfCondition)

* category insert RFNZCoding(rf-nz,[[rheumatic fever]]) 

* intent = #plan

* created       = "2023-06-12T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.start  = "2023-08-01T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.end    = "2033-07-31T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* status = #revoked

* activity[+].reference = Reference(PlannedBenzathineMedication)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-August-Fulfilled)
* activity[+].reference = Reference(FollowUp-Dental-August-Booked)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-September-Booked)

* insert SubjectPatientReference(SageWestbrook)
* author insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* careTeam[0] = Reference(SecondaryProphylaxisCareTeam)

* supportingInfo[+] = Reference(PatientMedicationAllergyQuestionnaireResponse)
* supportingInfo[+] = Reference(MedicationsAndFollowUpGuidanceQuestionnaireResponse)
* supportingInfo[+] = Reference(PatientWhanauGoalsPreferencesQuestionnaireResponse)
* supportingInfo[+] = Reference(HealthAssessmentAtSecondaryProphylaxisEncounter)      //  *****

* extension[lifelongSecondaryProphylaxis].url = Canonical(rf-careplan-lifelongSecondaryProphylaxis)
* extension[lifelongSecondaryProphylaxis].valueBoolean = false

* extension[statusChange][+] insert StatusChange(
    draft,
    [[2023-06-19]], 
    [[new patient]]
  )
* extension[statusChange][+] insert StatusChange(
    active,
    [[2023-07-01]], 
    [[Initial secondary prophylaxis planned]]
  )
* extension[statusChange][+] insert StatusChange(
    on-hold,
    [[2023-08-01]], 
    [[Patient has gone on big OE]]
  )
* extension[statusChange][+] insert StatusChange(
    revoked,
    [[2023-09-01]], 
    [[Patient no longer needs secondary prophylaxis after moving to Nepal and becoming enlightened at high elevations]]
  )