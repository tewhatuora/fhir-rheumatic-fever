Alias: $nhi-use-code = https://nzhts.digital.health.nz/fhir/ValueSet/nhi-use-code
Profile: RheumaticFeverCarePlan
Parent: CarePlan
Title: "Rheumatic Fever CarePlan"
Description: "Profiles shared care plans used in NZ for management of rheumatic fever cases with suspected acute rheumatic fever"
Id: nz-sharedcare-rheumaticfever-careplan

* ^version = "1.0.0"
* ^jurisdiction = urn:iso:std:iso:3166#NZ
* ^purpose = "Profiles a secondary prevention care plan for a NZ rheumatic fever patient"
* insert metaContactDetail([[David Grainger]],[[david.grainger@middleware.co.nz]])

// elements modified from base profile

* author 1..1
* author only Reference(Practitioner or Organization)

* activity.reference only Reference(MedicationRequest or Appointment)

* addresses 0..*
* addresses only Reference(nz-sharedcare-rheumaticfever-condition)

* category 1..1

// * category from https://nzhts.digital.health.nz/fhir/ValueSet/rheumatic-fever-care-plan-category
// The category code is defined in a ValueSet on NZHTS but there are problems relating to the 
// fact that the code is in a temporary codesystem while we wait for SNOMED NZ edition April 2024 to roll around
// So for now, this profile requires that the canonical ValueSet will be the one defined in this IG
// * category from rf-careplan-category-code (required)

// May 29 2024 deleted one code ValueSet and fixed the category code here in profile
* category = $sct#320721000210102 "Rheumatic fever secondary prevention care plan"

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains NHI 1..1 and NationalSystem 0..*   // We allow here for any 1 or more references to identifiers in external 'national' systems.  This allows for refs to salesforce, Episurv, etc,. 

// SLICE NUMBER ONE - an NHI reference as the OFFICIAL identifier with system properly set
* identifier[NHI] ^short = "This allows a rheumatic fever careplan to link to the corresponding object in salesforce"

* identifier[NHI].use from $nhi-use-code (required)
* identifier[NHI].use = #official
* identifier[NHI].system 1..1
* identifier[NHI].system = "https://standards.digital.health.nz/ns/nhi-id" (exactly)
* identifier[NHI].value 1..1
* identifier[NHI].value insert MakeProfileIdentifierExample([[National Health Index]],[[ZKC7284]])
* identifier[NHI].id 0..0       // don't want this kind of thing
* identifier[NHI].extension 0..0       // don't want this kind of thing



// SLICE NUMBER TWO
// This slice allows (0 or more) use=USUAL identifier references to link to external 'national' systems.  

* identifier[NationalSystem] ^short = "This slice is for clients to link FHIR RF care plans to corresponding records in national systems eg. RFCCS (Salesforce)"

* identifier[NationalSystem].use 1..1
* identifier[NationalSystem].use = #usual

* identifier[NationalSystem].system 0..1        // system Uri may (SHOULD) be specified but it's up to clients to do this.
* identifier[NationalSystem].system insert MakeProfileIdentifierSystemExample([[Uri that defines the type of external identifier]])

// In this slice, clients MUST set a type taken from known external identifier type codes
* identifier[NationalSystem].type 1..1      
* identifier[NationalSystem].type from ExternalSystemIdentifierTypeValueSet

// a value MUST be given and we give an example here
* identifier[NationalSystem].value 1..1
* identifier[NationalSystem].value insert MakeProfileIdentifierExample([[Some Salesforce CarePlan object id]],[[CTM-0000144]])

* identifier[NationalSystem].id 0..0       // don't want this kind of thing
* identifier[NationalSystem].extension 0..0       // don't want this kind of thing

* instantiatesCanonical only Canonical(PlanDefinition)

* created ^short = "Created must be a dateTime value in UTC timezone on the FHIR representation" 

* period 1..1
* period ^short = "Period start | end must be dateTime values in UTC timezone on the FHIR representation" 

* subject only Reference(nz-sharedcare-rheumaticfever-patient)

* title 1..1

// extensions
* extension contains
  CarePlanStatusHistory named statusChange 0..*
    and
  RfCarePlanLifelongSecondaryProphylaxisExtension named lifelongSecondaryProphylaxis 0..1

* extension[statusChange] ^short = "Accumulates a history of status changes in the care plan"
* extension[lifelongSecondaryProphylaxis] ^short = "Indicates that a rheumatic fever patient has been recommended lifelong prophylaxis"


// elements prohibited
* activity.detail 0..0
* activity.modifierExtension 0..0
* implicitRules 0..0
* language 0..0
