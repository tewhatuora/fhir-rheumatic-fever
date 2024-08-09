Instance: DiagnosisDetail-ECHO
InstanceOf: RheumaticFeverDiagnosisGroup
Description: "Illustrates collection of ECHO cardiogram diagnosis evidence in a rheumatic fever case"
Usage: #example

//* meta.profile = Canonical(RheumaticFeverMedicationRequest|1.0.0)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00Z" // UTC datetime
* meta insert RFTag

* identifier[NationalSystem][0] insert RFCCSObservationIdentifier([[OBSD-0100]])     // corresponding RFCCS record

* code insert RFNZCoding(439238004,[[Echocardiography test interpretation (observable entity)]])

* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* status = #final
* effectiveDateTime = "2023-06-02T02:00:00Z"

* performer insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

* encounter = Reference(DiagnosisEncounter)

* component[+] insert ObservationCodeableValue( $sct,  48724000, [[Mitral valve regurgitation (disorder)]],    $sct, 1255665007, [[Moderate (qualifier value)]] )
* component[+] insert ObservationCodeableValue( $sct,  79619009, [[Mitral valve stenosis (disorder)]],         $sct,   24484000, [[Severe (severity modifier) (qualifier value)]] )
* component[+] insert ObservationCodeableValue( $sct,  60234000, [[Aortic valve regurgitation (disorder)]],    $sct, 1255665007, [[Moderate (qualifier value)]] )

* component[+] insert ObservationCodeableValue( $sct,  60573004, [[Aortic valve stenosis (disorder)]],         $sct,   24484000, [[Severe (severity modifier) (qualifier value)]] )
* component[+] insert ObservationCodeableValue( $sct, 111287006, [[Tricuspid valve regurgitation (disorder)]], $sct, 1255665007, [[Moderate (qualifier value)]] )

* note.text = "- Around and around and around with its own sound\n- A sound that no one has to hear"