<!-- markdownlint-disable MD041 -->
## Consent-based access control

### Business requirements overview

To register rheumatic fever patients and coordinate treatment, Rheumatic Fever Secondary Prevention Services (aka "Lead Providers") seek each patient's consent to:

1. Receive treatment for the rheumatic fever condition, and
1. Collection and sharing of data to coordinate treatment and associated health services.

#### How and when consent is established

Each Secondary Prevention Service organisation seeks these consents for its registered patients.  

As the consent is obtained in writing (form) it may be deferred for practical reasons until the patient's first secondary prophylaxis encounter.  This means there can be a delay
between registering a patient (which requires personal data to be entered into RFCCS) and officially obtaining consent.

#### Opting out / withdrawing consent

A patient may choose not to receive secondary prophylaxis treatment.

A patient can also elect not to give consent for data sharing (outside of Rheumatic Fever Prevention Services).

If a patient **opts out** of treatment and data sharing, Rheumatic Fever Secondary Prevention Services, under current arrangements, retain the patient's information for analysis and in case the patient subsequently resumes treatment.

When a patient is newly-registered and has not yet given their consent (by signing a form) their data is to be **provisionally protected** to prevent data sharing outside of Rheumatic Fever Secondary Prevention Services.

#### Custodianship of patient health data

The custodian of a rheumatic fever patient's data is the Rheumatic Fever Secondary Prevention Service organisation they are primarily registered with.

If a patient transfers to another district and so a different Secondary Prevention Service, the custodianship of the data also moves accordingly.

The significance of custodianship here is that it determines which parties have **administrative** access to rheumatic fever data which here means privileges like:

- creating care plans
- planning and adjusting secondary prophylaxis medication
- scheduling appointments
- recording patient's treatment preferences and allergies
- monitoring the delivery of secondary prophylaxis treatment
- coordinating other services that may be needed

---

### FHIR consent representation and data access control

Data is synchronised between RFCCS and FHIR by integration logic.

In the course of this synchronisation, patient-specific `Consent` instances are formed in the FHIR API.

#### How patient consent is represented in FHIR data

1. Each patient's expressed consent is represented as a pair of FHIR `Consent` instances
    - **scope** `#patient-privacy` (consent to collect/share data)
    - **scope** `#treatment` (consent to receive treatment).
1. Each `Consent` instance has a **provision** of **type** `#permit` which identifies the patient (by NHI) and defines the **period** of their consent as a date range.
1. The data collection/sharing `Consent` has in its **provision** a list of FHIR references which identify all the other FHIR resource instances this consent '*covers*' (applies to).
1. The **status** of the `Consent` instances can vary:
    - If patient consent has been obtained, the status of the instances is `#active`
    - If consent is anticipated but not yet obtained, the status of the instances is `#proposed` (a provisional arrangement)
    - When consent is denied / withdrawn, the status is `#active` BUT all `#permit`-type provisions are replaced with `#deny`-type provisions.
1. Every consent identifies a **performer** as the party that is primarily responsible for upholding the policies consented-to.  This will identify the *Rheumatic Fever Secondary Prevention Service* organisation (by HPI org ID).
1. When consent is provisional, a special extra *actor* **provision** is added to the data  FHIR `Consent` instance.  This actor identifies a CareTeam whose members are all the Secondary Prevention Service organisations that will have provisional access to data (before consent is officially obtained from the patient).

#### How FHIR consent affects access to FHIR data

The API performs consent-based data access control to instances of the following FHIR resources types (includes instances using profiles):

- `Appointment`
- `CarePlan`
- `Condition`
- `Encounter`
- `ServiceRequest`
- `QuestionnaireResponse`
- `Observation`
- `Patient`
- `Person / RelatedPerson`

Every time an API-consuming application interacts with a FHIR resource instance of one of the above types, the API searches to find any Consent instances that refer to that instance:

- If a valid Consent exists, the FHIR interaction can proceed,
- If no valid Consent exists, the interaction does not proceed and a 403 Forbidden error is returned,
- If the resource instance being surfaced is the result of a FHIR Search interaction, it will be redacted from the FHIR search results `Bundle` unless it is covered by a valid Consent.

#### Criteria for a consent to be valid

When a `Consent` instance meets the following five criteria, the API allows to the resources it protects:

1. Has scope `Consent.scope` = `#patient-privacy`

1. Has a `#permit` provision (not `#deny`),

1. Is *current* (current date must fall within `Consent.provision.period` start and end dates,

1. Identifies a Secondary Prevention Service as the custodian of the patient data in `Consent.performer`,

1. Identifies a patient as subject (`Consent.patient` is a logical reference by NHI identifier).

In the case of a *provisional consent* (`Consent` status = `#proposed`) there are two further criteria:

<!-- markdownlint-disable MD029 -->
6. The proposed consent MUST include a provision referencing a `CareTeam` which identifies the Rheumatic Fever Secondary Prevention Services (as HPI organisation ids) which are custodians of patient data, AND
7. The health application accessing the FHIR API MUST be using client credentials associated with one of the HPI organisations in the CareTeam (6).

#### What happens when a consent is not valid?

The API returns HTTP `401 Unauthorized` or `403 Forbidden` errors, depending on the operation being requested.

In FHIR search operations, instances in search results which are not properly covered by consents are REDACTED (are counted as matches, but not included in the results `Bundle`).

### Consent given on-behalf by related person

Sometimes patient consent has to be given by a person related to the patient (eg. children).

These scenarios are handled in FHIR using:

1. A `RelatedPerson` resource identifying the related party (by name is sufficient) and their relationship to the patient.  The RelatedPerson instance can be contained inside the `Consent` instance, and
1. An additional `Consent.performer[]` entry which refers to the RelatedPerson instance.

---

### Example data models

#### Consent obtained from patient

<!-- markdownlint-disable MD033 -->

<figure>
  <!-- Generated from `input/images-source/obj-FHIR-data-consent-active.puml` -->
  {% include obj-FHIR-data-consent-active.svg %}
</figure>
<br clear="all">

---

#### Consent obtained from a related person to the patient (on-behalf)

<figure>
  <!-- Generated from `input/images-source/obj-FHIR-data-consent-givenonbehalf.puml` -->
  {% include obj-FHIR-data-consent-givenonbehalf.svg %}
</figure>
<br clear="all">

---

#### Patient opted out from data sharing

<figure>
  <!-- Generated from `input/images-source/obj-FHIR-data-consent-optout.plantuml` -->
  {% include obj-FHIR-data-consent-optout.svg %}
</figure>
<br clear="all">

---

#### Provisional consent (yet to be officially obtained from patient)

<figure>
  <!-- Generated from `input/images-source/obj-FHIR-data-consent-provisional.plantuml` -->
  {% include obj-FHIR-data-consent-provisional.svg %}
</figure>
<br clear="all">
