// //// //// //// //// //// 
// This file creates a variety of inline NzLocations for use as contained instances in other examples

// Example of a Hospital identified by its name only (not HPI)
Instance: StarshipHospital
InstanceOf: NzLocation
Description: "Example of a hospital location identified by name only"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "Starship Hospital"
* type insert ServiceDeliveryLocationRoleType(HOSP)


// //// //// //// //// //// 
// example of a hospital clinic location identified by name only
Instance: FantasticHospitalClinic
InstanceOf: NzLocation
Description: "Example of a clinic identified by name only"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "The Fantastic Hospital Clinic"
* type insert ServiceDeliveryLocationRoleType(HOSP)


// Example of a school location identified by its name and school ID
Instance: MasseyHighSchool
InstanceOf: NzLocation
Description: "Example of a school location"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "Massey High School"
* identifier.use = #official
* identifier.system = "https://www.education.govt.nz"
* identifier.value = "43"
* type insert ServiceDeliveryLocationRoleType(SCHOOL)


// //// //// //// //// //// 
// example of a community location identified by its name only
Instance: FriendlyCommunityPlace
InstanceOf: NzLocation
Description: "Example of a community location identified by name only"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "A friendly community place"
* type insert ServiceDeliveryLocationRoleType(COMM)


// //// //// //// //// //// 
// example of a community location identified by its name only
Instance: MadeleinesHome
InstanceOf: NzLocation
Description: "Example of a patient home location"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "Madeleine's Home"
* address[0].use = #home
* address[=].text = "373 Jackson Street, Petone, Lower Hutt 5012, New Zealand"
* address[=].line[0] = "373 Jackson Street"
* address[=].line[+] = "Petone"
* address[=].city = "Lower Hutt"
* address[=].postalCode = "5012"
* address[=].country = "NZL"
* address[=].period.start = "2023-08-01"



// Example of HPI facility id location
// real HPI facility, display = "PHNs Whangarei"
// * identifier.use = #official
// * identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"
// * identifier.value = "F3S457-C"



