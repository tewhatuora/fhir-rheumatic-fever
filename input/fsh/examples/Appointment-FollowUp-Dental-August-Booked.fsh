Instance: FollowUp-Dental-August-Booked
InstanceOf: Appointment
Description: "Example of a planned patient follow-up with the dentist"
Usage: #example

* meta.profile = Canonical(Appointment)
* meta.versionId = "2"
* meta.lastUpdated = "2024-08-07T08:31:00Z"
* meta insert RFTag

* description = "dentist follow up August 2023"

* identifier[0] insert RFCCSCarePlanActivityIdentifier([[CPA-00073694-20231117]])     // corresponding RFCCS record

* serviceCategory =  $sct#58718002 "Rheumatic fever (disorder)"

* start = "2023-08-15T02:00:00Z"      // UTC equivalent of a start time at 2pm NZ
* end =   "2023-08-15T03:00:00Z"      //  UTC equivalent

* status = #booked

* serviceType = $sct#772071006 "Referral to dentist (procedure)" 

* participant[0].actor insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* participant[=].status = #accepted

* supportingInformation[0] insert ReferenceOrganisation(GZZ851-K,[[Extractive Dental Revenue Limited]])
* comment = "Specialist consult for Sage's rheumatic fever condition."
