ValueSet: RFDiagnosisGroupValueSet
Id: rf-observation-diagnosisgroup-code
Title: "Codes for rheumatic fever diagnosis observation grouping"
Description:  "This value set defines SNOMED codes which represent groupings of diagnosis data captured by rheumatic fever Observation instances"
* ^version = "1.0.0"
* ^experimental = false
* ^status = #active

* include codes from system $rfnzt where concept descendant-of #diagnosis-evidence-group-codes

// * $sct#439238004 "Echocardiography test interpretation (observable entity)"

// these are defined in NZ SNOMED Edition but not practically usable
// * $sctNZ#447541000210107 "New Zealand Jones Criteria Assessment (observable entity)"
// * $sctNZ#448011000210101 "Evidence of preceding Streptococcus group A infection"
