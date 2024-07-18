Instance: Consent-Data-Provisional
InstanceOf: Consent
Usage: #example
Description: "A provisional patient DATA consent recorded by Te Tai Tokerau Rheumatic Fever Service in anticipation of pending patient signed consent form"

* meta.profile = Canonical(Consent)  
* meta.versionId = "2"
* meta.lastUpdated = "2024-06-20T03:00:00Z" // UTC datetime

* status = #proposed
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"

* category = http://terminology.hl7.org/CodeSystem/consentcategorycodes#npp "Notice of Privacy Practices"

* patient insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* organization insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

* policy[0].authority = "https://www.privacy.org.nz"
* policy[=].uri = "https://www.privacy.org.nz/privacy-act-2020/"
* policy[+].authority = "https://www.privacy.org.nz"
* policy[=].uri = "https://www.privacy.org.nz/privacy-act-2020/codes-of-practice/hipc2020/"

// ********
// make a deny provision
* provision.period.start = "2023-01-21T02:30:35Z"
* provision.type = #deny

// setup a boatload of example data references to consent-protected resource instances
* provision insert ConsentInstanceDataRef( CarePlan-PatientRegistered )

* provision insert ConsentInstanceDataRef( PatientMedicationAllergyQuestionnaireResponse )
* provision insert ConsentInstanceDataRef( MedicationsAndFollowUpGuidanceQuestionnaireResponse )
* provision insert ConsentInstanceDataRef( PatientWhanauGoalsPreferencesQuestionnaireResponse )
 
* provision insert ConsentInstanceDataRef( SecondaryProphylaxisCareTeam )

// condition
* provision insert ConsentInstanceDataRef( SevereRfCondition )
 