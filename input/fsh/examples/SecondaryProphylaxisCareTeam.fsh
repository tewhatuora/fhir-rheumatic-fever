Instance: SecondaryProphylaxisCareTeam
InstanceOf: RheumaticFeverCareTeam
Description: "Example of secondary prophylaxis care team membership"
Usage: #example

* meta.profile = Canonical(RheumaticFeverCareTeam|1.0.0)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00"
* meta insert RFTag

* identifier[NationalSystem] insert SalesforceCareTeamIdentifier([[CTM-0016606]])

//* category = $sctNZ#320741000210108 "Secondary prophylaxis team"
* category insert RFNZCoding(rf-nz,[[rheumatic fever]])

* name = "Sage Westbrook's secondary prophylaxis team"
* status = #active
// lead provider
* participant[0].member insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* participant[=].period.start = "2024-05-14"    // no end date => an active participant

// lead nurse
* participant[+].role[0] insert CareTeamRole(224535009,[[Registered nurse]])
* participant[=].member insert ReferencePractitioner(98ZZQJ,[[Isabel Injecta]])
* participant[=].onBehalfOf insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* participant[=].period.start = "2024-05-14"    // no end date => an active participant

// shared care provider
* participant[+].member insert ReferenceOrganisation(G0M744-C,[[Taranaki Rheumatic Fever Secondary Prevention Service]])
* participant[=].period.start = "2024-05-14"    // no end date => an active participant

// lead nurse
* participant[+].role[0] insert CareTeamRole(224535009,[[Registered nurse]])
* participant[=].member insert ReferencePractitioner(95ZZEJ,[[Felicity Faraway]])
* participant[=].onBehalfOf insert ReferenceOrganisation(G0M744-C,[[Taranaki Rheumatic Fever Secondary Prevention Service]])
* participant[=].period.start = "2024-05-14"    // no end date => an active participant
