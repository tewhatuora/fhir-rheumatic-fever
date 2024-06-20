Instance: DiagnosisDetail-JonesCriteria
InstanceOf: RheumaticFeverDiagnosisGroup
Description: "Illustrates a FHIR Observation describing a Jones (twelve) criteria diagnosis for a rheumatic fever patient"
Usage: #example

//* meta.profile = Canonical(RheumaticFeverMedicationRequest|1.0.0)
* meta.versionId = "1"
* meta.lastUpdated = "2024-05-31T05:00:00Z" // UTC datetime

* identifier[NationalSystem][0] insert SalesforceObservationIdentifier([[OBSD-0101]])     // corresponding salesforce record

* code insert SNOMEDCoding(447541000210107,[[New Zealand Jones Criteria Assessment (observable entity)]])

* subject insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])
* status = #final

* performer insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

// numero zero
* component[+] insert ObservationPresent( 703119002,                   [[Carditis due to rheumatic fever (disorder)]], true)
* component[+] insert ObservationPresent( 448021000210106,             [[Indolent carditis (disorder)]],               true)
* component[+] insert ObservationPresent( 95325000,                    [[Subcutaneous nodule (finding)]],              false)
* component[+] insert ObservationUnknown( 200951007,                   [[Erythema marginatum in acute rheumatic fever (disorder)]]     )
 
* component[+] insert ObservationPresent( 111211002,  [[Migratory polyarthritis (disorder)]], true  )
* component[+] insert ObservationUnknown( 699462004,  [[Monoarthritis (disorder)]]                  )
* component[+] insert ObservationPresent( 46826000,   [[Rheumatic chorea (disorder)]],        true  )
* component[+] insert ObservationPresent( 35678005,   [[Multiple joint pain (finding)]],      true  )

// Raised ESR? / peak ESR measured
* component[+] insert ObservationPresent( 165468009,  [[Erythrocyte sedimentation rate above reference range (finding)]], true          )
* component[+] insert ObservationQuantity(416838001, [[Erythrocyte sedimentation rate measurement (procedure)]], 30, [[mm/h]],[[mm/h]] )

// Raised CRP? / peak CRP measured
* component[+] insert ObservationPresent( 119971000119104, [[C-reactive protein above reference range (finding)]], true          )
* component[+] insert ObservationQuantity(55235003,       [[C-reactive protein measurement (procedure)]], 12, [[mg/l]],[[mg/L]] )

// PR interval
* component[+] insert ObservationQuantity(251207006, [[PR interval duration (observable entity)]], 0.250, [[s]],[[s]] )
* component[+] insert ObservationPresent( 164947007,  [[Prolonged PR interval (finding)]], true )

// fever
* component[+] insert ObservationPresent( 386661006, [[Fever (finding)]], true )

// other conduction disorder
* component[+] insert ObservationPresent( 44808001, [[Conduction disorder of the heart (disorder)]], true )
* component[+] insert ObservationString( 44808001, [[Conduction disorder of the heart (disorder)]], [[Conduction was considered abnormally low in such a young patient]] )