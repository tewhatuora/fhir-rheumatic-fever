Instance: Consent-Data-OnBehalfByRelatedPerson
InstanceOf: Consent
Usage: #example
Description: "An active, 3 year, patient DATA consent given on patient's behalf by their relative, as obtained by the Te Tai Tokerau Rheumatic Fever Service, with sample `data.references`"

* meta.profile = Canonical(Consent)    

* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"

* category = http://terminology.hl7.org/CodeSystem/consentcategorycodes#npp "Notice of Privacy Practices"

* patient insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* organization insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* performer[+].type = "RelatedPerson"
* performer[=].reference = "#contained-Related-Person"  // instance defined below
* performer[=].display = "Beryl Hackett"

* contained = contained-Related-Person  // contained resource identifies the relative who gave consent on patient's behalf

* policy[0].authority = "https://www.privacy.org.nz"
* policy[=].uri = "https://www.privacy.org.nz/privacy-act-2020/"
* policy[+].authority = "https://www.privacy.org.nz"
* policy[=].uri = "https://www.privacy.org.nz/privacy-act-2020/codes-of-practice/hipc2020/"

// ********
// make a provision for access by RF provider orgs 
* provision.period.start = "2023-06-12T02:30:35Z"
* provision.period.end = "2026-06-11T02:30:35Z"     
* provision.type = #permit

* provision insert ConsentInstanceDataRef( RegisteredPatient )

* provision insert ConsentInstanceDataRef( PatientMedicationAllergyQuestionnaireResponse )
* provision insert ConsentInstanceDataRef( MedicationsAndFollowUpGuidanceQuestionnaireResponse )
* provision insert ConsentInstanceDataRef( PatientWhanauGoalsPreferencesQuestionnaireResponse )
 
* provision insert ConsentInstanceDataRef( SecondaryProphylaxisCareTeam )

// condition
* provision insert ConsentInstanceDataRef( SevereRfCondition )

// //// //// //// //// //// //// //// //// ////
// //// //// //// //// //// //// //// //// ////
// Make a contained resource identifying a RelatedPerson who gave Consent eg. patient's mum

Alias: $relatedrelationshiptypeCS = http://terminology.hl7.org/CodeSystem/v3-RoleCode

Instance: contained-Related-Person
InstanceOf: RelatedPerson
Usage: #inline
Description: "An example of RelatedPerson -- Beryl -- as Sage's legal guardian who gave consent on Sage's behalf"

* patient insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* name.given = "Beryl"
* name.family = "Hackett"
* relationship = 	$sct#58626002 "Legal guardian (person)" // should be a code in RFRelatedPersonRoleValueSet