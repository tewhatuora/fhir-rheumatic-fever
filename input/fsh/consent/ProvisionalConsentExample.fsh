Instance: ProvisionalConsentExample
InstanceOf: Consent
Usage: #example
Description: "Example of a 3 month provisional data consent.

Provisional consents are needed when an organisation creates FHIR data about a
patient but has not yet officially received their consent.  This can arise in real world health scenarios
when the first opportunity for a patient to read and sign a consent form occurs some time after their registration
with representations in FHIR."

* meta.profile = Canonical(Consent)    
* meta.versionId = "2"
* meta.lastUpdated = "2023-11-24T00:10:00Z" // UTC datetime

* status = #proposed
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"

* category = http://terminology.hl7.org/CodeSystem/consentcategorycodes#npp "Notice of Privacy Practices"
* dateTime = "2023-06-12T02:30:35.982Z"

* patient insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])
* organization insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

* policy[0].authority = "https://www.privacy.org.nz"
* policy[=].uri = "https://www.privacy.org.nz/privacy-act-2020/"
* policy[+].authority = "https://www.privacy.org.nz"
* policy[=].uri = "https://www.privacy.org.nz/privacy-act-2020/codes-of-practice/hipc2020/"

// ********
// make a provision for access by RF provider orgs 
* provision.period.start = "2023-06-12T02:30:35Z"
* provision.period.end = "2023-09-11T02:30:35Z"     // a 3 month period in this example
* provision.type = #permit
* provision.actor[0].role = http://terminology.hl7.org/CodeSystem/extra-security-role-type#datacollector "data collector"
* provision.actor[=].reference insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

* provision.actor[+].role = http://terminology.hl7.org/CodeSystem/extra-security-role-type#datasubject "data subject"
* provision.actor[=].reference insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])

// * provision.data[0].meaning = #instance
// * provision.data[=].reference = Reference(ConditionExample)
// * provision.data[+].meaning = #instance
// * provision.data[=].reference = Reference(EncounterExample)

// setup a boatload of example data references to consent-protected resource instances
* provision insert ConsentInstanceDataRef( LeadProvidersGroup )
* provision insert ConsentInstanceDataRef( SevereRfConditionExample )
* provision insert ConsentInstanceDataRef( SecondaryProphylaxisCareTeam )
* provision insert ConsentInstanceDataRef( Encounter-SecondaryProphylaxisAppointment )

* provision insert ConsentInstanceDataRef( PatientMedicationAllergyQuestionnaireResponse )
* provision insert ConsentInstanceDataRef( MedicationsAndFollowUpGuidanceQuestionnaireResponse )
* provision insert ConsentInstanceDataRef( PatientWhanauGoalsPreferencesQuestionnaireResponse )
* provision insert ConsentInstanceDataRef( RFPatientHealthAssessmentQuestionnaireResponse )

* provision insert ConsentInstanceDataRef( CarePlanWithOneAppointmentCompleted ) 
