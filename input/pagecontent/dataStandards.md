### Data standards

This section defines standards that apply when mapping data to the New Zealand rheumatic fever FHIR representation.

#### Tagging

All rheumatic fever resource instances should be tagged with the SNOMED code 58718002 "Rheumatic Fever (disorder)"

This is done in FHIR by adding a tag in the metadata of each instance (so the FHIRPath expression `meta.tag.code=58718002` is true).

This consistent tagging enables proper scoping of data access controls as well as facilitating analytics across the rheumatic fever FHIR data set.

The rheumatic fever resource profiles on FHIR `CarePlan`, `Condition`, `CareTeam`, `Observation` (DiagnosisGroup), `MedicationRequest` and `Patient` resources specify an invariant which requires use of the RF SNOMED code tag when creating valid instances.

---

#### Labelling

Applications may label rheumatic fever resource instances with the `R` "restricted" security label, when they contain sensitive content.  The presence of this label on an instance means that API consumers need to obtain additional privilege to access this data via a FHIR operation.

This is done in FHIR by adding a label in the metadata of each instance (so the FHIRPath expression `meta.security.code=R` is true).

---

#### Mapping patient registration status to FHIR `CarePlan.status`

Mapping care plan status between the RFCCS national system and FHIR is straightforward as given by the following table.

|**Patient registration status value (RCCCS)**|**FHIR CarePlan status code [(binding)](https://hl7.org/fhir/R4B/valueset-request-status.html)**|**FHIR status definition**|
|:----|:----|:----|
|New (Draft)            |`#draft` |The request (CarePlan) has been created but is not yet complete or ready for action.
|Care Underway (Active) |`#active` |The request (CarePlan) is in force and ready to be acted upon.
|Care On-Hold (On-Hold) |`#on-hold` |The request (CarePlan) and any implicit authorization to act) has been temporarily withdrawn but is expected to resume in the future.|
|Completed              |`#completed`|The activity described by the request has been fully performed. No further activity will occur.
|Revoked (TBC) |`#revoked` | The request (CarePlan) has been terminated prior to the known full completion of the intended actions. No further activity should occur. |

---

#### Patient's Current Address -- type, use and currency

Applies to **patient's current address**.

|**RFCCS value*|**FHIR [Address.use](https://fhir.org.nz/ig/base/StructureDefinition-NzAddress-definitions.html#Address.use) code**|**FHIR [Address.type](https://fhir.org.nz/ig/base/StructureDefinition-NzAddress-definitions.html#Address.type) code**|**FHIR Date(s) in [Address.period](https://fhir.org.nz/ig/base/StructureDefinition-NzAddress-definitions.html#Address.period)**|
|:----|:----|:----|:----|
|*Home*|`#home`|none|`period.start` = date when patient registered / address recorded $|
|*Work*|`#work`|none|`period.start` = date when patient registered / address recorded $|
|*Temporary*|`#temp`|none|`period.start` = date when patient registered / address recorded $|
|*Inactive*|`#old`|none|No `period`, or `period.end` = any date in the past ^|
|*Physical*|none|`#physical`|`period.start` = date when patient registered / address recorded $|
|*Postal*|none|`#postal`|`period.start` = date when patient registered / address recorded $|
|*Current*|none|none|`period.start` = any date in the past; `period.end`, if specified, must be in the future|


Notes
  
1. 'none' means no code is set - ie. the element is absent in the FHIR JSON representation

1. $ Use date of patient registration as the default value for Address.period.start

1. ^ When there is neither a **use** nor **type** code and `Address.period` is present with the current date in range, this maps to ‘Current’ in RFCCS.  If `Address.period` is missing, the address shall be mapped to 'Inactive'

---

#### Encounter location mapping

Representation of locations where rheumatic fever secondary prophylaxis encounters take place.

|**RFCCS value*|**FHIR `Location.type`<br>[ServiceDeliveryLocationRoleType](https://terminology.hl7.org/3.1.0/ValueSet-v3-ServiceDeliveryLocationRoleType.html) code**|**FHIR code meaning**|
|:----|:----|:----|
|*Hospital*    |`#HOSP`   |Hospital|
|*Home*        |`#PTRES`  |Patient's residence|
|*School*      |`#SCHOOL` |School|
|*Work*        |`#WORK`   |Work|
|*Clinic*      |`#PC`     |Primary care clinic|
|*Virtual*     |**special case**<br> code `#VR` in [ActEncounterCode]( http://terminology.hl7.org/CodeSystem/v3-ActCode) system |virtual|

---

#### Mapping members of whanau care team to `Patient.contact[]`

As whanau/relative members of a rheumatic fever patient's care team need to have contact details, role and relationship to the patient represented, this IG uses `Patient.contact` rather than an instance of `CareTeam` resource.  

The logic for mapping data between the RFCCS national system and FHIR is given by the following table.

|**RFCCS data field**|**FHIR element of `Patient` resource**|**FHIR data type**|**translation**|**FHIR data example 1**|**FHIR data example 2**|
|:----|:----|:----|:-----|:----|:----|
|care team member role|`.whanauMemberCareRole` **extension**|coding (SNOMED)|-|**$sct#58626002** *Legal Guardian*|**$sct#394738000** *Other related persons (person)*|
|care team member relationship to patient (freetext)|`.whanauMemberCareRelationship` **extension**|string|-|`"mother"`|`"brother in law"`|
|first name|`name.given`|string|-|`"Beryl"`|`"Mike"`|
|last name|`name.family`|string|-|`"Hackett"`|`"Westbrook"`|
|primary contact (yes/no)|`.whanauMemberCarePrimary` **extension**|boolean|-|`true`|`false`|
|status (active/inactive)|`.period.start` - `period.end`|datetime x2|Consider member an ACTIVE contact unless BOTH dates are in the past, in which case INACTIVE|`"2023-06-01"` to `"2026-05-31"`|`"2021-01-01"` to `"2021-01-01"`|

---


#### Language mapping

Applies to **patient's preferred language**.

Patient language is represented in the `Patient.communication.language` element.

Two character codes in the preferred *CommonLanguages* binding are not sufficient to encode the patient languages available in RFCCS.

Therefore the Te Whatu Ora Shared Care API uses **ISO 639-3 three character language codes** which is allowed by the *AllLanguages* (maximum) binding on [Patient.communication.language](StructureDefinition-nz-sharedcare-rheumaticfever-patient-definitions.html#Patient.communication.language).

The translation between RFCCS language and FHIR is given in the table below. 

|**English name of language**|**ISO 639-3 language code</br> to use for FHIR mapping**|**RFCCS Health Cloud language**|**IANA primary language SUBTAG (BCP47)**|
|:----|:----|:----|:----|
|English|eng|English|en|
|Spanish (Castilian)|spa|Spanish|es|
|Afrikaans|afr|Afrikaans|af|
|Arabic|ara|Arabic|ar|
|Rarotongan|rar|Cook Islands Maori| |
|Dutch|dut|Dutch|nl|
|French|fre|French|fr|
|German|ger|German|de|
|Gujarati|guj|Gujarati|gu|
|Hindi|hin|Hindi|hi|
|Italian|ita|Italian|it|
|Japanese|jpn|Japanese|ja|
|Korean|kor|Korean|ko|
|Mandarin Chinese|cmn|Mandarin| |
|Maori|mao|Maori|mi|
|New Zealand Sign Language|nzs|New Zealand Sign Language| |
|Jinyu Chinese|cjy|"Northern Chinese"| |
|Panjabi; Punjabi|pan|Punjabi|pa|
|Russian|rus|Russian|ru|
|Samoan|smo|Samoan|sm|
|Tagalog|tgl|Tagalog|-|
|Tamil|tam|Tamil|ta|
|Thai|tha|Thai|th|
|Tonga (Tonga Islands)|ton|Tongan|to|
|Vietnamese|vie|Vietnamese|vi|
|Yue Chinese (Cantonese)|yue|Cantonese| |

See the [example patient Sage Westbrook](Patient-SageWestbrook.json.html) for how to correctly code language for FHIR representation of rheumatic fever patients.

---

#### FHIR representation of Rheumatic Heart Disease Severity

Rheumatic heart disease severity is the driving factor for severity of a patient's rheumatic fever diagnosis.

To fully represent severity values supported by the RFCCS national application, three FHIR elements need to be used:

1. `Condition.severity`: this is the basic severity classifier in a stock FHIR Condition

1. `RheumaticFeverCondition.rhdSeverity` - this is a profile extension which allows a Condition to capture a specific SNOMED code matching the patient's rheumatic heart disease situation.  
 
1. `RheumaticFeverCondition.assessmentDate` - another profile extension to Condition which allows a specific date of assessment to be recorded (`.recordedDate` in Condition is already used to capture date of diagnosis).  

Translation between the RFCCS RHD severity value and FHIR representation is given by the following table. 

|**RFCCS - Rheumatic Heart Disease Severity classification**|**FHIR [Condition.severity](StructureDefinition-nz-sharedcare-rheumaticfever-condition-definitions.html#Condition.severity) (SNOMED)**|**[*rhdSeverity*](StructureDefinition-rf-condition-rhdseverity.html) extension in RheumaticFeverCondition (SNOMED)**|**FHIR NzCondition.long-term-condition indicator ^**|
|:----|:----|:----|:----|
|“none”|do not map|**#260413007** None (qualifier value)|TRUE|
|“trivial”|do not map|**#300171000210106** Trivial (qualifier value)|TRUE|
|“mild”|**#255604002** Mild (qualifier value)|**#255604002** Mild (qualifier value)| TRUE|
|“moderate”|**#1255665007** Moderate (qualifier value)|**#1255665007** Moderate (qualifier value)|TRUE |
|“severe”|**#24484000** Severe (severity modifier) (qualifier value)|**#24484000** Severe (severity modifier) (qualifier value)|TRUE |
|“Post valve repair”|**#24484000** Severe (severity modifier) (qualifier value)|Post valve repair or replacement **#59391000119102** History of heart valve repair (situation)| TRUE|
|“Post valve replacement”|**#24484000** Severe (severity modifier) (qualifier value)| **#301561000210102** History of heart valve replacement (situation)|TRUE |
|“Unknown”|do not map|**#261665006** Unknown (qualifier value)|TRUE |


^ Note: The FHIR representation of rheumatic fever condition includes setting the [long-term condition extension](https://fhir.org.nz/ig/base/StructureDefinition-NzCondition-definitions.html#Condition.extension:long-term-condition) as the disease is considered in NZ a long term condition.

---
