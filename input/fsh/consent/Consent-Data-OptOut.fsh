Instance: Consent-Data-OptOut
InstanceOf: Consent
Usage: #example
Description: "Example of consent when the patient OPTED OUT of data sharing on 01/09/2023"

* meta.profile = Canonical(Consent)  
* meta.versionId = "2"
* meta.lastUpdated = "2024-06-20T02:00:00Z" // UTC datetime

* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"

* category = http://terminology.hl7.org/CodeSystem/consentcategorycodes#npp "Notice of Privacy Practices"

* patient insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* organization insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

* policy[0].authority = "https://www.privacy.org.nz"
* policy[=].uri = "https://www.privacy.org.nz/privacy-act-2020/"
* policy[+].authority = "https://www.privacy.org.nz"
* policy[=].uri = "https://www.privacy.org.nz/privacy-act-2020/codes-of-practice/hipc2020/"

// ********
// make a neverending DENY permit provision
* provision.period.start = "2023-09-01T02:30:35Z"

* provision.type = #deny

// setup a boatload of example data references to consent-protected resource instances
* provision insert ConsentInstanceDataRef( CarePlan-AppointmentsCompleted )

* provision insert ConsentInstanceDataRef( SevereRfCondition )
* provision insert ConsentInstanceDataRef( SecondaryProphylaxisCareTeam )

* provision insert ConsentInstanceDataRef( PatientMedicationAllergyQuestionnaireResponse )
* provision insert ConsentInstanceDataRef( MedicationsAndFollowUpGuidanceQuestionnaireResponse )
* provision insert ConsentInstanceDataRef( PatientWhanauGoalsPreferencesQuestionnaireResponse )

// diagnosis detail
* provision insert ConsentInstanceDataRef( DiagnosisDetail-ECHO )
* provision insert ConsentInstanceDataRef( DiagnosisDetail-JonesCriteria )
* provision insert ConsentInstanceDataRef( DiagnosisDetail-StrepEvidence )
* provision insert ConsentInstanceDataRef( DiagnosisDetail-StrepEvidence-Secondary )

// appointments still booked
* provision insert ConsentInstanceDataRef( SecondaryProphylaxisAppointment-September-Booked )

// appointments completed
* provision insert ConsentInstanceDataRef( SecondaryProphylaxisAppointment-August-Fulfilled )
* provision insert ConsentInstanceDataRef( FollowUp-Dental-August-Fulfilled )

// recording from appointment encounters
* provision insert ConsentInstanceDataRef( SecondaryProphylaxisEncounter )
* provision insert ConsentInstanceDataRef( HealthAssessmentAtSecondaryProphylaxisEncounter )
* provision insert ConsentInstanceDataRef( DentalFollowUpEncounter )
