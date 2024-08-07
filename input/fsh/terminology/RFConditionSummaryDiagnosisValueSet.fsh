ValueSet: RFConditionSummaryDiagnosisValueSet
Id: rf-condition-diagnosis-code
Title: "Codes for summary diagnosis of the rheumatic fever condition"
Description:  "This value set defines the codes that summarise the diagnosis of a patient with a rheumatic fever condition"
* ^version = "1.0.0"
* ^experimental = false
* ^status = #active

* $sct#195528001  "Acute rheumatic fever (disorder)"
* $sct#38933006   "Recurrent rheumatic fever (disorder)"

* include codes from system $rfnzt where concept descendant-of #condition-summary-codes

// SNOMED NZ edition defined terms which are not practically usable
// * $sctNZ#302471000210100 "Rheumatic heart disease with absence of signs and symptoms of acute rheumatic fever (situation)"
// * $sctNZ#299171000210109 "History of acute rheumatic fever without heart disease"
