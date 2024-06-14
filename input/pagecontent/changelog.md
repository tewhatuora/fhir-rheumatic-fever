# Changelog

<!-- markdownlint-disable MD024 -->

## v0.4.3

**Separated rheumatic fever API from shared care IG into the dedicated IG.**

- Rewrote [consent-based access control](consentBasedAccessControl.html) page.

## v0.4.2 Rheumatic Fever phase 2 part 2 (June 2024)

### Profiles

- Added new profile on Observation resource [Rheumatic Fever Diagnosis Group](StructureDefinition-nz-sharedcare-rheumaticfever-diagnosisgroup.html)
- [RF CarePlan profile](StructureDefinition-nz-sharedcare-rheumaticfever-careplan.html)
  - Added new boolean extension to indicate lifelong secondary prophylaxis
- [RF Condition profile](StructureDefinition-nz-sharedcare-rheumaticfever-condition.html)
  - Added constraint and description on .evidence[] element for linking diagnosis Observations
  - Added descriptions to extension elements to clarify usage
- [RF medication request profile](/StructureDefinition-nz-sharedcare-rheumaticfever-medicationrequest.html)
  - Added definitional detail to `dosageInstruction.route` and `.site`

### [Examples](artifacts.html#examples)

- A new [Condition with diagnosis evidence](Condition-SevereRfConditionWithDiagnosisEvidence.html) example illustrates linking Observations via `evidence[].detail` references.
- Examples of enhanced diagnosis linked to a Condition
  - [ECHO RHD assessment](Observation-DiagnosisExample-ECHO.html)
  - [Jones Criteria](Observation-DiagnosisExample-JonesCriteria.html)
  - [Strep evidence](Observation-DiagnosisExample-StrepEvidence.html)
- The various example `CarePlan`s now illustrate use of the **lifelong secondary prophylaxis** extension and have been revised so that creation adn period dates are UTC `dateTime` values.
- SP `Appointment`s and `Encounter`s now have `.serviceType` = $sct#360271000 "Prophylaxis"  
- Madeleine Meringue example patient - changed language code to #en (English) to fix BCP-47 terminology publisher validation problem
- Pania Punga example patient - changed language code for Maori to #mi to fix BCP-47 terminology publisher validation problem

### Terminology

- Added a new [ValueSet](ValueSet-rf-observation-diagnosisgroup-code.html) to constrain SNOMED codes used on [Rheumatic Fever Diagnosis Group](StructureDefinition-nz-sharedcare-rheumaticfever-diagnosisgroup.html)s
- Adjusted **medication frequency codes** //allowed by the [ValueSet](ValueSet-rf-medicationrequest-frequency-code.html) to include every 10|13 weeks.
- Improved Terminology Overview page

### Miscellany

- Changed date values to *dateTime* datatype in elements that need to be accurately convert to/from UTC representation
- Publisher-generated narrative text suppressed in canonical Questionnaires and CareTeam
- Updated FHIR data models

---

## v0.4.0 Rheumatic Fever phase 2 part 1 (May 2024)

### [Data model designs](rheumatic-fever-data-models.html)

- Revised **secondary prophylaxis medication planning and recording** model: Added nested lignocaine medication request and statement; simplified appointments.

- Added new model of **diagnosis data representation**

- Added new model for **planning/recording of other care appointments**

### [Definition instances](artifacts.html#definitions)

- Moved the [**LeadProvidersGroup**](CareTeam-LeadProvidersGroup.html) from Examples to Definitions section

- Expanded the membership of the [**LeadProvidersGroup**](CareTeam-LeadProvidersGroup.html) to encompass all 18 NZ Rheumatic Fever Secondary Prevention Services.

### Profiles

[Condition](StructureDefinition-nz-sharedcare-rheumaticfever-condition.html) RF profile:

- two new extensions for RF-specific diagnosis attributes

1. Date of RHD severity assessment (Condition.**assessmentDate**)
1. Symptom status at time of RF diagnosis (Condition.**symptomStatusAtDiagnosis**)

### [Examples](artifacts.html#examples)

#### Shared care provider scenario

These examples have been adjusted to correctly reflect the Taranaki RF SP service as a shared care provider by referencing its HPI org Id **G0M744-C**

- [Madeleine Meringue's care team](CareTeam-SecondaryProphylaxisCareTeam.html)
- [Booked september appointment](Appointment-SecondaryProphylaxisAppointment-September-Booked.html)

#### Condition and diagnosis extensions

- Expanded [RfCondition](Condition-SevereRfConditionExample.html) example to use a new extension (symptomStatusAtDiagnosis) and reference a diagnosis Encounter (see below)

#### Medication planning and recording

- Renamed the planned medication example to [*PlannedBenzathineMedication*](MedicationRequest-PlannedBenzathineMedication.html)
- Added a second example of planned medication [*PlannedBenzathineMedicationWithLignocaine*](MedicationRequest-PlannedBenzathineMedicationWithLignocaine.html) showing how lignocaine strength/dosage represented in a contained MedicationRequest.  This instance is now used as the planned medication by the IG example RF CarePlans.
- Lignocaine recording via a contained MedicationStatement instance is now demonstrated in two example MedicationStatements:

1. [MedicationStatement-August](MedicationStatement-MedicationStatement-August.html)
2. [SecondaryProphylaxisAugustEncounterBundle](Bundle-SecondaryProphylaxisAugustEncounterBundle.html)

#### Miscellaneous

- Added a new example [Diagnosis Encounter](Encounter-Encounter-Diagnosis.html) capturing representing context and locations of RF diagnosis.

### Consent (2024-05-07)

- In [consent-based access control](consentBasedAccessControl.html) added example instance data model showing patient opt-out of data sharing
- Consistency and readability improvements to existing Consent example instance models

### Terminology

- Added an RFCCS Observation object identifier to the codesystem for external system identifier types

---

## v0.3.9 (2024-02-29)

### Documentation

- Added [state transition diagrams](rheumatic-fever-data-models.html#secondary-prophylaxis-appointment-planning-and-recording-states-model) for the expected states of secondary prophylaxis resources.

- Update to existing diagram illustrating [appointment planning and recording](rheumatic-fever-data-models.html#secondary-prophylaxis-medication-planning-and-encounter-recording) the number of planned Appointments has been reduced to one.

- Developer guidance expanded about validation of [resources using versioned profiles](developerGuide.html#fhir-resource-profile-based-validation)

## v0.3.8 (2024-02-02)

### RF examples

- The example showing [consent by a related person](Consent-ConsentByRelatedPersonExample.html) is now an `#active` rather than `#proposed` consent, to make it more realistic.

### Doc

- In [consent-based access control](consentBasedAccessControl.html), a diagram and description has been added for the Consent-on-behalf scenario (consent obtained from a related person).  Other minor improvements to the description.

- Fixed a few broken links in this changelog.

---

## v0.3.7 (2023-12-19)

### Fixed category code in CareTeams

The SNOMED code required by the rheumatic fever profile of CareTeam was incorrect and has now been revised to `320741000210108`.

Note this is a new SNOMED code for the New Zealand edition and is not yet visible in SNOMED CT browsers as of this update.

### Business versioning of canonical definitions

As of this IG, a business version of "1.0.0" has been set in definitions and canonical instances.  Future updates from this point will increment these version numbers in the applicable artifacts using [semantic versioning](https://build.fhir.org/resource.html#versions).

#### Questionnaires

All four rheumatic fever canonical Questionnaire instances now have a [business version](https://build.fhir.org/resource.html#versions) set to "1.0.0".

The example `QuestionnaireResponse`s for these Questionnaires now use versioned FHIR "questionnaire" references eg.
`"https:/build.fhir.org/ig/fhir-rheumatic-fever/Questionnaire/MedicationsAndFollowUpGuidanceQuestionnaire|1.0.0"`

#### Profiles

The five rheumatic fever resource profiles of `CarePlan | Patient | Condition | CareTeam | MedicationRequest` now have a [business version](https://build.fhir.org/resource.html#versions) set to "1.0.0" instead of the IG version.

Corresponding example instances of these profiled types now use a versioned FHIR canonical reference in their metadata eg.

```json
{
  "resourceType" : "CarePlan",
  "meta" : {
    "versionId" : "2",
    "lastUpdated" : "2023-11-07T04:00:00Z",
    "profile" : [
      🔗 "https://build.fhir.org/ig/tewhatuora/fhir-rheumatic-fever/StructureDefinition/nz-sharedcare-rheumaticfever-careplan|1.0.0"
    ]
  },
  ...
```

#### ValueSets

`ValueSet`s defined in this IG now have their own business version numbers set to "1.0.0" as of this IG release.

### Example instance profile changes

A couple of example instances now claim their resource profile as the profile (version "1.0.0") *in this IG* whereas previously they claimed the base FHIR R4B profile:

- *SecondaryProphylaxisCareTeam* (`RheumaticFeverCareTeam`)
- *PlannedBenzathineMedication* (`RheumaticFeverMedicationRequest`)

---

## v0.3.6 (2023-12-14)

### Further extension of Condition in RheumaticFeverCondition profile

One further extension is now defined, in the *RheumaticFeverCondition* profile of `Condition` resource.  The new extension named `assessmentDate` enables API consumers to record the date of RHD severity assessment separately from the date of diagnosis (`recordedDate`).

The corresponding example instance has been updated to demonstrate usage of this extension.  The FHIR data model and rheumatic fever data documentation has been revised to show the additional extension element.  

### Correction to rheumatic fever provider HPI identifiers

All identifier references to the two HPI pilot service provider orgs have been corrected to `G0M086 / G0M087`.  Previously the second character of these identifiers was incorrectly specified as upper case letter 'O' rather than '0' zero.

### Terminology

One further type code has been added to the [ExternalSystemIdentifierTypeValueSet](ValueSet-external-system-identifier-type-code.html) ValueSet to enable clients to designate identifiers to external encounter objects.

### Misc

In the rheumatic fever section of the documentation, the FHIR design diagrams (which were moved onto their own page in IG v0.3.5) are no longer duplicated on the rheumatic fever *data mappings and translation* page.

---

## v0.3.5 (2023-11-24)

### Rheumatic Fever data

#### Profiles and terminology

As a result of a design decision to constrain values of medication frequency to a standard set of frequencies (coded) used in NZ rheumatic fever secondary prophylaxis:

1. A new [ValueSet](ValueSet-rf-medicationrequest-frequency-code.html) has been added to define the SNOMED codes of valid secondary prophylaxis medication frequencies (appointment intervals), and  
1. An new **extension** has been introduced on MedicationRequest to capture a code from the ValueSet in (1). (The general purpose element `Dosage.additionalInstruction` is no longer to be used for medication frequency).
1. A new profile for `MedicationRequest` named **RheumaticFeverMedicationRequest** has been introduced to incorporate the new extension from (2).  It builds on NzMedicationRequest from the NZ Base IG.

#### Example instances

- The example `MedicationRequest` now claims conformance with its new profile in this IG as outlined above.

- The example `MedicationStatement` now claims conformance with [NzMedicationStatement](https://fhir.org.nz/ig/base/StructureDefinition-NzMedicationStatement.html) from the **NZ Base IG**.

  - This example also now has a `partOf` reference to its contained instance to avoid a Publisher QA FHIR validation error.

- There is now a new example [Bundle](Bundle-SecondaryProphylaxisAugustEncounterBundle.html) showing how secondary prophylaxis encounter info can be created as three POST requests in one *transaction* (Encounter + MedicationStatement + QuestionnaireResponse).

#### IG Documentation

- Added a section to the *API Developer Guide* about validation of FHIR resource references.

- Updates to *FHIR Resource Data Model*:

  - Base FHIR type is now consistently identified using the UML stereotype of the class
  
  - MedicationRequest resource is now shown as profiled `RheumaticFeverMedicationRequest``
  
  - Usage of *sliced* identifiers in profiled resources is now shown more clearly.
  
  - The model now shows references going from the `RheumaticFeverCondition` resource to the *Episurv* national notifiable disease system.

- Tweaked the RF [Terminology](terminology.html) page.

- Added a few resource types to server [Capability Statement](capabilityStatement.html)

---

## v0.3.4 (2023-11-09)

### rheumatic fever changes

#### Refactored whanau care team into `Patient.contact[]`

- Whanau care teams are now represented directly in the `RheumaticFeverPatient` resource, as `.contact[]` members.

- The `RheumaticFeverCareTeam` resource profile will now be used only for *secondary prophylaxis* care teams.  So all instances of `RheumaticFeverCareTeam` resources are categorised sct#320741000210108 "Secondary prophylaxis team"

- A new example `RheumaticFeverPatient` instance has been added showing how to model whanau members as contacts
  **[MadeleineMeringueAndWhanau](Patient-MadeleineMeringueAndWhanau.html)**

#### `RheumaticFeverPatient` profile changes

- `Patient.contact` now has three new extensions capturing role (coded), relationship (string) and primary contact nature for each member of a patient's whanau/trusted delegates care team.

#### Questionnaire updates

- [Secondary Prophylaxis Health Assessment Questionnaire](Questionnaire-SecondaryProphylaxisHealthAssessmentQuestionnaire.html)  
    Various items removed and one new item added [Example QR]QuestionnaireResponse-RFPatientHealthAssessmentQuestionnaireResponse.html) updated to match.

- [Medications and Follow-Up Guidance Questionnaire](Questionnaire-MedicationsAndFollowUpGuidanceQuestionnaire.html)  
    One item changed from boolean to yes/no/unknown coded answer. [Example QR](QuestionnaireResponse-MedicationsAndFollowUpGuidanceQuestionnaireResponse.html) updated to match.

- [Patient Medication Allergy Questionnaire](Questionnaire-PatientMedicationAllergyQuestionnaire.html)  
      One item removed. [Example QR](QuestionnaireResponse-PatientMedicationAllergyQuestionnaireResponse.html) updated to match.

#### Updates to examples

- The example `SecondaryProphylaxisCareTeam` has been adjusted to properly represent a secondary prophylaxis care team

- The example `WhanauCareTeam` has been deleted.

- `Appointment` examples updated to reflect changes to data dictionary, including the addition of another code for salesforce CarePlanActivity identifiers in [ExternalSystemIdentifierTypeValueSet](ValueSet-external-system-identifier-type-code.html).

- A new example has been added demonstrating **consent by a person related to a patient**. See **[ConsentByRelatedPersonExample](Consent-ConsentByRelatedPersonExample.html)**.

- The example rheumatic fever patient **[MadeleineMeringue](Patient-MadeleineMeringue.html)** also now has some sample ContactPoint entries in `Patient.telecom[]`.

- documentation  
  - The [Terminology overview](terminology.html) and [Data translation and models](rheumatic-fever-data.html) pages have been updated.

### Other IG changes in v0.3.4

- Reorganised top nav with two new sections for COVID CINC artifacts and Consent documentation and examples.

- The IG now allows for `.contained` resource instances in Consents
    This is needed for rheumatic fever in which consent is commonly obtained from the patient's parent or another relative.

- Three new extensions defined for use on `Patient.contact`

- IG *FHIR Shorthand (fsh)* source code improvements
  - Separate extension definitions now combined into single files by resource type
  - New ruleset for generation of `ContactPoint` elements used by `patient.telecom` and `patient.contact.telecom` examples.

## v0.3.3 (2023-11-07)

### rheumatic fever fixes and changes

- `Consent` resource examples

  - Examples now include the `.organization` element as the custodian of the consent, set to the same org as `.performer`

  - An example of an `#active` status Consent has been added.  [This example](Consent-RheumaticFeverActiveConsentExample.html) demonstrates how clients should form a valid Consent instance representing when a patient's consent has been actually obtained.

- In the `RheumaticFeverCarePlan` resource profile, `.addresses` now has cardinality zero to many (`0..*`)

- In the `RheumaticFeverCondition` resource profile, the `diagnosticCertainty` extension now uses codes defined in a **code system in this IG** because clients cannot expand the ValueSet
   published on the [New Zealand Health Terminology Service](https://nzhts.digital.health.nz/fhir/ValueSet/rheumatic-fever-diagnostic-certainty) to codes at this time.

- In the four rheumatic fever **extensions** defined by this IG, the **context**, which constrains which type(s) the extension
    can be used on has been changed to the applicable base type instead of the profiled type.  This change means clients can use
    the extensions without encountering hapi validator errors / Bad Request 400 errors.

- Identifiers from **EPISurv**, the national system which tracks notifiable disease events, are no longer to be recorded on `RheumaticFeverCarePlan` and have moved instead to the `RheumaticFeverCondition` profile.  Relevant example instances have been updated.

- *validation errors in example resources* -- updates to address certain errors raised by the [FHIR Validator](https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator):
  
  - In example resources which have a Reference(Organization) the reference type is now the base type `Organization` instead of `"type" : "NzOrganization"`

  - In CarePlan examples, `subject` references are now of base `"type" : "Patient"` instead of `"type" : "NzPatient"`
  
  - Also in CarePlan examples, `addresses` has changed from a singleton reference to an array of References (length 1) with each entry of `"type": "Condition"`
  
## v0.3.2 (2023-10-27)

- Revised Identifier slicing in CarePlan, Condition and CareTeam resource profiles to allow multiple references to external identifiers and capture the types of identifier being referred to.

- Revised the [patient medication allergy ValueSet](ValueSet-rf-medicationallergy-code.html) to now use SNOMED terminology which pinpoints the medication allergy instead of substance concepts.

- [Patient Medication Allergy Questionnaire](Questionnaire-PatientMedicationAllergyQuestionnaire.html) revised questions to codify
    answer yes|no|unknown, and add third question to capture Other Allergy detail as free text.

- [Secondary Prophylaxis Health Assessment Questionnaire](Questionnaire-SecondaryProphylaxisHealthAssessmentQuestionnaire.html) revised questions in line with
    data dictionary changes, and [QuestionnaireResponse example]QuestionnaireResponse-RFPatientHealthAssessmentQuestionnaireResponse.html) updated to match.

- Corrected rheumatic heart disease severity [ValueSet](ValueSet-rf-condition-rhdseverity-code.html) to add missing code `#301561000210102 History of heart valve replacement (situation)`

- Introduced new terminology [QualifiedYesNoAnswerValueSet](ValueSet-nz-questionnaireresponse-qualifiedyesno-code.html).  This set of SNOMED codes applies
    to yes/no-type questions where it is important to be able to record an 'unknown' or 'information not available' response in a FHIR QuestionnaireResponse item.

- Introduced new terminology [ExternalSystemIdentifierTypeValueSet](ValueSet-external-system-identifier-type-code.html).  This extends the set of FHIR
    Identifier type codes to define new codes for known external identifiers in NZ national systems that integrate with the Te Whatu Ora Shared Care FHIR API.

- All Rheumatic fever terminology now appears in the *rheumatic fever* section of the **Profiles** tab.  

- Key **salesforce <-> FHIR mappings** are now defined in the [rheumatic fever data](rheumatic-fever-data.html) page.

- Added **Consent** tab describing patient-consent-based access controls implemented by the Te Whatu Ora Shared Care API.

## v0.3.0 (2023-10-09)

### Added pilot FHIR support for rheumatic fever national care coordination solution

- New resource profiles (extensions)
  - RheumaticFeverCarePlan
  - RheumaticFeverCondition
  - RheumaticFeverPatient
- Terminology
  - Five ValueSets and two CodeSystems covering rheumatic fever terminology
- Examples of rheumatic fever instances
  - RheumaticFeverCarePlan: 4 states
  - NzPatient: 4 examples
  - secondary prophylaxis information: Encounter, Appointment, MedicationRequest, MedicationStatement
  - supporting examples: Organization, CareTeam
