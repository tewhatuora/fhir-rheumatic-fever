ValueSet: RFRelatedPersonRoleValueSet
Id: rf-careteam-participant-role-code
Title: "Rheumatic fever patient care team participant role codes"
Description:  "This value set defines relationships people can take in a rheumatic fever patient care team, and can also be used to define a consent-on-behalf relationship"
* ^version = "1.0.0"
* ^experimental = false
* ^status = #active

// 18/10/2023 this valueset is defined entirely from codes included from SNOMED, however 
//  one code is new in the SNOMED NZ edition and not officially published until April 2024
//  This means the valueset published on NZHTS does not work expand so client cannot lookup the codes
//
// This ValueSet has to be published in this IG until clients can expand the valueset on NZHTS

// * ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/rheumatic-fever-care-team-participant-role"

* $sct#133932002  "Caregiver (person)"
* $sct#58626002   "Legal guardian (person)"

// bring in the local code for SNOMED NZ edition concept of "Support person" 
* include codes from system $rfnzt where concept descendant-of #NZ-specific-role-codes

// * $sct#394738000  "Other related persons (person)"    // This code seems to have disappeared from SNOMED and has been superceded by #O Other as included below

// Also bring in these codes from HL7 related person relationship type
// among other things this include brings in http://terminology.hl7.org/CodeSystem/v2-0131#O "Other" 
* include codes from valueset http://hl7.org/fhir/ValueSet/relatedperson-relationshiptype
