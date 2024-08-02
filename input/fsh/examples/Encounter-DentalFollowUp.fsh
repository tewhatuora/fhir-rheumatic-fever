Instance: DentalFollowUpEncounter
InstanceOf: Encounter
Usage: #example
Description: "Example of a rheumatic fever patient encounter for dental specialist follow-up"

* meta.profile = Canonical(Encounter)
* meta.versionId = "2"
* meta.lastUpdated = "2024-07-18T04:00:00Z"
* meta insert RFTag

* status = #finished

* appointment = Reference(FollowUp-Dental-August-Fulfilled)

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
* type =  $sct#58718002 "Rheumatic fever (disorder)"

* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])

* participant[+].individual insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])

* period.start = "2023-08-15T02:10:00Z"    // UTC datetime
* period.end = "2023-08-15T03:15:00Z"    // UTC datetime

* serviceProvider insert ReferenceOrganisation(GZZ851-K,[[Extractive Dental Revenue Limited]])
* serviceType = $sct#772071006 "Referral to dentist (procedure)" 

* location[+].location = Reference(PullingTeethDental)
* contained[0] = PullingTeethDental

// //// //// //// //// //// 
Instance: PullingTeethDental
InstanceOf: NzLocation
Description: "example of a specialist follow-up provider location (identified by name only)"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "Pulling Teeth Dental- Auckland"
* address[0].use = #home
* address[=].text = "41 High Street, CBD, Auckland 1010, New Zealand"
* address[=].line[0] = "41 High Street"
* address[=].line[+] = "CBD"
* address[=].city = "Auckland"
* address[=].postalCode = "1010"
* address[=].country = "NZL"
* identifier insert HPIFacIdentifier([[FZZ777-F]])
