ValueSet: RFMedicationRequestMedicationFrequencyValueSet
Id: rf-medicationrequest-frequency-code
Title: "Rheumatic fever planned medication frequency codes"
Description:  "This value set defines codes for standard frequencies of secondary prophylaxis medication planning (that is, appointment intervals)"
* ^version = "1.1.0"
* ^experimental = false
* ^status = #active

* $sct#1511000175108 "Every twenty eight days (qualifier value)"
* $sct#1531000175101 "Every twenty one days (qualifier value)"
* $sct#229797004 "Once daily (qualifier value)"
* $sct#229799001 "Twice a day (qualifier value)"
* $sct#229798009 "Three times daily (qualifier value)"
* $sct#307439001 "Four times daily (qualifier value)"
* $sct#429812001 "Every ten weeks (qualifier value)"

* include codes from system $rfnzt where concept descendant-of #nz-specific-medication-frequency-codes
// * $sctNZ#447521000210101 "Every thirteen weeks (qualifier value)"