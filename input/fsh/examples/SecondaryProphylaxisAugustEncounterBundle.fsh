Instance: SecondaryProphylaxisAugustEncounterBundle
InstanceOf: Bundle
Description: "Example of a Bundled POST which creates instances of Encounter, MedicationStatement and QuestionnaireResponse in one operation"
Usage: #example

* meta.profile = Canonical(Bundle)
* meta.versionId = "2"
* meta.lastUpdated = "2024-05-17T06:10:00Z"

* type = #transaction

// See rulesets below for detail of the three bundle entry instances
// Bundle ENTRY 1/3 Encounter
* entry[0].fullUrl = "http://example.org/fhir/Encounter/1001"         // Made up identfier for referencing purposes 
* entry[=].request.method = #POST
* entry[=].request.url = "Encounter"
* entry[=].resource.resourceType = "Encounter"
* entry[=].resource insert makeEncounterContent

// ENTRY 2/3 Medication Statement
* entry[+].fullUrl = "http://example.org/fhir/MedicationStatement/1002"      // Made up identfier for referencing purposes
* entry[=].request.method = #POST
* entry[=].request.url = "MedicationStatement"
* entry[=].resource.resourceType = "MedicationStatement"
* entry[=].resource insert makeMedStmtContent

// ENTRY 3/3 QuestionnaireResponse Statement
* entry[+].fullUrl = "http://example.org/fhir/QuestionnaireResponse/1003"    // Made up identfier for referencing purposes
* entry[=].request.method = #POST
* entry[=].request.url = "QuestionnaireResponse"
* entry[=].resource.resourceType = "QuestionnaireResponse"
* entry[=].resource insert makeQRContent

//////// //////// //////// //////// //////// //////// //////// //////// //////// 
// makes the contents of Bundled instances used in RF secondary prophylaxis appointment recording
RuleSet: makeEncounterContent
* meta.profile = Canonical(Encounter)
* meta.lastUpdated = "2024-07-18T00:00:00Z"
* meta insert RFTag

* id = "1001"
* status = #finished
* appointment = Reference(SecondaryProphylaxisAppointment-August-Fulfilled)

* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
* type =  $sct#58718002 "Rheumatic fever (disorder)"

* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])

* participant[0].individual insert ReferencePractitioner(98ZZQJ,[[Isabel Injecta]])
* participant[1].individual insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])

* period.start = "2023-08-08T02:10:00Z"    // UTC datetime
* period.end = "2023-08-08T03:15:00Z"    // UTC datetime

* contained = RedDiamondWhangarei                       // see DiagnosisandTreatmentLocations.fsh
* location[0].location.reference = "#RedDiamondWhangarei"  // see DiagnosisandTreatmentLocations.fsh

* serviceProvider insert ReferenceOrganisation(GZZ866-A,[[Red Diamond Medical Limited]])
* serviceType = $sct#360271000 "Prophylaxis - procedure intent (qualifier value)" 

//////// //////// //////// //////// //////// //////// //////// //////// //////// 
// MedicationStatement: benzathine medication and associated lignocaine pain relief
RuleSet: makeMedStmtContent

* meta.lastUpdated = "2024-08-05T00:00:00Z" // UTC datetime
* meta insert RFTag

* id = "1002"
// set up the contained instance that records lignocaine pain relief medication also given at this appointment
* contained = contained-Lignocaine-dose     // This instance is fefined in file MedicationStatement-August.fsh

* basedOn = Reference(PlannedBenzathineMedication)
* partOf.reference = "#contained-Lignocaine-dose"               // NOTE: Invariant requires resource to make ref. to its contained instance
* context.reference = "http://example.org/fhir/Encounter/1"    // ***** alpha instance in the Bundle  *****
* medicationReference = Reference(BenzathineMedication)
* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])

* category =  $sct#58718002 "Rheumatic fever (disorder)"

* effectiveDateTime = "2023-08-08T03:15:00Z"    // UTC datetime
* dateAsserted = "2023-08-18T03:15:00Z"    // UTC datetime

* status = #completed

// records the actual benzathine brand, site of injection and quantity administered.
* dosage.site insert RFNZCoding(299151000210101,[[Structure of left ventrogluteal region (body structure)]])
* dosage.route insert SNOMEDCoding(78421000,[[Intramuscular route (qualifier value)]])
* dosage.doseAndRate[0].doseQuantity insert UnitOfMeasureQuantity(25,[[mg]],[[mg]]) 

// removed after data dictionary May 22 2024 since the brand is now represented in the referenced Medication instance
// * note insert markdownAnnotation([[Benzathine Brand used:**Bicillin L-A**]])

//////// //////// //////// //////// //////// //////// //////// //////// //////// 
// QuestionnaireResponse: patient health assessment questions at appointment
RuleSet: makeQRContent
* meta.profile = Canonical(QuestionnaireResponse)
* meta.lastUpdated = "2023-11-27T00:00:00Z"
* meta insert RFTag

* id = "1003"
* status = #completed
* authored = "2023-08-08T01:08:00.504Z"   // UTC, assumed to be the time of information collection during the appointment
* questionnaire = Canonical(SecondaryProphylaxisHealthAssessmentQuestionnaire)

* subject insert NHIPatientRef(ZKC7284,[[Sage Westbrook]])
* author insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* basedOn = Reference(AllAppointmentsCompleted)

* encounter.reference = "http://example.org/fhir/Encounter/1"    // ***** alpha instance in the Bundle  *****

// NOTE: item numbering does not have to match the Questionnaire because answers relate to questions through link_id

* item[+] insert answerItemX(ReasonsInjectionOverdue,[[2)]],[[Reason(s) injection was give late? (multiple choice)]])
* item[=].answer[0].valueString = "Patient Not Available on the Day"
* item[=].answer[+].valueString = "Other"

* item[+] insert answerItemX(OverdueInjectionOtherDetail,[[3)]],[[Other details for late injection (enter text)]])
* item[=].answer.valueString = "The patient couldn't find a park for the classic Hilux."

// * item[+] insert answerItemX(ConsentChecked,[[4)]],[[Pre-injection consent checked?]])
// * item[=].answer.valueBoolean = true

// * item[+] insert answerItemX(MedicationChecked,[[5)]],[[Pre-injection medication checked with a second person?]])
// * item[=].answer.valueBoolean = true

* item[+] insert answerItemX(OtherPainManagementToolsUsed,[[11)]],[[Pain management tools used? (multiple choice)]])
* item[=].answer[0].valueString = "Ice pack"
* item[=].answer[+].valueString = "Numbing spray"
* item[=].answer[+].valueString = "Distraction"
* item[=].answer[+].valueString = "Other"

* item[+] insert answerItemX(PainManagementOtherDetails,[[11.1)]],[[Details of other pain management (enter text)]])
* item[=].answer.valueString = "We discovered in this appointment that Chocolate Chip Cookie ice cream helps a lot!"

* item[+] insert answerItemX(PostInjectionConcern,[[12)]],[[Post injection concern or possible reaction identified?]])
* item[=].answer.valueBoolean = true

* item[+] insert answerItemX(PostInjectionConcernDetails,[[12.1)]],[[If Yes, Record Details, Symptoms, Actions Taken and Follow-Up Plan (enter text)]])
* item[=].answer.valueString = "Sage had a bit more than the usual sensitivity at the injection site so we dished out extra ice cream, which was nice."

* item[+] insert answerItemX(AnyOtherConcerns,[[13)]],[[Were There Any Other Concerns or Issues Identified During the Visit?]])
* item[=].answer.valueBoolean = true

* item[+] insert answerItemX(OtherConcernsDetail,[[13.1)]],[[If yes, describe details, actions taken, and follow-up planned (enter text)]])
* item[=].answer.valueString = "A shortage of ice cream in our freezer led to some unnecessary worries for Sage."


* item[+] insert answerItemX(HealthEducationTopicsDiscussed,[[14)]],[[Health education topics discussed? (multiple choice)]])
* item[=].answer[0].valueString = "Secondary prophylaxis"
* item[=].answer[+].valueString = "Nutrition"
* item[=].answer[+].valueString = "Other"

* item[+] insert answerItemX(HealthEducationOtherDetail,[[14.1)]],[[Enter details of other health education topic discussed (enter text)]])
* item[=].answer.valueString = "Sage and I discussed the importance of punctuality and the benefits of planning ahead."

* item[+] insert answerItemX(RecentOrUpcomingAppointments,[[15)]],[[Any recent or upcoming follow-up appointments?]])
* item[=].answer.valueBoolean = true

* item[+] insert answerItemX(RecentOrUpcomingAppointmentsDetails,[[15.1)]],[[Enter details and dates of any recent or upcoming follow-up appointments (enter text)]])
* item[=].answer.valueString = "Sage has an upcoming follow-up appointment covering iOS calendar basics"

* item[+] insert answerItemX(PlanForNextMedicationAppointment,[[16)]],[[Comments for the next appointment (enter text)]])
* item[=].answer.valueString = "The plan for the next medication appointment is to keep up the good work"

