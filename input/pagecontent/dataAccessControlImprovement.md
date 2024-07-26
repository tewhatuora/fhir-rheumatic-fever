## Rheumatic fever FHIR data access control

### Current data access controls

The Health New Zealand FHIR API server implementation already incorporates several key generic controls in FHIR resource API data access

| Existing FHIR data access control | Implementation tech/mech |
|:-----                |:-----           |
| limit type of FHIR resource requested     | FHIRWorks role-based access plus FHIR SMART scopes (OAUTH scopes) |
| limit kind of FHIR operation requested    | FHIRWorks role-based access plus FHIR SMART scopes (OAUTH scopes) |
| authorize type of application requesting | 1. Digital Services Hub client authentication (Keycloak) <br/> 2. Cognito client authentication |
| authorize based on patient consent status | Special data access logic based on FHIR Consent instance content/association |
| authorize based on identity of organization requesting | FHIRWorks tenanted data-partitioning based on tenant's client credentials |

### Rheumatic fever API - evolving requirements

The initial (MVP) RF FHIR API utilised all of the above mechanisms, and added logic for two additional special rules to support limited Mulesoft access under **provisional (pending) patient consent**:

1. The parties to be allowed limited provisional access must be defined in a `CareTeam` referenced by the `#proposed` Consent, and
1. The API requestor must authenticate using client credentials linked (in server configuration) to a member in the CareTeam (1)

These extra rules have complicated the authorization logic in a solution-specific way and introduced a number of drawbacks:  

- There is excessive administrative overhead to issue, maintain and use (on Mulesoft's part) up to 25 sets of client credentials for the national RF API use cases,
- The need to link each issued client credential to an organisation (identifier) means this scheme relies on a naming convention in server configuration which is non-obvious and lies outside of the FHIR data under management,
- The logic the server applies to enforce provisional data access is tied to the RF operating model and application to other business contexts would likely proliferate this logic.

As rheumatic fever business requirements have continued to clarify, there is now a need to encompass explicit patient opt-out of data sharing, bringing about yet another data access rule that would require further extension of RF-specific authorization logic in the FHIR API server.

### Opportunity for access control improvement

With the advent of DSH-managed OAUTH SMART scopes and integration of these with the FHIRWorks' role-based resource and operation access, it is now practical to describe data access rules using scope statements combining

- FHIR resource types,
- FHIR resource operations, and
- parameterized scopes (FHIR queries to other data from other FHIR instances in the same repository).

These parameterized scope statements provide a common language for describing data access rules bringing about several benefits:

1. The setup and maintenance of data access can shift under *Digital Services Hub* processes which is the proper point for HNZ to manage information access,
1. Solution-specific data access logic in FHIRWorks can be substantially reduced if not eliminated, and fulfilled instead by generic scope-based data access control,
1. There will no longer be API solution security data hidden in FHIR server configuration.

While the rheumatic fever FHIR API is being integrated with Salesforce and yet to reach production, there is now the opportunity to refactor the RF consent-based data access control model into a SMART scope rules implementation with all access based on data residing predominantly within the RF FHIR data model itself.

***
