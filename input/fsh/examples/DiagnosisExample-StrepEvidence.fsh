Instance: DiagnosisExample-StrepEvidence
InstanceOf: RheumaticFeverDiagnosisGroup
Description: "Illustrates primary strep diagnosis evidence (Strepococcus group A infection is the cause of rheumatic fever)"
Usage: #example

* meta.versionId = "1"
* meta.lastUpdated = "2024-06-04T00:00:00Z" // UTC datetime

* identifier[NationalSystem][0] insert SalesforceObservationIdentifier([[OBSD-0102]])     // corresponding salesforce record

* code insert SNOMEDCoding(448011000210101,[[Evidence of preceding Streptococcus group A infection (observation entity)]])

* subject insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])
* status = #final

* hasMember[0] = Reference(DiagnosisExample-StrepEvidence-Secondary)

// First ASOT
* component[+] insert ObservationQuantity(82703001, [[Antistreptolysin O titer (procedure)]], 480000, [[IU/litre]], [[[iU]/L]] )
* component[+] insert ObservationDate(82703001, [[Antistreptolysin O titer (procedure)]], "2023-06-02T02:00:00Z" )

// First 'Anti-Dnase B'
* component[+] insert ObservationQuantity(394723001, [[Anti-deoxyribonuclease B antibody level (procedure)]], 680000, [[IU/litre]], [[[iU]/L]] )
* component[+] insert ObservationDate(394723001, [[Anti-deoxyribonuclease B antibody level (procedure)]], "2023-06-02T02:00:00Z" )

// Strep GAS Throat culture - UNKNOWN if this test was done, result unknown
* component[+] insert ObservationUnknown( 80166006,   [[Streptococcus pyogenes (organism)]] )
* component[+] insert ObservationUnknown( 117015009, [[Throat culture (procedure)]] )

// Strep GAS Throat PCR - test was DONE AND was positive for strep
* component[+] insert ObservationPresent( 80166006, [[Streptococcus pyogenes (organism)]], true )
* component[+] insert ObservationPresent( 9718006,  [[Polymerase chain reaction analysis (procedure)]], true )

// Strep GAS Throat RAT - test was DONE AND was positive for strep
* component[+] insert ObservationPresent( 80166006,  [[Streptococcus pyogenes (organism)]], true )
* component[+] insert ObservationPresent( 312504002, [[Antigen test (procedure)]], true )


// //////// //////// //////// //////// //////// //////// ////////
Instance: DiagnosisExample-StrepEvidence-Secondary
InstanceOf: RheumaticFeverDiagnosisGroup
Description: "Illustrates second strep diagnosis evidence from repeated ASOT and Anti-Dnase B tests"
Usage: #example

* meta.versionId = "1"
* meta.lastUpdated = "2024-06-04T02:00:00Z" // UTC datetime

* identifier[NationalSystem][0] insert SalesforceObservationIdentifier([[OBSD-0103]])     // corresponding salesforce record

* code insert SNOMEDCoding(448011000210101,[[Evidence of preceding Streptococcus group A infection (observation entity)]])

* subject insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])
* status = #final

* derivedFrom = Reference(DiagnosisExample-StrepEvidence)

// Second ASOT
* component[+] insert ObservationQuantity(82703001, [[Antistreptolysin O titer (procedure)]], 480000, [[IU/litre]], [[[iU]/L]] )
* component[+] insert ObservationDate(82703001, [[Antistreptolysin O titer (procedure)]], "2023-06-02T02:00:00Z" )

// Second 'Anti-Dnase B'
* component[+] insert ObservationQuantity(394723001, [[Anti-deoxyribonuclease B antibody level (procedure)]], 680000, [[IU/litre]], [[[iU]/L]] )
* component[+] insert ObservationDate(394723001, [[Anti-deoxyribonuclease B antibody level (procedure)]], "2023-06-02T02:00:00Z" )