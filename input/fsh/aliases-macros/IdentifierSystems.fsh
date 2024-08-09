////// ///// /////  ///// /////  ///// /////  ///// ///// 
// NHI
// sets up Identifier elements to form logical ref to an NHI resource
// Usage in a FSH Instance:
//   * identifier insert NHIIdentifier(ZKC7284)
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
* system = "https://standards.digital.health.nz/ns/nz-address-id"
* value = "{esam-id}"


// sets up ref to an external identifier as the specified rfccs care team object id
RuleSet: RFCCSCarePlanIdentifier(rfccs-id)

* system = $RFCCS-id-naming-system
* value = "{rfccs-id}"
* use = #usual
* type  = $rfnzt#rfccs-careplan-id


// sets up ref to an external identifier as the specified rfccs careplanactivity object id (used for SF Encounters which represent Appointments - go figure)
RuleSet: RFCCSCarePlanActivityIdentifier(rfccs-id)

* system = $RFCCS-id-naming-system
* value = "{rfccs-id}"
* use = #usual
* type  = $rfnzt#rfccs-careplanactivity-id

// sets up ref to an external identifier as the specified rfccs care team object id
RuleSet: RFCCSConditionIdentifier(rfccs-id)

* system = $RFCCS-id-naming-system
* value = "{rfccs-id}"
* use = #usual
* type  = $rfnzt#rfccs-condition-id


// sets up ref to an external identifier as the specified rfccs care team object id
RuleSet: RFCCSCareTeamIdentifier(rfccs-id)

* system = $RFCCS-id-naming-system
* value = "{rfccs-id}"
* use = #usual
* type  = $rfnzt#rfccs-careteam-id


// sets up ref to an external identifier as the specified rfccs care team object id
RuleSet: RFCCSObservationIdentifier(rfccs-id)

* system = $RFCCS-id-naming-system
* value = "{rfccs-id}"
* use = #usual
* type  = $rfnzt#rfccs-observation-id


RuleSet: EpisurvNumber(episurv-id)
// sets up a USUAL identifier to hold an external (rfccs) identifier of an object

* system = "https://episurv.esr.cri.nz/"                // this is just an example and probably incorrect
* value = "{episurv-id}"
* type  = $rfnzt#episurv-number


////// ///// /////  ///// /////  ///// /////  ///// ///// 

// Set up an Identifier element value example with the specified label and value 
// Replaces any existing example.
RuleSet: MakeProfileIdentifierExample(example-label,example-value)

* ^example.label = "{example-label}"
* ^example.valueString = "{example-value}"            // note string here because example is of 'open' (*) type

// Set up an Identifier system example with the specified text 
RuleSet: MakeProfileIdentifierSystemExample(system-uri)
* ^example.label = "uri"                                // .. only here all ElementDefinitions must have .example.label
* ^example.valueUri = {system-uri}                    // note string here because example is of 'open' (*) type

// Make an Identifier type codeable concept using the specified external system type code
RuleSet: IdentifierTypeCodeableConcept(identifier-type-code)
* coding.code = #{identifier-type-code}
* coding.system  = $rfnzt

// Make an Identifier type using a code from the HL7 FHIR base code system
RuleSet: BaseIdentifierType(identifier-base-type-code)
* coding.code = #{identifier-base-type-code}
* coding.system = $BaseIdentifierTypeCS
