Profile: RheumaticFeverCareTeam
Parent: CareTeam
Title: "Rheumatic Fever Care Team"
Description: "Identifies parties involved in secondary prophylaxis (preventative treatment) for a patient.  Members typically comprise rheumatic fever service Organizations and Practitioners especially nurses"
Id: nz-rheumaticfever-careteam

* ^version = "1.0.0"
* ^jurisdiction = urn:iso:std:iso:3166#NZ
* ^purpose = "Controls CareTeam representations to model care teams involved in rheumatic fever secondary prophylaxis (preventative treatment)"
* insert metaContactDetail([[David Grainger]],[[david.grainger@middleware.co.nz]])

* meta obeys RFNZTagConstraint      // see file CategoriesLabelsTags.fsh

// elements modified from base profile
* category 1..*

//* category = $sctNZ#320741000210108 "Secondary prophylaxis team"

// ensure there is a categorizer present for OAUTH SMART scoping
* obeys CareTeamRFNZCategoryConstraint

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
// We allow here for 1 NHI ref and 0..* external refs 'national' systems. 
// This allows for mulesoft to keep and track refs between FHIR and RFCCS objects, etc. 
* identifier contains NationalSystem 0..*

// SLICE
// This slice allows clients to link (0 or more) use=USUAL identifiers to reference resources in external 'national' systems.  

* identifier[NationalSystem] ^short = "This allows a rheumatic fever patient resource to link with corresponding objects in systems like RFCCS"

* identifier[NationalSystem].use 1..1
* identifier[NationalSystem].use = #usual

* identifier[NationalSystem].system 0..1        // system Uri may (SHOULD) be specified but it's up to clients to do this.
* identifier[NationalSystem].system insert MakeProfileIdentifierSystemExample([[https://standards.digital.health.nz/ns/rfccs]])

// In this slice, clients MUST set a type taken from known external identifier type codes
* identifier[NationalSystem].type 1..1      
* identifier[NationalSystem].type from ExternalSystemIdentifierTypeValueSet

// a value MUST be given and we give an example here
* identifier[NationalSystem].value 1..1
* identifier[NationalSystem].value insert MakeProfileIdentifierExample([[RFCCS object id]],[[CTM-0000144]])

* identifier[NationalSystem].id 0..0       // don't want this kind of thing
* identifier[NationalSystem].extension 0..0       // don't want this kind of thing

// elements from base profile prohibited - NONE

// rule that checks instance has at least one category with an NZ RF code
Invariant: CareTeamRFNZCategoryConstraint
Description: "All RF CareTeam instances shall have a category #rf-nz (NZ rheumatic fever code defined in this IG)"
Severity: #error
Expression: "CareTeam.category.where(coding.code='rf-nz').exists()"
