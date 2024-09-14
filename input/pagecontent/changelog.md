# Changelog

<!-- markdownlint-disable MD024 -->

## v0.5.0 updates

- Updated CapabilityStatement to specify DSH/Connector Plane security and generate an OpenAPI Specification via HNZ Digital Tooling
- Updated OpenAPI specification links
- Documented `Resource-Context` custom header requirements in developer guide page, CapabilityStatement and OpenAPI specification
- Upgraded NZBase IG dependency to v3.1 (current).  Due to this update, the NZ Base `NzPatient` profile now contains the `interpreter-required` extension which this IG re-uses (instead of the old local extension named `interpreterRequired` which has been dropped).  Example patient instances updated to use the NZ Base extension.

---


## v0.4.9 updates

- Updates to consent documentation.
- The coding of relationship type 'Other' has changed to use the code `#O` (upper case letter 'O') from the [FHIR/HL7 relationship type codes](https://hl7.org/fhir/R4B/valueset-relatedperson-relationshiptype.html).

---

## v0.4.8 updates

### National system (RFCCS) identifiers

- Consolidated national identifier system type codes into the IG CodeSystem (formerly a separate CodeSystem)
- All national identifiers (slices on resource.Identifier) now have the system Url set to the [HISO standard NamingSystem](https://build.fhir.org/ig/HL7NZ/nzbase/namingSystems.html) value `https://standards.digital.health.nz/ns/rf-ccs-id`

### eSAM identifiers

The patient's address in the example [diagnosis encounter](Encounter-DiagnosisEncounter.html) now has an eSAM identifier with system Url set to the [HISO standard NamingSystem](https://build.fhir.org/ig/HL7NZ/nzbase/namingSystems.html) value `https://standards.digital.health.nz/ns/nz-address-id`

### Examples

- In [Patient with care team](Patient-SageWestbrookAndWhanau.html), membership has been adjusted to include a care team member with role/relationship type 'Other' using the correct coding.

### Doc

- Corrected Consent FHIR data models
- Revised Terminology documentation page

---

## v0.4.7 fixes

Renamed capability statement instance.
Reinstated `Consent.performer` in consent examples.

---

## v0.4.6 Updated canonical Url

The canonical base Url for the IG has been updated to https://fhir-ig.digital.health.nz/rheumatic-fever for publishing at the official **HISO IG site**.

This IG now appears in the HISO Implementation Guide [index (UAT)](https://fhir-ig.digital.health.nz/)

---

## v0.4.5 Coding fixes and general updates

### Classifiers for OAUTH scoping of RF data

Filtering classifiers added to various RF resource types to enable OAUTH scoping as follows:

- `Appointment`s have `.serviceCategory` set to $sct#58718002
- `Encounter`s have `.type` set to $sct#58718002
- `MedicationStatement`s have `.category` set to $sct#58718002

### RF resource tagging

- To enable OAuth scoped access controls, all RF resource instances *should* be tagged with the RF SNOMED code (`meta.tag.code=58718002`)
- The RF profiles on CarePlan, Condition, CareTeam, Observation (DiagnosisGroup), MedicationRequest and Patient resource types now have an invariant requiring the RF SNOMED code tag.
- All example instances have been RF-tagged
- A tagging section has been added to the [data standards](dataStandards.html) page.

### Consolidation of SNOMED NZ Edition terminology into one local CodeSystem

Testing has shown that applications cannot practically use codes defined in the **NZ SNOMED edition** because the New Zealand Health Terminology
Service (NZHTS) is unable to support lookup and validation of these codes.  (This stems from SNOMED affiliate licensing restrictions affecting the NZ Edition.)

As NZ SNOMED terms are in effect unusable for NZ applications, all these codes have been brought into a CodeSystem in the IG, so the IG itself defines the codes.

The IG now has a single local CodeSystem which consolidates all the special codes needed for New Zealand rheumatic fever FHIR data representation.  
This CodeSystem includes codes which previously sat in their own systems eg. the RF diagnostic certainty codes.

The various ValueSets used throughout this IG now draw all their codes from the new common IG CodeSystem, or from applicable public terminology systems (http://snomed.sct/info, http://nzmt.org.nz).

The following IG artefacts have changed to draw some or all of their codes from the new common local CodeSystem:

- `RFConditionDiagnosticCertaintyValueSet`
- `RFConditionRHDSeverityValueSet`
- `RFConditionSummaryDiagnosisValueSet`
- `RFDiagnosisGroupValueSet`
- `RFRelatedPersonRoleValueSet` (renamed from `RFCareTeamParticipantRoleValueSet`)
- `RFMedicationRequestMedicationFrequencyValueSet` (renamed from `RheumaticFeverMedicationRequestMedicationFrequencyValueSet`)
- `RFMedicationAllergyValueSet` (renamed from `RheumaticFeverMedicationAllergyValueSet`)

**All instance examples featuring NZ-specific codings now use the local codesystem Uri in this IG instead of a SNOMED NZ edition Uri**

### DiagnosisGroup (Observation) profile strengthened

The `DiagnosisGroup` (Observation) profile now requires:

1. All **Observation instances** (group-level) to be coded using local codes instead of SNOMED codes (however, the same code numbers are used as per the SNOMED terms.)
2. All **Observation component items** are to be coded from a new ValueSet `RFDiagnosisObservationCodingValueSet` which draws all the diagnosis SNOMED codes plus one special local code `#448021000210106` (Indolent carditis (disorder))

### Revised categories in CarePlans and Conditions

The following profiles now require use of the local code `#rf-nz` to categorise all instances:

- `CarePlan` profile requires instances to be categorised `#rf-nz` (was SNOMED #320721000210102)
- `Condition` profile requires instances to be dual-categorised `#rf-nz`, SNOMED #58718002 (was SNOMED category only)
- `CareTeam` profile requires instances to be categorised `#rf-nz` (was SNOMED #320741000210108)

### Miscellaneous fixes

- Altered relationship role ValueSet to include all codes from the (as per binding of FHIR `RelatedPerson.relationship`)
- Medication statement examples - removed incorrect profile reference  
- Fixed a publisher error on the example Uri for the code system of the national identifier slice on identifier in CarePlan, CareTeam, Condition and Observation profiles.
- Adjusted patient care team for example [SageWestbrookAndWhanau](Patient-SageWestbrookAndWhanau.html) to demonstrate a legal guardian type contact.

---

## v0.4.4 CarePlan profile status history and examples updates

### Profiles

- [RF CarePlan profile](StructureDefinition-nz-rheumaticfever-careplan.html)
  - Added a new complex extension to capture CarePlan status change with dates and reasons.
  - Removed the old specific extensions which tracked the reason a CarePlan instance entered on-hold or closed status.
  - Updated CarePlan example instances to illustrate build-up of status change history

### Examples

- Reworked `Encounter` example instances to use official test data
  - Encounter service providers now use HPI Organisation identifiers from [HPI test data](https://www.tewhatuora.govt.nz/health-services-and-programmes/health-identity/information-for-it-vendors-and-developers#health-provider-index-hpi)
  - Encounters at hospital and clinic `Location`s now use HPI Facility identifiers from [HPI test data](https://www.tewhatuora.govt.nz/health-services-and-programmes/health-identity/information-for-it-vendors-and-developers#health-provider-index-hpi)
  - Sample school location now identified with its (real) School Numbers from the New Zealand [Schools Directory](https://www.educationcounts.govt.nz/directories/list-of-nz-schools#)
- Revised patient example instances and all references to use official NHI test identifiers

### Documentation

- Added RFCCS to FHIR CarePlan status mapping information to the data mapping page.

## v0.4.3 MVP phase 2 updates

**Separated rheumatic fever API from shared care IG into the dedicated IG.**

- The Artifacts page is now simply the IG publisher output list format with standard artifact groupings.  Only consent items and canonical instances definitions are grouped separately.

### Revised consent data design

- Rewrote [consent-based access control](consentBasedAccessControl.html) page.
- Updated Consent data models to address consent to treatment and opt-out.
- Updated all Consent examples

### Questionnaires

- Added new [questionnaire for health assessment at oral SP encounters](Questionnaire-OralSecondaryProphylaxisHealthAssessmentQuestionnaire.html)
- Added a new item *Prescribing method* (DD item M8) to the **Medications and Followup Guidance Questionnaire** and example.

### Updated examples

- Added new example questionnaire response [HealthAssessmentAtOralProphylaxisEncounter](QuestionnaireResponse-HealthAssessmentAtOralProphylaxisEncounter.html)
- All `Observation` example instances now have a `.performer`
- All `Encounter` example instances now have a `.serviceProvider`
- Added new examples for a FOLLOW-UP (dentist) appointment and encounter recording.
- CarePlan examples renamed and refactored
- Added example of a security-labelled resource instance (for revised data access control scheme)

## v0.4.2 phase 2 updates part 2 (June 2024)

### Profiles

- Added new profile on Observation resource [Rheumatic Fever Diagnosis Group](StructureDefinition-nz-rheumaticfever-diagnosisgroup.html)
- [RF CarePlan profile](StructureDefinition-nz-rheumaticfever-careplan.html)
  - Added new boolean extension to indicate lifelong secondary prophylaxis
- [RF Condition profile](StructureDefinition-nz-rheumaticfever-condition.html)
  - Added constraint and description on .evidence[] element for linking diagnosis Observations
  - Added descriptions to extension elements to clarify usage
- [RF medication request profile](/StructureDefinition-nz-rheumaticfever-medicationrequest.html)
  - Added definitional detail to `dosageInstruction.route` and `.site`

### Examples

- A new [Condition with diagnosis evidence](Condition-SevereRfConditionWithDiagnosisEvidence.html) example illustrates linking Observations via `evidence[].detail` references.
- Examples of enhanced diagnosis linked to a Condition
  - [ECHO RHD assessment](Observation-DiagnosisDetail-ECHO.html)
  - [Jones Criteria](Observation-DiagnosisDetail-JonesCriteria.html)
  - [Strep evidence](Observation-DiagnosisDetail-StrepEvidence.html)
- The various example `CarePlan`s now illustrate use of the **lifelong secondary prophylaxis** extension and have been revised so that creation adn period dates are UTC `dateTime` values.
- SP `Appointment`s and `Encounter`s now have `.serviceType` = $sct#360271000 "Prophylaxis"  
- Sage Westbrook example patient - changed language code to #en (English) to fix BCP-47 terminology publisher validation problem
- Pania Punga example patient - changed language code for Maori to #mi to fix BCP-47 terminology publisher validation problem

### Terminology

- Added a new [ValueSet](ValueSet-rf-observation-diagnosisgroup-code.html) to constrain SNOMED codes used on [Rheumatic Fever Diagnosis Group](StructureDefinition-nz-rheumaticfever-diagnosisgroup.html)s
- Adjusted **medication frequency codes** //allowed by the [ValueSet](ValueSet-rf-medicationrequest-frequency-code.html) to include every 10|13 weeks.
- Improved Terminology Overview page

### Miscellany

- Changed date values to *dateTime* datatype in elements that need to be accurately convert to/from UTC representation
- Publisher-generated narrative text suppressed in canonical Questionnaires and CareTeam
- Updated FHIR data models

---

## v0.4.0 phase updates 2 part 1 (May 2024)

### [Data model designs](rheumatic-fever-data-models.html)

- Revised **secondary prophylaxis medication planning and recording** model: Added nested lignocaine medication request and statement; simplified appointments.

- Added new model of **diagnosis data representation**

- Added new model for **planning/recording of other care appointments**

### Definitions

- Moved the [**LeadProvidersGroup**](CareTeam-LeadProvidersGroup.html) from Examples to Definitions section

- Expanded the membership of the [**LeadProvidersGroup**](CareTeam-LeadProvidersGroup.html) to encompass all 18 NZ Rheumatic Fever Secondary Prevention Services.

### Profiles

[Condition](StructureDefinition-nz-rheumaticfever-condition.html) RF profile:

- two new extensions for RF-specific diagnosis attributes

1. Date of RHD severity assessment (Condition.**assessmentDate**)
1. Symptom status at time of RF diagnosis (Condition.**symptomStatusAtDiagnosis**)

### Examples

#### Shared care provider scenario

These examples have been adjusted to correctly reflect the Taranaki RF SP service as a shared care provider by referencing its HPI org Id **G0M744-C**

- [Sage Westbrook's care team](CareTeam-SecondaryProphylaxisCareTeam.html)
- [Booked september appointment](Appointment-SecondaryProphylaxisAppointment-September-Booked.html)

#### Condition and diagnosis extensions

- Expanded [RfCondition](Condition-SevereRfCondition.html) example to use a new extension (symptomStatusAtDiagnosis) and reference a diagnosis Encounter (see below)

#### Medication planning and recording

- Renamed the planned medication example to [*PlannedBenzathineMedication*](MedicationRequest-PlannedBenzathineMedication.html)
- Added a second example of planned medication [*PlannedBenzathineMedicationWithLignocaine*](MedicationRequest-PlannedBenzathineMedicationWithLignocaine.html) showing how lignocaine strength/dosage represented in a contained MedicationRequest.  This instance is now used as the planned medication by the IG example RF CarePlans.
- Lignocaine recording via a contained MedicationStatement instance is now demonstrated in two example MedicationStatements:

1. [MedicationStatement-August](MedicationStatement-MedicationStatement-August.html)
2. [SecondaryProphylaxisAugustEncounterBundle](Bundle-SecondaryProphylaxisAugustEncounterBundle.html)

#### Miscellaneous

- Added a new example [Diagnosis Encounter](Encounter-DiagnosisEncounter.html) capturing representing context and locations of RF diagnosis.

### Consent (2024-05-07)

- In [consent-based access control](consentBasedAccessControl.html) added example instance data model showing patient opt-out of data sharing
- Consistency and readability improvements to existing Consent example instance models

### Terminology

- Added an RFCCS Observation object identifier to the codesystem for external system identifier types

---