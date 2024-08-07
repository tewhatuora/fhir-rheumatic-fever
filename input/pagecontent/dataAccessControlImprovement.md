<!-- markdownlint-disable MD033 MD034 MD041 -->
## Rheumatic fever FHIR data access

### Current data access controls

The Health New Zealand FHIR API server implements several access control mechanisms.

| FHIR data access control | Implementation tech/mech |
|:-----                |:-----           |
| authorize type of application requesting | 1. Digital Services Hub client authentication (Keycloak) <br/> 2. Cognito client authentication |
| authorize based on identity of organization requesting | FHIRWorks tenanted data-partitioning based on tenant's client credentials |
| limit type of FHIR resource requested     | FHIRWorks role-based access based on FHIR SMART scopes (OAUTH scopes)   |
| limit kind of FHIR operation requested    | FHIRWorks role-based access based on FHIR SMART scopes (OAUTH scopes)   |
| limit scope of FHIR instances accessible  | instance data access control based on FHIR SMART scopes (OAUTH scopes)  |
| authorize based on patient consent status | Special data access logic based on FHIR Consent instance content/association |

### Scopes for rheumatic fever application access to FHIR data 

Listed below are SMART scope expressions which will allow Mulesoft (on behalf of RFCCS application) sufficient access to create, access and maintain FHIR NZ rheumatic fever patient data.

Any FHIR data lying outside of these scopes would not be accesible to Mulesoft/RFCCS unless it also acquires additional scopes issued by Health New Zealand's Digital Services Hub.

| *FHIR resource type  | *OAUTH scope for RFCCS access via Mulesoft |
|:-----                |:-----                                     |
| Appointment | Appointment.crus?service-category=http://snomed.info/sct\|58718002  |
| CarePlan | CarePlan.crus?_profile={{RfCarePlan profile uri}}        |
| CareTeam | CareTeam.crus?_profile={{RfCareTeam profile uri}}        |
| Condition | Condition.crus?_profile={{RfCondition profile uri}}     |
| Encounter | Encounter.crus?type=http://snomed.info/sct|58718002     |
| MedicationRequest | MedicationRequest.crus?_profile={{RfMedicationRequest profile uri}}   |
| MedicationStatement | MedicationStatement.crus?category=http://snomed.info/sct\|58718002  |
| Observation | Observation.crus?_profile={{RfDiagnosisGroup profile uri}}  |
| Patient | Patient.crus?_profile={{RfPatient profile uri}}           |
| QuestionnaireResponse | QuestionnaireResponse.crus?tag=`#rf-nz`     |

Setup and maintenance of data access per the OAUTH scopes above occurs under *Digital Services Hub* processes operated/overseen by Health New Zealand.
