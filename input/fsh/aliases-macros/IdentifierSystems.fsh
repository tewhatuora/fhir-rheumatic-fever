////// ///// /////  ///// /////  ///// /////  ///// ///// 
// NHI
// sets up Identifier elements to form logical ref to an NHI resource
// Usage in a FSH Instance:
//   * identifier insert NHIIdentifier(SCF7824)
RuleSet: NHIIdentifier(nhi-id)
* use = #official
* system = "https://standards.digital.health.nz/ns/nhi-id"
* value = "{nhi-id}"
// * type = $BaseIdentifierTypeCS#JHN    // dont think we need to go this far

////// ///// /////  ///// /////  ///// /////  ///// ///// 
// HPI
// sets up Identifier elements to form logical ref to an HPI Facility
// Usage in a FSH Instance:
//   * identifier insert HPIFacIdentifier([[XXXnnn-X]])
RuleSet: HPIFacIdentifier(hpi-fac-id)
* use = #official
* system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* value = "{hpi-fac-id}"


// sets up Identifier elements to form logical ref to an HPI Organization
// Usage in a FSH Instance:
//   * identifier insert HPIOrgIdentifier([[XXXnnn-X]])
RuleSet: HPIOrgIdentifier(hpi-org-id)
* use = #official
* system = "https://standards.digital.health.nz/ns/hpi-organisation-id"
* value = "{hpi-org-id}"

// sets up Identifier elements to form logical ref to an HPI Pracitioner (CPN)
// Usage in a FSH Instance:
//   * identifier insert HPIPractitionerIdentifier([[nnXXXX]])
RuleSet: HPIPractitionerIdentifier(hpi-practitioner-id)
* use = #official
* system = "https://standards.digital.health.nz/ns/hpi-practitioner-id"
* value = "{hpi-practitioner-id}"


////// ///// /////  ///// /////  ///// /////  ///// ///// 
// eSAM
// Sets up Identifier elements to represent an eSAM unique address identifier
// Usage in a FSH Instance:
//   * identifier insert eSAMIdentifier([[nnnnnn]])
RuleSet: eSAMIdentifier(esam-id)
* use = #usual
* system = "https://esam.co.nz"
* value = "{esam-id}"


// sets up ref to an external identifier as the specified salesforce care team object id
RuleSet: SalesforceCarePlanIdentifier(salesforce-id)

* system = "https://developer.salesforce.com/docs"      // this is just an example and probably incorrect
* value = "{salesforce-id}"
* use = #usual
* type = $ExternalIdentifierTypeCS#salesforce-careplan-id


// sets up ref to an external identifier as the specified salesforce careplanactivity object id (used for SF Encounters which represent Appointments - go figure)
RuleSet: SalesforceCarePlanActivityIdentifier(salesforce-id)

* system = "https://developer.salesforce.com/docs"      // this is just an example and probably incorrect
* value = "{salesforce-id}"
* use = #usual
* type = $ExternalIdentifierTypeCS#salesforce-careplanactivity-id

// sets up ref to an external identifier as the specified salesforce care team object id
RuleSet: SalesforceConditionIdentifier(salesforce-id)

* system = "https://developer.salesforce.com/docs"      // this is just an example and probably incorrect
* value = "{salesforce-id}"
* use = #usual
* type = $ExternalIdentifierTypeCS#salesforce-condition-id


// sets up ref to an external identifier as the specified salesforce care team object id
RuleSet: SalesforceCareTeamIdentifier(salesforce-id)

* system = "https://developer.salesforce.com/docs"      // this is just an example and probably incorrect
* value = "{salesforce-id}"
* use = #usual
* type = $ExternalIdentifierTypeCS#salesforce-careteam-id


// sets up ref to an external identifier as the specified salesforce care team object id
RuleSet: SalesforceObservationIdentifier(salesforce-id)

* system = "https://developer.salesforce.com/docs"      // this is just an example and probably incorrect
* value = "{salesforce-id}"
* use = #usual
* type = $ExternalIdentifierTypeCS#salesforce-observation-id


RuleSet: EpisurvNumber(episurv-id)
// sets up a USUAL identifier to hold an external (salesforce) identifier of an object

* system = "https://episurv.esr.cri.nz/"                // this is just an example and probably incorrect
* value = "{episurv-id}"
* type = $ExternalIdentifierTypeCS#episurv-number


////// ///// /////  ///// /////  ///// /////  ///// ///// 

// Set up an Identifier element value example with the specified label and value 
// Replaces any existing example.
RuleSet: MakeProfileIdentifierExample(example-label,example-value)

* ^example.label = "{example-label}"
* ^example.valueString = "{example-value}"            // note string here because example is of 'open' (*) type

// Set up an Identifier system example with the specified text 
RuleSet: MakeProfileIdentifierSystemExample(system-description)
* ^example.valueString = "{system-description}"       // note string here because example is of 'open' (*) type

// Make an Identifier type codeable concept using the specified external system type code
RuleSet: IdentifierTypeCodeableConcept(identifier-type-code)
* coding.code = #{identifier-type-code}
* coding.system = $ExternalIdentifierTypeCS

// Make an Identifier type using a code from the HL7 FHIR base code system
RuleSet: BaseIdentifierType(identifier-base-type-code)
* coding.code = #{identifier-base-type-code}
* coding.system = $BaseIdentifierTypeCS
