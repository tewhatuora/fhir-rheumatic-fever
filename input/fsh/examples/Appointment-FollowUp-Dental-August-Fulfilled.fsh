Instance: FollowUp-Dental-August-Fulfilled
InstanceOf: Appointment
Description: "Example of a planned patient follow-up with the dentist"
Usage: #example

* meta.profile = Canonical(Appointment)
* meta.versionId = "1"
* meta.lastUpdated = "2024-06-20T00:00:00Z"

* description = "dentist follow up August 2023"

* identifier[0] insert SalesforceCarePlanActivityIdentifier([[CPA-00073694-20231117]])     // corresponding salesforce record

* start = "2023-08-15T02:00:00Z"      // UTC equivalent of a start time at 2pm NZ
* end =   "2023-08-15T03:00:00Z"      //  UTC equivalent

* status = #fulfilled

* serviceType = $sct#772071006 "Referral to dentist (procedure)" 

* participant[0].actor insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])
* participant[=].status = #accepted

* supportingInformation[0] insert ReferenceOrganisation(GAX123-C,[[Push Pull Dental Company]])
* supportingInformation[+] = Reference(DentalFollowUpEncounter)
* comment = "Specialist consult for Maddie's rheumatic fever condition."
