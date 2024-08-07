## Fine-grained control of access to rheumatic fever FHIR data

The Rheumatic Fever FHIR API utilises [Smart App scopes](https://build.fhir.org/ig/HL7/smart-app-launch/scopes-and-launch-context.html#finer-grained-resource-constraints-using-search-parameters) for fine-grained data access control.

FHIR API consumers request the data access scopes they wish to acquire when obtaining an OAUTH authorization token.

Health New Zealand administers these data access scopes using a common identity and access management system integrated with the Digital Services Hub.

This page defines the data access levels and scopes required for the currently known Rheumatic Fever FHIR API-consuming applications.

### Access levels

- **SERVICE** - routine access for NZ Rheumatic Fever Secondary Prevention Service organisations (RFCCS integrating with FHIR via Mulesoft)
- **CUSTODIAN** - **higher privilege** access to access `R` labelled resources referenced by consents in RF Service custody, including power to apply/remove security labels and adjust consent provisions (RFCCS via Mulesoft)
- **CARE TEAM** - view/enquiry access to data needed by members / participants of the RF patient's care team
- **PROVIDER** - access by other providers/practitioners to rheumatic fever patient FHIR data for NZ health care delivery
- **ADMIN** - Health New Zealand administrative access eg. to change canonical definition instances

### Access scopes (subject to review)

| FHIR Resource Type / level  | *SERVICE*| *CUSTODIAN*<br>*break-glass* for<br>`R`-label resources | *CARE TEAM* | *PROVIDER* <br>*break-glass* for<br>`R`-label resources | *ADMIN* |
|:----|:----|:----|:----|:----|:----|
|`Patient`              | C,R,U,S  | C,R,U    | R,S   | R,S   | C,R,U,S   |
|`CarePlan`             | C,R,U,S  | C,R,U    | R,S   | R,S   | C,R,U,S   |
|`Condition`            | C,R,U,S  | C,R,U    | R,S   | R,S   | C,R,U,S   |
|`Encounter`            | C,R,U,S  | C,R,U    | R,S   | R,S   | C,R,U,S   |
|`Observation`          | C,R,U,S  | C,R,U    | R,S   | R,S   | C,R,U,S   |
|`CareTeam`             | C,R,U,S  | C,R,U    | R,S   | R,S   | C,R,U,S   |
|`Consent`              | C,R,S    | U        | R,S   | R,S   | C,R,U,S   |
|`Appointment`          | C,R,U,S  | C,R,U,S  | R,S   | R,S   | C,R,U,S   |
|`MedicationRequest`    | C,R,U,S  |          | R,S   | R,S   | C,R,U,S   |
|`MedicationStatement`  | C,R,S    | U        | R,S   | R,S   | C,R,U,S   |
|`Questionnaire`        | R,S      | R,S      | R,S   | R,S   | C,R,U,S   |

#### Break-glass authorization

'Break the glass' refers to protocol, common in healthcare, in which a clinician requests *unauthorized* access to a patient record.  Unauthorized here means not expressly authorized by the patient that is the subject of the data.

There are many scenarios in which such unauthorized access might be needed, the obvious one being when a rheumatic fever patient needs emergency treatment.

Regardless of the scenario, all access under break-glass protocol is audited and remains subject to any patient consent special provisions defined in associated FHIR `Consent` instances.

This is an example of temporary privilege elevation analogous to Unix `sudo` to run commands with root privelege (Windows User Account Control is another similar scheme).

#### Labelling

Rheumatic fever patient records in FHIR that need elevated privileges to access will be marked with a `R` [data sensitivity/confidentiality classification](https://terminology.hl7.org/5.5.0/CodeSystem-v3-Confidentiality.html) using [FHIR labelling](https://hl7.org/fhir/R4B/security-labels.html).  

These labels are the responsibility of each Secondary Prevention Service ('lead provider') as data custodian to apply/remove.  The actual labelling will be done on the organisation's behalf by RFCCS via Mulesoft.

An example of a rheumatic fever patient FHIR `CarePlan` with the `R` security label attached is [here](CarePlan-RegisteredPatient-R.json.html).

#### Requesting elevated access scope

To obtain the `SERVICE ELEVATED` level of access, RF FHIR API consumers will have to request the higher 'break-glass' access scope.

This will be done by requesting a **label** [parameterized scope](https://build.fhir.org/ig/HL7/smart-app-launch/scopes-and-launch-context.html#finer-grained-resource-constraints-using-search-parameters) as follows eg.

```sh
system/Careplan.rs?label=http://hl7.org/fhir/security-label#break-the-glass
```
