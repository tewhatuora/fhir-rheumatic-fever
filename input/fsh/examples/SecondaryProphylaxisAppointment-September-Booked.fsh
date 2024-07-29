Instance: SecondaryProphylaxisAppointment-September-Booked
InstanceOf: Appointment
Description: "Example of a booked patient appointment for RF secondary prophylaxis treatment with the shared care provider"
Usage: #example

* meta.profile = Canonical(Appointment)
* meta.versionId = "4"
* meta.lastUpdated = "2024-06-12T07:00:00Z"

* description = "monthly injection September 2023"

* identifier[0] insert SalesforceCarePlanActivityIdentifier([[CPA-00073693-20230905]])     // corresponding salesforce record

* serviceCategory =  $sct#58718002 "Rheumatic fever (disorder)"

* start = "2023-09-05T02:00:00Z"    // UTC equivalent of a start time at 2pm NZ Standard Time on September 5th 2023
* end =   "2023-09-05T03:00:00Z"      //  UTC equivalent of a finish time of 3pm NZ Standard Time on September 5th 2023

* status = #booked

* serviceType = $sct#360271000 "Prophylaxis - procedure intent (qualifier value)" 

* participant[0].actor insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* participant[=].status = #accepted

* supportingInformation[0] insert ReferenceOrganisation(G0M744-C,[[Taranaki Rheumatic Fever Secondary Prevention Service]])
* comment = "This appointment will be carried out in Taranaki by the shared care provider."
