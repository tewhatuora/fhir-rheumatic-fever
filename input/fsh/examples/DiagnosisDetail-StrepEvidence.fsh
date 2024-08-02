Instance: DiagnosisDetail-StrepEvidence
InstanceOf: RheumaticFeverDiagnosisGroup
Description: "Illustrates primary strep diagnosis evidence (Strepococcus group A infection is the cause of rheumatic fever)"
Usage: #example

* meta.versionId = "1"
* meta.lastUpdated = "2024-06-04T00:00:00Z" // UTC datetime
* meta insert RFTag

* identifier[NationalSystem][0] insert SalesforceObservationIdentifier([[OBSD-0102]])     // corresponding salesforce record

* code insert SNOMEDCoding(448011000210101,[[Evidence of preceding Streptococcus group A infection (observation entity)]])

* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* status = #final

* encounter = Reference(DiagnosisEncounter)

* performer insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

* hasMember[0] = Reference(DiagnosisDetail-StrepEvidence-Secondary)

// First ASOT
* component[+] insert ObservationQuantity(82703001, [[Antistreptolysin O titer (procedure)]], 480000, [[IU/litre]], [[[iU]/L]] )
* component[+] insert ObservationDate(82703001, [[Antistreptolysin O titer (procedure)]], "2023-06-02T02:00:00Z" )

// First 'Anti-Dnase B'
* component[+] insert ObservationQuantity(394723001, [[Anti-deoxyribonuclease B antibody level (procedure)]], 680000, [[IU/litre]], [[[iU]/L]] )
* component[+] insert ObservationDate(394723001, [[Anti-deoxyribonuclease B antibody level (procedure)]], "2023-06-02T02:00:00Z" )

// 1/3: strep throat culture test was NOT DONE
* component[+] insert ObservationAbsent( 117015009, [[Throat culture (procedure)]], not-performed, [[Not performed]] )

// 2/3: Strep PCR test - test was DONE and positive finding
* component[+] insert ObservationInterpretation( 9718006,  [[Polymerase chain reaction analysis (procedure)]], POS, [[Positive]] )

// 3/3: Strep RAT - UNKNOWN if test was DONE
* component[+] insert ObservationAbsent( 312504002, [[Antigen test (procedure)]], unknown, [[Unknown]] )


// //////// //////// //////// //////// //////// //////// ////////
Instance: DiagnosisDetail-StrepEvidence-Secondary
InstanceOf: RheumaticFeverDiagnosisGroup
Description: "Illustrates second strep diagnosis evidence from repeated ASOT and Anti-Dnase B tests"
Usage: #example

* meta.versionId = "1"
* meta.lastUpdated = "2024-06-04T02:00:00Z" // UTC datetime

* identifier[NationalSystem][0] insert SalesforceObservationIdentifier([[OBSD-0103]])     // corresponding salesforce record

* code insert SNOMEDCoding(448011000210101,[[Evidence of preceding Streptococcus group A infection (observation entity)]])

* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* status = #final

* encounter = Reference(DiagnosisEncounter)

* performer insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

* derivedFrom = Reference(DiagnosisDetail-StrepEvidence)

// Second ASOT
* component[+] insert ObservationQuantity(82703001, [[Antistreptolysin O titer (procedure)]], 480000, [[IU/litre]], [[[iU]/L]] )
* component[+] insert ObservationDate(82703001, [[Antistreptolysin O titer (procedure)]], "2023-06-02T02:00:00Z" )

// Second 'Anti-Dnase B'
* component[+] insert ObservationQuantity(394723001, [[Anti-deoxyribonuclease B antibody level (procedure)]], 680000, [[IU/litre]], [[[iU]/L]] )
* component[+] insert ObservationDate(394723001, [[Anti-deoxyribonuclease B antibody level (procedure)]], "2023-06-02T02:00:00Z" )