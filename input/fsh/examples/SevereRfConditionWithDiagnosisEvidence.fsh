Instance: SevereRfConditionWithDiagnosisEvidence
InstanceOf: RheumaticFeverCondition
Usage: #example
Description: "An example of a severe rheumatic fever Condition with linked evidence as 3 profiled Observation instances."

* meta.profile = Canonical(RheumaticFeverCondition)
* meta.versionId = "1"
* meta.lastUpdated = "2024-06-04T02:00:00Z"
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

* category =  $sct#58718002 "Rheumatic fever (disorder)"

* severity = http://snomed.info/sct#24484000 "Severe"
* code = $sct#195528001 "Acute rheumatic fever (disorder)"

* encounter = Reference(DiagnosisEncounter)
* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])

* onsetDateTime = "2023-02-05T02:00:00Z"
* recordedDate =  "2023-03-12T02:00:00Z"
* recorder insert ReferencePractitioner(99ZZFX,[[Dottie McStuffins]])

* extension[rhdSeverity].url = Canonical(rf-condition-rhdseverity)
* extension[rhdSeverity].valueCoding = $sct#24484000 "Severe (severity modifier) (qualifier value)"

* extension[diagnosticCertainty].url = Canonical(rf-condition-diagnosticcertainty)
* extension[diagnosticCertainty].valueCoding = $RFdiagnosticCertaintyCS#probable "probable"

* extension[assessmentDate].url = Canonical(rf-condition-assessmentdate)
* extension[assessmentDate].valueDateTime = "2023-03-12T02:00:00Z"

* extension[symptomStatusAtDiagnosis].url = Canonical(rf-condition-symptomaticAtDiagnosis)
* extension[symptomStatusAtDiagnosis].valueCoding = $sct#264931009 "Symptomatic (qualifier value)"

// link to the three Observation instances which represent the groups of diagnosis detail

* evidence[+].code insert SNOMEDCoding(439238004,[[Echocardiography test interpretation (observable entity)]])
* evidence[=].detail = Reference(DiagnosisDetail-ECHO)

* evidence[+].code insert SNOMEDCoding(447541000210107,[[New Zealand Jones Criteria Assessment (observable entity)]])
* evidence[=].detail = Reference(DiagnosisDetail-JonesCriteria)

* evidence[+].code insert SNOMEDCoding(448011000210101,[[Evidence of preceding Streptococcus group A infection (observation entity)]])
* evidence[=].detail = Reference(DiagnosisDetail-StrepEvidence)
