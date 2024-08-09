## Rheumatic Fever API terminology overview

The Rheumatic Fever FHIR API makes uses of the following terminology systems:

- SNOMED International Edition (`snomed.info/sct`)
- NZMT - New Zealand Medication Terminology (`nzmt.org.nz`)
- NZ Base Implementation Guide [terminology](https://fhir.org.nz/ig/base/terminology.html)

### Clinical rheumatic fever terminology in NZ

There is a substantial amount of clinical terminology in use in New Zealand rheumatic fever care and treatment which is not defined in the SNOMED CT international edition.

To enable this NZ-specific terminology to be practically represented in and interchanged through FHIR, this Implementation Guide defines all NZ-specific terminology [using a single common `CodeSystem`](CodeSystem-nz-rheumaticfever-codesystem.html).

The ValueSets in this IG draw on the single local CodeSystem and in some cases mix in terms from SNOMED CT International Edition, as needed to represent NZ clinical data.

#### NZ-specific terminology

NZ clinicians define rheumatic fever conditions/cases using NZ-specific classifiers in the following categories:

1. **summary classification** a rheumatic fever condition diagnosis
1. **severity** of rheumatic fever condition
1. **certainty** of rheumatic fever diagnosis
1. **symptomatic status of patient** at the time of rheumatic fever diagnosis

NZ also uses specific clinical terminology in rheumatic fever diagnosis and treatment in the following areas:

- secondary prophylaxis injection sites
- secondary prophylaxis medication frequency
- *Benzathine* (pencillin)-related allergy
- *indolent carditis* as a diagnosis criterion
- defining **roles** of whanau care team participants

Where possible all clinical terminology uses terms from the SNOMED International Edition.

New codings to suit NZ's unique RF requirements have been defined as terms in the New Zealand Edition of SNOMED.

Due to restrictions in public accessibility of SNOMED New Zealand edition terms, this Implementation Guide defines all NZ-specific terminology locally within a single [`CodeSystem`](CodeSystem-nz-rheumaticfever-codesystem.html).  Refer to the various ValueSet artefacts which draw on this CodeSystem for the purpose of the various code subsets.

### Validation of FHIR resource content

Application developers working with this FHIR API can validate the majority of FHIR resource representations using the IG itself and the default (tx.fhir.org) FHIR terminology service.

Medication resource content using NZMT terminology can be validated against public definitions on the [New Zealand Health Terminology Server](https://nzhts.digital.health.nz/fhir).

### Coding of national system identifiers

Some FHIR resource types profiled in this IG will contain data originating in the national Rheumatic Fever Care Coordination System (RFCCS).  To enable such data to be synchronised between FHIR and the RFCCS system, RFCCS identifiers are stored in FHIR instances of CarePlan, Condition, Observation, etc.

The IG handles these identifiers by slicing the identifier element of the FHIR resource, and allowing a **national system identifier coding** to be inserted.

Each identifiers from RFCCS or another 'external' national application is represented in RF FHIR resources using

1. a HISO-designated identifier naming system,
1. an identifier type code from the [external-system-identifier-type ValueSet](ValueSet-external-system-identifier-type-code.html) in this IG,
1. the value of the identifier itself.

Example a care plan having RFCCS identifier 00073693 is represented in a FHIR `CarePlan` as follows:
```json
{.. resource instance content
  "identifier" : [
    {
      "use" : "usual",
      "type" : {
        "coding" : [
          {
            "system" : "https://fhir-ig.digital.health.nz/rheumatic-fever/CodeSystem/nz-rheumaticfever-codesystem",
            "code" : "rfccs-careplan-id"
          }
        ]
      },
      "system" : "https://standards.digital.health.nz/ns/rf-ccs-id",
      "value" : "00073693"
    },
    ..other identifiers
  ]
.. instance content continues
}

```

