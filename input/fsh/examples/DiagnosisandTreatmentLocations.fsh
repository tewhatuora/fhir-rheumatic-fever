// //// //// //// //// //// 
// This file creates a variety of inline NzLocations for use in other examples (typically used as contained instances)

// //// //// //// //// //// 
Instance: PublicHospital
InstanceOf: NzLocation
Description: "Example public hospital location (HPI Test Data)"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "Public Hospital"
* type insert ServiceDeliveryLocationRoleType(HOSP)
* identifier  insert HPIFacIdentifier([[FZZ933-E]])


// //// //// //// //// //// 
Instance: DHBOutreachClinic
InstanceOf: NzLocation
Description: "Example clinic location (HPI Test Data)"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "DHB Outreach Clinic"
* type insert ServiceDeliveryLocationRoleType(HOSP)
* identifier  insert HPIFacIdentifier([[FZZ926-H]])


// //// //// //// //// //// 
Instance: WhangareiGirlsHighSchool
InstanceOf: NzLocation
Description: "Example school identified by name and MoE school number"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "Whangārei Girls’ High School"
* identifier.use = #official
* identifier.system = "https://www.educationcounts.govt.nz/directories/list-of-nz-schools"
* identifier.value = "16"
* type insert ServiceDeliveryLocationRoleType(SCHOOL)



// //// //// //// //// //// 
Instance: RedDiamondWhangarei
InstanceOf: NzLocation
Description: "Red Diamond Generic Medical Centre- Whangarei (HPI Test Data)"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "Red Diamond Generic Medical Centre- Whangarei"
* type insert ServiceDeliveryLocationRoleType(PC)
* identifier  insert HPIFacIdentifier([[FZZ860-D]])


// //// //// //// //// //// 
Instance: SomeCommunityPlace
InstanceOf: NzLocation
Description: "Example of a community location identified by name only"
Usage: #inline
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NzLocation"
* name = "A friendly community place"
* type insert ServiceDeliveryLocationRoleType(COMM)








