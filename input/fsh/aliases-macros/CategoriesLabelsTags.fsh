// attach a meta.security label with the specified confidentiality code

RuleSet: RSecurityLabel
* security[+].system = "http://terminology.hl7.org/CodeSystem/v3-Confidentiality"
* security[=].code = #R
* security[=].display = "Restricted"

RuleSet: TagCoding(system,code,display)
* tag[+].system = {system}
* tag[=].code = #"{code}"
* tag[=].display = "{display}"

RuleSet: RFTag
* tag[+].system = Canonical(NzRheumaticFeverCodeSystem)
* tag[=].code = #rf-nz
* tag[=].display = "rheumatic fever"


// rule that checks instance has at least one tag with an NZ RF code
Invariant: RFNZTagConstraint
Description: "All instances shall have an #rf-nz meta.tag (the NZ rheumatic fever generic code defined in this IG)"
Severity: #error
Expression: "tag.code contains 'rf-nz'"  // The FHIRPath spec calls this the 'containership' operator
