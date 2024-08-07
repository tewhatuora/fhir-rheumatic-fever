Instance: DiagnosisDetail-JonesCriteria
InstanceOf: RheumaticFeverDiagnosisGroup
Description: "Illustrates a FHIR Observation describing a Jones (twelve) criteria diagnosis for a rheumatic fever patient"
Usage: #example

//* meta.profile = Canonical(RheumaticFeverMedicationRequest|1.0.0)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00" // UTC datetime
* meta insert RFTag

* identifier[NationalSystem][0] insert SalesforceObservationIdentifier([[OBSD-0101]])     // corresponding salesforce record

* code insert RFNZCoding(447541000210107,[[New Zealand Jones Criteria Assessment (observable entity)]])

* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* status = #final

* encounter = Reference(DiagnosisEncounter)

* performer insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

// numero zero
* component[+] insert ObservationPresent( $sct,  703119002,        [[Carditis due to rheumatic fever (disorder)]], true)
* component[+] insert ObservationPresent( $rfnzt,448021000210106,  [[Indolent carditis (disorder)]],               true)
* component[+] insert ObservationPresent( $sct,  95325000,         [[Subcutaneous nodule (finding)]],              false)
* component[+] insert ObservationAbsent(  $sct,  200951007,        [[Erythema marginatum in acute rheumatic fever (disorder)]], unknown, [[Unknown]] )
// 
* component[+] insert ObservationPresent( $sct,  111211002,        [[Migratory polyarthritis (disorder)]], true  )
* component[+] insert ObservationAbsent(  $sct,  699462004,        [[Monoarthritis (disorder)]], unknown, [[Unknown]]  )
* component[+] insert ObservationPresent( $sct,  46826000,         [[Rheumatic chorea (disorder)]],        true  )
* component[+] insert ObservationPresent( $sct,  35678005,         [[Multiple joint pain (finding)]],      true  )

// Raised ESR? / peak ESR measured
* component[+] insert ObservationPresent( $sct,  165468009,        [[Erythrocyte sedimentation rate above reference range (finding)]], true          )
* component[+] insert ObservationQuantity($sct,  416838001,        [[Erythrocyte sedimentation rate measurement (procedure)]], 30, [[mm/h]],[[mm/h]] )

// Raised CRP? / peak CRP measured
* component[+] insert ObservationPresent( $sct,  119971000119104,  [[C-reactive protein above reference range (finding)]], true          )
* component[+] insert ObservationQuantity($sct,  55235003,         [[C-reactive protein measurement (procedure)]], 12, [[mg/l]],[[mg/L]] )

// PR interval
* component[+] insert ObservationQuantity($sct,  251207006,        [[PR interval duration (observable entity)]], 0.250, [[s]],[[s]] )
* component[+] insert ObservationPresent( $sct,  164947007,        [[Prolonged PR interval (finding)]], true )

// fever
* component[+] insert ObservationPresent( $sct,  386661006,        [[Fever (finding)]], true )

// other conduction disorder
* component[+] insert ObservationPresent( $sct,  44808001,         [[Conduction disorder of the heart (disorder)]], true )
* component[+] insert ObservationString(  $sct,  44808001,         [[Conduction disorder of the heart (disorder)]], [[Conduction was considered abnormally low in such a young patient]] )