Alias: $nz-interpreter = http://hl7.org/fhir/StructureDefinition/patient-interpreterRequired

Profile: RheumaticFeverPatient
Parent: NzPatient
Title: "Rheumatic Fever Patient"
Description: "NzPatient-based FHIR resource for representing rheumatic fever patients"
Id: nz-rheumaticfever-patient

* ^version = "1.0.0"
* ^jurisdiction = urn:iso:std:iso:3166#NZ
* ^purpose = "Profiles a New Zealand patient with rheumatic fever (extends NzPatient resource)"
* insert metaContactDetail([[David Grainger]],[[david.grainger@middleware.co.nz]])

* meta obeys RFNZTagConstraint      // see file CategoriesLabelsTags.fsh

// elements modified from base profile
* name 1..1
* link.other only Reference(Patient)
* link.type = #seealso

// add another extension to the ones NzPatient already does on FHIR Patient
* extension contains
    $nz-interpreter named interpreterRequired 0..*

* extension[interpreterRequired] ^short = "Does this person require an interpreter?"

// extensions to Patient.contact to track the role and relationship of whanau member in contact[]s
* contact.extension contains
  RfPatientWhanauMemberRoleExtension named whanauMemberCareRole 0..1 and
  RfPatientWhanauMemberRelationshipExtension named whanauMemberCareRelationship 0..1 and
  RfPatientWhanauMemberPrimaryExtension named whanauMemberCarePrimary 0..1

// elements removed by this profile
* implicitRules 0..0
* language 0..0
