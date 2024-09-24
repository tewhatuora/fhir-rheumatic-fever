<!-- markdownlint-disable MD010 MD041 MD033-->

## Authentication / Authorization

This FHIR API uses standard OAUTH bearer token authentication.

All requests to this FHIR API must include an access token in the `Authorization` header.

Authorized clients can obtain access tokens from the Health New Zealand authorization server (KeyCloak) requesting the necessary rheumatic fever [OAUTH scopes and audiences](fhirDataAccessControl.html).

See the accompanying Postman collection for example OAUTH token request.

## Request context

All FHIR API requests must include metadata about the context of usage for the application consuming the API.  This is done by setting properties in the `Request-Context` custom header (which is a string containing a Base64-encoded JSON object).

|**property**             |**Required?**|**Attribute value**|
  |:----------------------|:------------|:---------------------|
  | `userIdentifier`      | YES         | The userid of the user as authenticated by RFCCS or other authorized PMS/health application. |
  | `purposeOfUse`        | YES         | Set to `"POPHEALTH"`                                              |
  | `userFullName`        | YES         | Display name of the user of RFCCS or the PMS/health application.  |
  | `hpiOrganisation`     | YES         | The HPI Organisation identifier (format GAAANNN-A) for Secondary Prevention Service the application user is working within |
  | `hpiPractitioner`     | optional    | If available, the HPI Practitioner identifier (Common Person Number) of the user |
  | `hpiFacility`         | optional    | If available, the HPI Facility identifier of the health facility where the application is being used |
  
  The schema for defining and validating these properties can be [found here](https://github.com/tewhatuora/schemas/blob/main/json-schema/Request-Context-v2.json)

An example request context follows illustrating FHIR API access on behalf of the Northland / Te Tai Tokerau RF Secondary Prevention Service:

```json
{
  "userIdentifier": "11AAbb@#",
  "purposeOfUse": "POPHLTH",
  "userFullName": "Rosie (Rheumatic Fever Coordinator)",
  "hpiOrganisation": {
    "type": "Organization",
    "identifier": {
      "use": "official",
      "system": "https://standards.digital.health.nz/ns/hpi-organisation-id",
      "value": "G0M086-B"
    },
    "display": "Te Tai Tokerau Rheumatic Fever Secondary Prevention Service"
  }
}
```

A schema for the Request-Context is [available here](https://github.com/tewhatuora/schemas/blob/main/json-schema/Request-Context-v2.json)

<p>&nbsp;</p>

## FHIR resource profile-based validation

HNZ's FHIR server validates all instance payloads on FHIR resource creation/update requests.

Developers should ensure **all** FHIR resource instances  being created or updated set the correct profile in their `meta.profile` property, so that payloads can be properly validated against the IG profles/definitions by the server.

**Example:**

```json
"meta" : {
  "profile" : ["https://fhir-ig.digital.health.nz/rheumatic-fever/StructureDefinition/nz-rheumaticfever-condition"]
}
```

### Profile Versioning behaviour

This server supports versioned profiles indicated by the **|n.n.n** FHIR semantic versioning syntax.

A resource payload MAY claim a specific version of a resource profile if that instance representation relies on version-specific profile features.

1. When a resource payload claims a *non-versioned* profile url, this server validates using the *latest profile version* in its server configuration.
1. When a resource payload contains *no profile url* claim, this server validates using the standard HL7 FHIR R4 profile.
1. If a resource payload claims a *non-existent* profile version url, this server will reject the operation with a `400 Bad Request` and message "Profile reference '{{URL}}' has not been checked because it is unknown"

### Resource retrieval by profile

Once resources are created, API consumers can retrieve by profile, and if desired, profile version.

**Example:**

Retrieve all condition resources using version 1.0.0:

`GET /Condition?_profile=https://fhir-ig.digital.health.nz/rheumatic-fever/StructureDefinition/nz-rheumaticfever-condition|1.0.0`

Without the version qualifier, the FHIR search would return all profiled condition resources regardless of the profile version

---

## FHIR Resource references

FHIR [Resource References](https://build.fhir.org/references.html) are commonplace and necessary to represent real health information over a range of FHIR resource types.

### Types of FHIR references

The following examples of FHIR references are acceptable in POST/PUT payloads sent by consumers of the *Te Whatu Ora Shared Care* API.

#### Relative literal RESTful references

`"reference": "Patient/"e5d44ac6-cc79-4e80-bea4-225e5a93a8b7"`

This API **DOES NOT** resolve the reference (test if the instance exists) or check that the resource type is actually supported by the API.  API consumers are expected to ensure that the referenced RESTful resource path is correct when POST/PUTing a payload.

#### Absolute Url references

`"reference": "https://fhir.example.org/base/Patient/123"`

This API **DOES NOT** resolve absolute Urls (that is, it does not check that the referenced instance exists or is reachable).  API consumers are expected to ensure that all such references are correct when POST/PUTing payloads.

#### References by logical external identifier

```json
 "author" : {
    "type" : "Organization",
    "identifier" : {
      "use" : "official",
      "system" : "https://standards.digital.health.nz/ns/hpi-organisation-id",
      "value" : "G0M086-B"
    },
    "display" : "Te Tai Tokerau Rheumatic Fever Secondary Prevention Service"
  },
```

This API **DOES NOT** resolve external logical identifier references.  API consumers are expected to ensure that all such references are correct when POST/PUTing payloads.

#### urn:uuid references in Bundles

These are commonly [used in Bundles](https://build.fhir.org/bundle.html#references) to make links between instances in the same Bundle.

This API does support inter-instance linking in POSTed FHIR Bundles, using `urn:uuid` style references.

The following excerpt shows valid use of `urn:uuid`s in a POST Bundle which creates an Encounter and a QuestionnaireResponse instance, and lets the API form the reference from the QR to the Encounter.

<!-- markdownlint-disable MD010 -->
```json
{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
  {
    "fullUrl": "urn:uuid:Encounter-temporary-id",
    "resource": {
      "resourceType": "Encounter",
      ...
    }
  },
  {
    "fullUrl": "urn:uuid:QR-temporary-id",
    "resource": {
      "resourceType": "QuestionnaireResponse",
      "encounter": {
        "reference": "urn:uuid:Encounter-temporary-id"
      },
      ...
    }
  },
  ...
}
```

### Reference validation in the Te Whatu Ora Shared Care API

The API performs some validation on FHIR resource references.  API consumers that send payloads containing the following errors will get `400 Bad Request` errors.

| Type of reference | Invalid example | Response | Client's recourse |
| :-------------- | :----------------------------- | :--------- | :-------------- |
| null relative literal reference | `"reference": "Patient/"` | 400 Bad Request Error | Fix the id and resubmit. |
| invalid Id in relative literal ref | `"reference": "Patient/A2A3-B7B"` (not a valid FHIRWorks UUID) | 400 Bad Request Error | Fix the id and resubmit. |
| wrong resource type in reference path | `"reference": "CareTeam/{{Patient UUID}}` in a Reference(Patient) element | 400 Bad Request Error | Fix the resource type path and resubmit. |
| mismatched type to reference path | `"type": "CareTeam",`<br>`"reference": "Patient/{{valid existing Patient UUID}},` | 400 Bad Request Error | Fix `"type":"xx"` and resubmit. |
