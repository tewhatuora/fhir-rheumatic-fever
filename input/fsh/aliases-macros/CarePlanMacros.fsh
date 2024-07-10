
// adds an entry into care plan status change history
RuleSet: StatusChangeEvent(from-state-code,to-state-code,change-date,change-reason)

* .extension[fromStatus].valueCoding = {from-state-code}
* .extension[toStatus].valueCoding = {to-state-code}
* .extension[changeDate].valueDate = "{change-date}"
* .extension[changeReason].valueString = "{change-reason}"
