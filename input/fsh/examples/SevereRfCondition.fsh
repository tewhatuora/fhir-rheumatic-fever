Instance: SevereRfCondition
InstanceOf: RheumaticFeverCondition
Usage: #example
Description: "An example of a rheumatic fever condition as initially diagnosed at registration"

* meta.profile = Canonical(RheumaticFeverCondition)
* meta.versionId = "5"
* meta.lastUpdated = "2024-05-29T05:45:00Z"
* meta insert RFTag

* identifier[NationalSystem][0] insert SalesforceConditionIdentifier([[CON-0206]])     // corresponding salesforce record
* identifier[NationalSystem][+] insert  EpisurvNumber(21-383414-AK)                    // EPISurv nunber as notified to in diagnosis

* clinicalStatus = http://terminology.hl7.org/CodeSystem/condition-clinical#active "Active"
* clinicalStatus.text = "Active"
* verificationStatus = http://terminology.hl7.org/CodeSystem/condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"

// * category.coding[0] = http://terminology.hl7.org/CodeSystem/condition-category#encounter-diagnosis "Encounter Diagnosis"
// * category.coding[+] = http://snomed.info/sct#439401001 "Diagnosis"
// * category.text = "Diagnosis"

* category[+] = $sct#58718002 "Rheumatic fever (disorder)"    // One of two categories that must be used in an Rf Condition
* category[+] insert RFNZCoding(rf-nz,[[rheumatic fever]])    // One of two categories that must be used in an Rf Condition

* severity = http://snomed.info/sct#24484000 "Severe"
* code = $sct#195528001 "Acute rheumatic fever (disorder)"

// * encounter = initially there is no encounter to reference - this changes after detailed diagnosis
* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])

* onsetDateTime = "2023-02-05T02:00:00Z"
* recordedDate =  "2023-03-12T02:00:00Z"
* recorder insert ReferencePractitioner(99ZZFX,[[Dottie McStuffins]])

* extension[rhdSeverity].url = Canonical(rf-condition-rhdseverity)
* extension[rhdSeverity].valueCoding = $sct#24484000 "Severe (severity modifier) (qualifier value)"

* extension[diagnosticCertainty].url = Canonical(rf-condition-diagnosticcertainty)
* extension[diagnosticCertainty].valueCoding = $rfnzt#probable "probable"

* extension[assessmentDate].url = Canonical(rf-condition-assessmentdate)
* extension[assessmentDate].valueDateTime = "2023-03-12T02:00:00Z"

* extension[symptomStatusAtDiagnosis].url = Canonical(rf-condition-symptomaticAtDiagnosis)
* extension[symptomStatusAtDiagnosis].valueCoding = $sct#264931009 "Symptomatic (qualifier value)"

