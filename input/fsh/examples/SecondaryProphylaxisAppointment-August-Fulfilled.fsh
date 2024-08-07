Instance: SecondaryProphylaxisAppointment-August-Fulfilled
InstanceOf: Appointment
Description: "Example of a fulfilled (completed) patient appointment for rheumatic fever secondary prophylaxis treatment (injection)"
Usage: #example

* meta.profile = Canonical(Appointment)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00Z"
* meta insert RFTag

* description = "monthly injection August 2023"

* identifier[0] insert RFCCSCarePlanActivityIdentifier([[CPA-00073693-20230808]])     // corresponding RFCCS record

* serviceCategory =  $sct#58718002 "Rheumatic fever (disorder)"

* start = "2023-08-08T02:00:00Z"    // UTC equivalent of a start time at 2pm NZ Standard Time on August 8th 2023
* end =   "2023-08-08T03:00:00Z"      //  UTC equivalent of a finish time of 3pm NZ Standard Time on August 8th 2023

* status = #fulfilled

* serviceType = $sct#360271000 "Prophylaxis - procedure intent (qualifier value)" 

* participant[0].actor insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* participant[=].status = #accepted
* participant[+].actor insert ReferencePractitioner(98ZZQJ,[[Isabel Injecta]])
* participant[=].status = #accepted

* supportingInformation[0] insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* supportingInformation[+] = Reference(SecondaryProphylaxisEncounter)
* comment = "The plan for this appointment is..."
