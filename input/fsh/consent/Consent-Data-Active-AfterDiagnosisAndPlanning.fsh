Instance: Consent-Data-Active-AfterDiagnosisAndPlanning
InstanceOf: Consent
Usage: #example
Description: "An active, 3 year, patient DATA consent obtained by the Te Tai Tokerau Rheumatic Fever Service, with sample `data.references`"

* meta.profile = Canonical(Consent)  
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00" // UTC datetime

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
// make a permit provision
* provision.period.start = "2023-06-12T02:30:35Z"
* provision.period.end = "2026-06-11T02:30:35Z"  
* provision.type = #permit

// setup a boatload of example data references to consent-protected resource instances
* provision insert ConsentInstanceDataRef( SecondaryProphylaxisPlanned )

* provision insert ConsentInstanceDataRef( PatientMedicationAllergyQuestionnaireResponse )
* provision insert ConsentInstanceDataRef( MedicationsAndFollowUpGuidanceQuestionnaireResponse )
* provision insert ConsentInstanceDataRef( PatientWhanauGoalsPreferencesQuestionnaireResponse )

* provision insert ConsentInstanceDataRef( SecondaryProphylaxisCareTeam )

// condition
* provision insert ConsentInstanceDataRef( SevereRfConditionWithDiagnosisEvidence )

// diagnosis detail
* provision insert ConsentInstanceDataRef( DiagnosisEncounter )
* provision insert ConsentInstanceDataRef( DiagnosisDetail-ECHO )
* provision insert ConsentInstanceDataRef( DiagnosisDetail-JonesCriteria )
* provision insert ConsentInstanceDataRef( DiagnosisDetail-StrepEvidence )
* provision insert ConsentInstanceDataRef( DiagnosisDetail-StrepEvidence-Secondary )

// appointments booked
* provision insert ConsentInstanceDataRef( SecondaryProphylaxisAppointment-August-Booked )
* provision insert ConsentInstanceDataRef( FollowUp-Dental-August-Booked )
* provision insert ConsentInstanceDataRef( SecondaryProphylaxisAppointment-September-Booked )

 



