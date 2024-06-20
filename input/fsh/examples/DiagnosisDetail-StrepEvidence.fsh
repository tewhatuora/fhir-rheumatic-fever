Instance: DiagnosisDetail-StrepEvidence
InstanceOf: RheumaticFeverDiagnosisGroup
Description: "Illustrates primary strep diagnosis evidence (Strepococcus group A infection is the cause of rheumatic fever)"
Usage: #example

* meta.versionId = "1"
* meta.lastUpdated = "2024-06-04T00:00:00Z" // UTC datetime

* identifier[NationalSystem][0] insert SalesforceObservationIdentifier([[OBSD-0102]])     // corresponding salesforce record

* code insert SNOMEDCoding(448011000210101,[[Evidence of preceding Streptococcus group A infection (observation entity)]])

* subject insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])
* status = #final

* performer insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

* hasMember[0] = Reference(DiagnosisDetail-StrepEvidence-Secondary)

// First ASOT
* component[+] insert ObservationQuantity(82703001, [[Antistreptolysin O titer (procedure)]], 480000, [[IU/litre]], [[[iU]/L]] )
* component[+] insert ObservationDate(82703001, [[Antistreptolysin O titer (procedure)]], "2023-06-02T02:00:00Z" )

// First 'Anti-Dnase B'
* component[+] insert ObservationQuantity(394723001, [[Anti-deoxyribonuclease B antibody level (procedure)]], 680000, [[IU/litre]], [[[iU]/L]] )
* component[+] insert ObservationDate(394723001, [[Anti-deoxyribonuclease B antibody level (procedure)]], "2023-06-02T02:00:00Z" )

// Strep organism was found
* component[+] insert ObservationPresent( 80166006,   [[Streptococcus pyogenes (organism)]], true )

// 1/3: strep throat culture test was NOT DONE
* component[+] insert ObservationPresent( 117015009, [[Throat culture (procedure)]], false )

// 2/3: Strep PCR test - test was DONE
* component[+] insert ObservationPresent( 9718006,  [[Polymerase chain reaction analysis (procedure)]], true )

// 3/3: Strep RAT - UNKNOWN if test was DONE
* component[+] insert ObservationUnknown( 312504002, [[Antigen test (procedure)]] )


// //////// //////// //////// //////// //////// //////// ////////
Instance: DiagnosisDetail-StrepEvidence-Secondary
InstanceOf: RheumaticFeverDiagnosisGroup
Description: "Illustrates second strep diagnosis evidence from repeated ASOT and Anti-Dnase B tests"
Usage: #example

* meta.versionId = "1"
* meta.lastUpdated = "2024-06-04T02:00:00Z" // UTC datetime

* identifier[NationalSystem][0] insert SalesforceObservationIdentifier([[OBSD-0103]])     // corresponding salesforce record

* code insert SNOMEDCoding(448011000210101,[[Evidence of preceding Streptococcus group A infection (observation entity)]])

* subject insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])
* status = #final

* performer insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

* derivedFrom = Reference(DiagnosisDetail-StrepEvidence)

// Second ASOT
* component[+] insert ObservationQuantity(82703001, [[Antistreptolysin O titer (procedure)]], 480000, [[IU/litre]], [[[iU]/L]] )
* component[+] insert ObservationDate(82703001, [[Antistreptolysin O titer (procedure)]], "2023-06-02T02:00:00Z" )

// Second 'Anti-Dnase B'
* component[+] insert ObservationQuantity(394723001, [[Anti-deoxyribonuclease B antibody level (procedure)]], 680000, [[IU/litre]], [[[iU]/L]] )
* component[+] insert ObservationDate(394723001, [[Anti-deoxyribonuclease B antibody level (procedure)]], "2023-06-02T02:00:00Z" )