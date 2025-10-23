// **** **** **** **** **** ****
// sets up a Quantity based on a value and standard unit of measure
RuleSet: UnitOfMeasureQuantity(value,unit,code)
* value = {value}
* unit = "{unit}"
* system = $UoM
* code = #"{code}"

// **** **** **** **** **** ****
// handy functions for making Observation components
// make a coded observation component that is observed present (true) or absent (false)
RuleSet: ObservationPresent(system, code, display, presentNotAbsent)
* code.coding.system = {system}
* code.coding.code = #"{code}"
* code.coding.display = "{display}"
* code.text = "{display}"
* valueBoolean = {presentNotAbsent}

// make a coded observation component with a string value 
RuleSet: ObservationString(system, code, display, textString)
* code.coding.system = {system}
* code.coding.code = #"{code}"
* code.coding.display = "{display}"
* code.text = "{display}"
* valueString = "{textString}"

// make a coded observation component with a string value 
RuleSet: ObservationDate(system, code, display, dateTime)
* code.coding.system = {system}
* code.coding.code = #"{code}"
* code.coding.display = "{display}"
* code.text = "{display}"
* valueDateTime = {dateTime}

// make a coded observation component with a SNOMED-coded value 
RuleSet: ObservationCodeableValue(system, compCode, compDisplay, valueSystem, valueCode, valueDisplay)
* code.coding.system = {system}
* code.coding.code = #"{compCode}"
* code.coding.display = "{compDisplay}"
* code.text = "{compDisplay}"
* valueCodeableConcept.coding.system = {valueSystem}
* valueCodeableConcept.coding.code = #"{valueCode}"
* valueCodeableConcept.coding.display = "{valueDisplay}"
* valueCodeableConcept.text = "{valueDisplay}"

// make an coded observation component for a case where it is unknown if the observation was actually done or what the result was
RuleSet: ObservationAbsent(system, code, display, acode, adisplay)
* code.coding.system = {system}
* code.coding.code = #"{code}"
* code.coding.display = "{display}"
* code.text = "{display}"
* dataAbsentReason.coding.system = $obs-dataabsentreason
* dataAbsentReason.coding.code = #"{acode}"
* dataAbsentReason.coding.display = "{adisplay}"

// make an coded observation component with an measured quantity
RuleSet: ObservationQuantity(system, code, display, mvalue, munit, mcode)
* code.coding.system = {system}
* code.coding.code = #"{code}"
* code.coding.display = "{display}"
* code.text = "{display}"
* valueQuantity.value = {mvalue}
* valueQuantity.unit = "{munit}"
* valueQuantity.system = $UoM
* valueQuantity.code = #"{mcode}"

// make an coded observation component with an interpretation code
RuleSet: ObservationInterpretation(system, code, display, icode, idisplay)
* code.coding.system = {system}
* code.coding.code = #"{code}"
* code.coding.display = "{display}"
* code.text = "{display}"
* interpretation.coding.system = $obs-interpretation
* interpretation.coding.code = #"{icode}"
* interpretation.coding.display = "{idisplay}"

// make an coded observation component with a measured quantity AND an interpretation code
RuleSet: ObservationQuantityAndInterpretation(system, code, display, mvalue, munit, mcode, icode, idisplay)
* code.coding.system = {system}
* code.coding.code = #"{code}"
* code.coding.display = "{display}"
* code.text = "{display}"
* valueQuantity.value = {mvalue}
* valueQuantity.unit = "{munit}"
* valueQuantity.system = $UoM
* valueQuantity.code = #"{mcode}"
* interpretation.coding.system = $obs-interpretation
* interpretation.coding.code = #"{icode}"
* interpretation.coding.display = "{idisplay}"
