Alias: $sct = http://snomed.info/sct
Alias: $sctNZEdition = http://snomed.info/sct/21000210109      // Do not use; NZHTS doesn't support public lookup, expansion or validation of ANY codes in this 'codesystem'!

Alias: $UoM = http://unitsofmeasure.org

Alias: $obs-dataabsentreason = http://terminology.hl7.org/CodeSystem/data-absent-reason
Alias: $obs-interpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation

Alias: $careplan-status = http://hl7.org/fhir/ValueSet/request-status
Alias: $careplan-status-codes = http://hl7.org/fhir/request-status
Alias: $resource-types = http://hl7.org/fhir/resource-types
Alias: $restful-security-service = http://terminology.hl7.org/CodeSystem/restful-security-service
Alias: $goal-priority = http://terminology.hl7.org/CodeSystem/goal-priority
Alias: $loinc = http://loinc.org
Alias: $condition-clinical = http://terminology.hl7.org/CodeSystem/condition-clinical
Alias: $condition-ver-status = http://terminology.hl7.org/CodeSystem/condition-ver-status
Alias: $condition-category = http://terminology.hl7.org/CodeSystem/condition-category
Alias: $consentscope = http://terminology.hl7.org/CodeSystem/consentscope
Alias: $v3-ActCode = http://terminology.hl7.org/CodeSystem/v3-ActCode
Alias: $service-type = http://terminology.hl7.org/CodeSystem/service-type
Alias: $v3-ActPriority = http://terminology.hl7.org/CodeSystem/v3-ActPriority
Alias: $v3-ParticipationType = http://terminology.hl7.org/CodeSystem/v3-ParticipationType
Alias: $diagnosis-role = http://terminology.hl7.org/CodeSystem/diagnosis-role
Alias: $location-physical-type = http://terminology.hl7.org/CodeSystem/location-physical-type
Alias: $plan-definition-type = http://terminology.hl7.org/CodeSystem/plan-definition-type
Alias: $action-type = http://terminology.hl7.org/CodeSystem/action-type
Alias: $definition-topic = http://terminology.hl7.org/CodeSystem/definition-topic
Alias: $usage-context-type = http://terminology.hl7.org/CodeSystem/usage-context-type
Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category
Alias: $pathway-status-codes = https://build.fhir.org/ig/tewhatuora/fhir-rheumatic-fever/CodeSystem/longterm-pathway-state-cs

Alias: $v3-RoleCode   = http://terminology.hl7.org/CodeSystem/v3-RoleCode // aka https://terminology.hl7.org/6.0.2/ValueSet-v3-ServiceDeliveryLocationRoleType.html
Alias: $location-type = http://terminology.hl7.org/CodeSystem/v3-ActCode

Alias: $termServerExtension = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-preferredTerminologyServer
Alias: $preferredTermServer = https://nzhts.digital.health.nz/fhir

Alias: $BaseIdentifierTypeCS = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $nzmt = http://nzmt.org.nz
Alias: $RFCCS-id-naming-system = https://standards.digital.health.nz/ns/rf-ccs-id

// The following aliases must match the canonical Url of the IG at its published location.  
// FSH language syntax doesn't allow these to be defined automatically on the IG base Url using Canonical() syntax...
//Alias: $rfnzt = https://build.fhir.org/ig/tewhatuora/rheumatic-fever/CodeSystem/nz-rheumaticfever-codesystem
Alias: $rfnzt = https://fhir-ig.digital.health.nz/rheumatic-fever/CodeSystem/nz-rheumaticfever-codesystem
