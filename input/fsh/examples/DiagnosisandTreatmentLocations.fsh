// //// //// //// //// //// 
// This file creates a variety of inline NzLocations for use as contained instances in other examples

// //// //// //// //// //// 
Instance: StarshipHospital
InstanceOf: NzLocation
Description: "Example of a hospital location identified by name (not HPI)"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "Starship Hospital"
* type insert ServiceDeliveryLocationRoleType(HOSP)


// //// //// //// //// //// 
Instance: FantasticHospitalClinic
InstanceOf: NzLocation
Description: "Example of a clinic identified by name only"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "The Fantastic Hospital Clinic"
* type insert ServiceDeliveryLocationRoleType(HOSP)

// //// //// //// //// //// 
Instance: MasseyHighSchool
InstanceOf: NzLocation
Description: "Example of a school location identified by name and schoold ID"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "Massey High School"
* identifier.use = #official
* identifier.system = "https://www.education.govt.nz"
* identifier.value = "43"
* type insert ServiceDeliveryLocationRoleType(SCHOOL)


// //// //// //// //// //// 
Instance: FriendlyCommunityPlace
InstanceOf: NzLocation
Description: "Example of a community location identified by name only"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "A friendly community place"
* type insert ServiceDeliveryLocationRoleType(COMM)


// //// //// //// //// //// 
Instance: MadeleinesHome
InstanceOf: NzLocation
Description: "Example of a patient home location (identified by name only)"
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


// //// //// //// //// //// 
Instance: PushPullDentalClinic
InstanceOf: NzLocation
Description: "example of a specialist follow-up provider location (identified by name only)"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "Push Pull Dental Clinic"
* address[0].use = #home
* address[=].text = "Level 24 Majestic Centre"
* address[=].line[0] = "100 Willis Street"
* address[=].line[+] = "Wellington Central"
* address[=].city = "Wellington"
* address[=].postalCode = "6011"
* address[=].country = "NZL"
* address[=].period.start = "2023-08-01"
// Example of HPI facility id location
// real HPI facility, display = "PHNs Whangarei"
// * identifier.use = #official
// * identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"
// * identifier.value = "F3S457-C"



