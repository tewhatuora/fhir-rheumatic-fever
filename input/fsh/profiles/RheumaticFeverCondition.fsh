Profile: RheumaticFeverCondition
Parent: NzCondition
Title: "Rheumatic Fever Condition"
Description: "Extends NzCondition to add classifiers for RHD severity, diagnostic certainty and symptomatic status and specifies groups of diagnosic evidence that can be attached."
Id: nz-sharedcare-rheumaticfever-condition

* ^version = "1.0.0"
* ^jurisdiction = urn:iso:std:iso:3166#NZ
* ^purpose = "Adds classifiers for severity, diagnostic certainty and symptomatic status and specifies groups of diagnosic evidence to be attached"
* insert metaContactDetail([[David Grainger]],[[david.grainger@middleware.co.nz]])

// elements modified
* subject only Reference(Patient)
* onset[x] only dateTime

* recordedDate ^short = "The date (UTC dateTime) of diagnosis" 
* onsetDateTime ^short = "The date (UTC dateTime) when rheumatic fever was thought to have begun"

* recorder only Reference(Practitioner)

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains NationalSystem 0..*

// This slice allows (0 or more) use=USUAL identifier references for linking to external 'national' systems.  

* identifier[NationalSystem] ^short = "This stores the identifier of the corresponding record in the national system (RFCCS) to let it be kept in sync with FHIR."

* identifier[NationalSystem].use 1..1
* identifier[NationalSystem].use = #usual

* identifier[NationalSystem].system 0..1        // system Uri may (SHOULD) be specified but it's up to clients to do this.
* identifier[NationalSystem].system insert MakeProfileIdentifierSystemExample([[Uri that defines the type of external identifier]])

// In this slice, clients MUST set a type taken from known external identifier type codes
* identifier[NationalSystem].type 1..1      
* identifier[NationalSystem].type from ExternalSystemIdentifierTypeValueSet

// a value MUST be given and we give an example here
* identifier[NationalSystem].value 1..1
* identifier[NationalSystem].value insert MakeProfileIdentifierExample([[Salesforce object id]],[[CON-0206]])

* identifier[NationalSystem].id 0..0       // don't want this kind of thing
* identifier[NationalSystem].extension 0..0       // don't want this kind of thing

// bind to the permissible SNOMED codes for NZ RF diagnosis.
* code 1..1
* code ^short = "Must be one of the diagnosis codes"
* code from rf-condition-diagnosis-code (required)

* stage 0..0      // don't need this as there are no formal stage conventions in RF diagnosis

* evidence 0..3
* evidence ^short = "Up to 3 Observation instances may be present (linked) to represent RF diagnosis detail"
* evidence.code from rf-observation-diagnosisgroup-code (required)
* evidence.code ^short = "Identifies the GROUPing of diagnosis data in the linked Observation instance"
* evidence.detail only Reference(Observation)
* evidence.extension 0..0
* evidence.modifierExtension 0..0

* severity 0..1

// extensions
* extension contains
  RfConditionRhdSeverityExtension named rhdSeverity 0..1 
    and
  RfConditionDiagnosticCertaintyExtension named diagnosticCertainty 0..1
    and
  RfConditionAssessmentDateExtension named assessmentDate 0..1
    and
  RfConditionSymptomaticAtDiagnosisExtension named symptomStatusAtDiagnosis 0..1

* extension[assessmentDate] ^short = "date (dateTime value in UTC timezone) of RHD severity assessment"
* extension[diagnosticCertainty] ^short = "This certainty code value must be interpreted in conjunction with the patient's diagnosis in Condition.code"

// elements prohibited
* implicitRules 0..0
* language 0..0