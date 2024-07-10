// Extension: RfCarePlanClosureReasonExtension
// Id:  rf-careplan-closure-reason
// Title: "Reason a rheumatic fever care plan was closed (#revoked status)"
// Context: CarePlan
// Description: "Captures why a rheumatic fever patient was removed from the register by completion of their care plan."
// * value[x] only string

// Extension: RfCarePlanOnHoldReasonExtension
// Id:  rf-careplan-onhold-reason
// Title: "Reason rheumatic fever care plan changed to on-hold status"
// Description: "Captures why a rheumatic fever patient care has been placed on hold."
// //Context: RheumaticFeverCarePlan
// Context: CarePlan
// * value[x] only string

// this extension slices the extension SUBarray (as required by FSH language syntax).  This enables capture of the four values representing a care plan status change event
Extension: RfCarePlanStatusChangeHistoryExtension
Id: rf-careplan-statusChangeHistory 
Title: "Care Plan status change history" 
Description: "Accumulates a history of status changes in a care plan, each having an effective date and optional reason"
Context: CarePlan
* extension contains
  fromStatus 1..1 and
  toStatus 1..1 and
  changeDate 1..1 and
  changeReason 0..1

* extension[fromStatus] ^short = "The former status of the care plan"
* extension[fromStatus].value[x] only Coding
* extension[fromStatus].value[x] from $careplan-status
* extension[toStatus] ^short = "The revised status of the care plan"
* extension[toStatus].value[x] only Coding
* extension[toStatus].value[x] from $careplan-status
* extension[changeDate] ^short = "The effective date of change of care plan status"
* extension[changeDate].value[x] only date
* extension[changeReason] ^short = "Optional reason why the status changed"
* extension[changeReason].value[x] only string


Extension: RfCarePlanLifelongSecondaryProphylaxisExtension
Id:  rf-careplan-lifelongSecondaryProphylaxis
Title: "Lifelong secondary prophylaxis recommended?"
Description: "Indicates that a rheumatic fever patient has been recommended lifelong prophylaxis"
Context: CarePlan
* value[x] only boolean