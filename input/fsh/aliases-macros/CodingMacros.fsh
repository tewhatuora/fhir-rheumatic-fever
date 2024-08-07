RuleSet: SNOMEDCoding(code,display)
// sets up CodeableConcept referencing SNOMED

* coding.system = $sct
* coding.code = #"{code}"
* coding.display = "{display}"

// sets up CodeableConcept referencing SNOMED
// probably not used any more as SNOMED NZ is not a workable ting
// RuleSet: SNOMEDNZCoding(code,display)
// * coding.system = $sctNZ
// * coding.code = #"{code}"
// * coding.display = "{display}"

// sets up Coding referencing a code in the local RF codesystem
RuleSet: RFNZCoding(code-value,display)
* coding.system = Canonical(NzRheumaticFeverCodeSystem)
* coding.code = #{code-value}
* coding.display = "{display}"

// // sets up Coding referencing the generic rheumatic fever SNOMED code
// RuleSet: THERFSNOMEDCode
// * coding = $sct#58718002 "Rheumatic fever (disorder)"
