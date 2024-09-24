<!-- markdownlint-disable MD033 MD034 MD041 -->
## Rheumatic fever FHIR data access

### Current data access controls

The Health New Zealand FHIR API server implements several access control mechanisms.

| FHIR data access control | Implementation tech/mech | - |
|:-----                |:-----           | - |
| authorize type of application requesting | 1. Digital Services Hub client authentication (Keycloak) <br/> 2. Cognito client authentication | - |
| authorize based on identity of organization requesting | FHIRWorks tenanted data-partitioning based on tenant's client credentials | - |
| limit type of FHIR resource requested     | FHIRWorks role-based access based on FHIR SMART scopes (OAUTH scopes)   | - |
| limit kind of FHIR operation requested    | FHIRWorks role-based access based on FHIR SMART scopes (OAUTH scopes)   | - |
| limit scope of FHIR instances accessible  | instance data access control based on FHIR SMART scopes (OAUTH scopes)  | - |
| authorize based on patient consent status | Special data access logic based on FHIR Consent instance content/association | - |

### Access requirements for rheumatic fever application access to FHIR data

Listed below are the full SMART scopes and audiences a client must acquire required to have full access to the Rheumatic Fever FHIR API.

Scope describes access in terms of FHIR resource type and operations, whereas audience further constrains access within resource type by IG profile (for selected types).

Scopes and audiences are issued by the Health NZ's OAUTH authorization server.  At the time of writing, scopes have to be requested by the client in the token request whereas audiences are automatically assigned.

| FHIR resource type   | OAUTH scope required for RFCCS access  | OAUTH aud: (audience) required for RFCCS access   | - |
|:-----                 |:-----                                   |:----                        | - |
| `Appointment`         | `system/Appointment.crus?`<br>`_tag=https://fhir-ig.digital.health.nz/rheumatic-fever/CodeSystem/nz-rheumaticfever-codesystem\|rf-nz` | - |
| `Bundle`              | `system/Bundle.crus`                      | - |
| `CarePlan`            | `system/CarePlan.crus`                    | https://fhir-ig.digital.health.nz/rheumatic-fever/StructureDefinition/nz-rheumaticfever-careplan |
| `CareTeam`            | `system/CareTeam.crus`                   | https://fhir-ig.digital.health.nz/rheumatic-fever/StructureDefinition/nz-rheumaticfever-careteam |
| `Condition`           | `system/Condition.crus`                   | https://fhir-ig.digital.health.nz/rheumatic-fever/StructureDefinition/nz-rheumaticfever-condition |
| `Consent`             | `system/Consent.crus`                     | - |
| `Encounter`           | `system/Encounter.crus?`<br/>`_tag=https://fhir-ig.digital.health.nz/rheumatic-fever/CodeSystem/nz-rheumaticfever-codesystem\|rf-nz` | - |
| `Medication`          | `system/Medication.crus`                  | - |
| `MedicationRequest`   | `system/MedicationRequest.crus`           | https://fhir-ig.digital.health.nz/rheumatic-fever/StructureDefinition/nz-rheumaticfever-medicationrequest |
| `MedicationStatement` | `system/MedicationStatement.crus?`<br>`_tag=https://fhir-ig.digital.health.nz/rheumatic-fever/CodeSystem/nz-rheumaticfever-codesystem\|rf-nz` | - |
| `Observation` (DiagnosisGroup) | `system/Observation.crus`        | https://fhir-ig.digital.health.nz/rheumatic-fever/StructureDefinition/nz-rheumaticfever-diagnosisgroup |
| `Patient`             | `system/Patient.crus`                     | https://fhir-ig.digital.health.nz/rheumatic-fever/StructureDefinition/nz-rheumaticfever-patient |
| `Questionnaire`       | `system/Questionnaire.rs`               | - |
| `QuestionnaireResponse`        | `system/QuestionnaireResponse.crus?`<br>`_tag=https://fhir-ig.digital.health.nz/rheumatic-fever/CodeSystem/nz-rheumaticfever-codesystem\|rf-nz` | - |
