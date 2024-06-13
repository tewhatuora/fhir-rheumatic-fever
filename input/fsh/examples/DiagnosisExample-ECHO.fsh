Instance: DiagnosisExample-ECHO
InstanceOf: RheumaticFeverDiagnosisGroup
Description: "Illustrates a FHIR Observation describing a Jones (twelve) criteria diagnosis for a rheumatic fever patient"
Usage: #example

//* meta.profile = Canonical(RheumaticFeverMedicationRequest|1.0.0)
* meta.versionId = "1"
* meta.lastUpdated = "2024-05-31T07:00:00Z" // UTC datetime

* identifier[NationalSystem][0] insert SalesforceObservationIdentifier([[OBSD-0100]])     // corresponding salesforce record

* code insert SNOMEDCoding(439238004,[[Echocardiography test interpretation (observable entity)]])

* subject insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])
* status = #final
* effectiveDateTime = "2023-06-02T02:00:00Z"

* component[+] insert ObservationCodeableValue( 48724000, [[Mitral valve regurgitation (disorder)]],    1255665007, [[Moderate (qualifier value)]] )
* component[+] insert ObservationCodeableValue( 79619009, [[Mitral valve stenosis (disorder)]],           24484000, [[Severe (severity modifier) (qualifier value)]] )
* component[+] insert ObservationCodeableValue( 60234000, [[Aortic valve regurgitation (disorder)]],    1255665007, [[Moderate (qualifier value)]] )

* component[+] insert ObservationCodeableValue( 60573004, [[Aortic valve stenosis (disorder)]],           24484000, [[Severe (severity modifier) (qualifier value)]] )
* component[+] insert ObservationCodeableValue(111287006, [[Tricuspid valve regurgitation (disorder)]], 1255665007, [[Moderate (qualifier value)]] )

* note.text = "- Around and around and around with its own sound\n- A sound that no one has to hear"