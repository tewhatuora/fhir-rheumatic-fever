Instance: SecondaryProphylaxisCareTeam
InstanceOf: RheumaticFeverCareTeam
Description: "Example of secondary prophylaxis care team membership"
Usage: #example

* meta.profile = Canonical(RheumaticFeverCareTeam|1.0.0)
* meta.versionId = "3"
* meta.lastUpdated = "2024-05-14T05:00:00Z"
* meta insert RFTag

* identifier[NationalSystem] insert SalesforceCareTeamIdentifier([[CTM-0016606]])

* name = "Sage Westbrook's secondary prophylaxis team"
* status = #active
// lead provider
* participant[0].member insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

// lead nurse
* participant[+].role[0] insert CareTeamRole(224535009,[[Registered nurse]])
* participant[=].member insert ReferencePractitioner(98ZZQJ,[[Isabel Injecta]])
* participant[=].onBehalfOf insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

// shared care provider
* participant[+].member insert ReferenceOrganisation(G0M744-C,[[Taranaki Rheumatic Fever Secondary Prevention Service]])

// lead nurse
* participant[+].role[0] insert CareTeamRole(224535009,[[Registered nurse]])
* participant[=].member insert ReferencePractitioner(95ZZEJ,[[Felicity Faraway]])
* participant[=].onBehalfOf insert ReferenceOrganisation(G0M744-C,[[Taranaki Rheumatic Fever Secondary Prevention Service]])
