Instance: Consent-Data-Active-Initial
InstanceOf: Consent
Usage: #example
Description: "An initial record of patient 3-year DATA consent obtained by the Te Tai Tokerau Rheumatic Fever Service"

* meta.profile = Canonical(Consent)  
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00Z" // UTC datetime

* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"

* category = http://terminology.hl7.org/CodeSystem/consentcategorycodes#npp "Notice of Privacy Practices"

* patient insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* organization insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* performer insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

* policy[0].authority = "https://www.privacy.org.nz"
* policy[=].uri = "https://www.privacy.org.nz/privacy-act-2020/"
* policy[+].authority = "https://www.privacy.org.nz"
* policy[=].uri = "https://www.privacy.org.nz/privacy-act-2020/codes-of-practice/hipc2020/"

// ********
// make a permit provision
* provision.period.start = "2023-06-12T02:30:35Z"
* provision.period.end = "2026-06-11T02:30:35Z"  
* provision.type = #permit