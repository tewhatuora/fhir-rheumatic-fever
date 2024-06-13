RuleSet: HPIFacilityLocation(hpi-facility-id, location-name)
* location.identifier.use = #official
* location.identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* location.identifier.value = {hpi-facility-id}
* location.display = {location-name}

RuleSet: ServiceDeliveryLocationRoleType(type-code)
* coding.system = $location-type
* coding.code = #"{type-code}"
// * coding.display = "{display}"
