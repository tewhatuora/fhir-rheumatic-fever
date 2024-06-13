Instance: ProposedConsentBaseExample
InstanceOf: Consent
Usage: #example
Description: "Example of a provisional consent created for Te Tai Tokerau Rheumatic Fever Service.

These types of Consent are a provisional arrangement by which a lead provider org. -- Te Tai Tokerau in this case -- 
can store and access patient data in FHIR before the patient's consent has actually been obtained and 
recorded as a FHIR #active Consent instance.

This base example is before any `data.references` have been added for the protected FHIR resources.

See [*ProposedConsentCoverageExample*](Consent-ProposedConsentCoverageExample.html) for an example with resources proected by data.references"

* meta.profile = Canonical(Consent)    
* meta.versionId = "2"
* meta.lastUpdated = "2023-11-24T00:10:00Z" // UTC datetime

* status = #proposed
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"

* category = http://terminology.hl7.org/CodeSystem/consentcategorycodes#npp "Notice of Privacy Practices"
* dateTime = "2023-06-12T02:30:35.982Z"

* patient insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])
* organization insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* performer insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

* policy[0].authority = "https://www.privacy.org.nz"
* policy[=].uri = "https://www.privacy.org.nz/privacy-act-2020/"
* policy[+].authority = "https://www.privacy.org.nz"
* policy[=].uri = "https://www.privacy.org.nz/privacy-act-2020/codes-of-practice/hipc2020/"

// ********
// make a provision for access by RF provider orgs 
* provision.period.start = "2023-06-12T02:30:35Z"
* provision.period.end = "2026-06-11T02:30:35Z"     // a 3 year period in this example
* provision.type = #permit
* provision.actor[0].role = http://terminology.hl7.org/CodeSystem/extra-security-role-type#datacollector "data collector"
* provision.actor[=].reference = Reference(LeadProvidersGroup)

* provision.actor[+].role = http://terminology.hl7.org/CodeSystem/extra-security-role-type#datasubject "data subject"
* provision.actor[=].reference insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])

// * provision.data[0].meaning = #instance
// * provision.data[=].reference = Reference(ConditionExample)
// * provision.data[+].meaning = #instance
// * provision.data[=].reference = Reference(EncounterExample)

