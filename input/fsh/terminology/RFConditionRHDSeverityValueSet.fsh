ValueSet: RFConditionRHDSeverityValueSet
Id: rf-condition-rhdseverity-code
Title: "Rheumatic heart disease severity codes"
Description:  "This value set defines codes for the severity of rheumatic heart disease which determines the severity of a patient's rheumatic fever condition"
* ^version = "1.1.0"
* ^experimental = false
* ^status = #active

* include codes from system $rfnzt where concept descendant-of #rhd-severity-special-codes

* $sct#260413007 "None (qualifier value)"
* $sct#255604002 "Mild (qualifier value)"
* $sct#1255665007 "Moderate (qualifier value)"
* $sct#24484000 "Severe (severity modifier) (qualifier value)"
* $sct#261665006 "Unknown (qualifier value)"

