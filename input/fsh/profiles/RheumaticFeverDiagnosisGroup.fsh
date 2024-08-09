Profile: RheumaticFeverDiagnosisGroup
Parent: Observation
Title: "Rheumatic Fever Diagnosis Group"
Description: "This profile constrains the codes valid on an Observation so it can represent groups of rheumatic fever diagnosis data."
Id: nz-rheumaticfever-diagnosisgroup

* ^version = "1.0.0"
* ^jurisdiction = urn:iso:std:iso:3166#NZ
* ^purpose = "Constraints coding of a standard FHIR Observation for use in RF diagnosis representation"
* insert metaContactDetail([[David Grainger]],[[david.grainger@middleware.co.nz]])

* meta obeys RFNZTagConstraint      // see file CategoriesLabelsTags.fsh

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains NationalSystem 0..*

// This slice allows (0 or more) use=USUAL identifier references for linking to external 'national' systems.  

* identifier[NationalSystem] ^short = "This identifier is used to sync the FHIR Observation instance with its national system (RFCCS) record."

* identifier[NationalSystem].use 1..1
* identifier[NationalSystem].use = #usual

* identifier[NationalSystem].system 0..1        // system Uri may (SHOULD) be specified but it's up to clients to do this.
* identifier[NationalSystem].system insert MakeProfileIdentifierSystemExample([[https://standards.digital.health.nz/ns/rfccs]])

// In this slice, clients MUST set a type taken from known external identifier type codes
* identifier[NationalSystem].type 1..1      
* identifier[NationalSystem].type from ExternalSystemIdentifierTypeValueSet

// a value MUST be given
* identifier[NationalSystem].value 1..1
* identifier[NationalSystem].value insert MakeProfileIdentifierExample([[RFCCS object id]],[[OBS-0207]])

* identifier[NationalSystem].id 0..0       // don't want this kind of thing
* identifier[NationalSystem].extension 0..0       // don't want this kind of thing

// bind to the permissible SNOMED codes for NZ RF diagnosis groups.
* code 1..1
* code ^short = "For rheumatic fever data, must be one of three diagnosis group codes"
* code from RFDiagnosisGroupValueSet (required)   // see ValueSet

* component.code from RFDiagnosisObservationCodingValueSet
* component.code ^short = "Code must uniquely identify component within the Observation group, and be drawn from the RF NZ diagnosis ValueSet"

* hasMember 0..1
* hasMember only Reference(Observation)

// remove standard Observation elements not needed
* value[x] 0..0
* contained 0..0
* specimen 0..0
* device 0..0
* referenceRange 0..0
