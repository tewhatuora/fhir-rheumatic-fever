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
* insert TagCoding($sct,58718002,[[Rheumatic fever (disorder)]])

// rule that checks instance has at least one tag with an RF code
Invariant: RFTagConstraint
Description: "All CarePlan instances shall be tagged with the rheumatic fever SNOMED code 58718002"
Severity: #error
Expression: "tag.code contains 58718002"
