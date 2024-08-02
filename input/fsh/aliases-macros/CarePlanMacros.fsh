
// Use this to make an entry in care plan status change history
RuleSet: StatusChange(revised-state-code,change-date,change-reason)
* url = Canonical(rf-careplan-statusHistory)

* .extension[toStatus].valueCoding = $careplan-status-codes#{revised-state-code}
* .extension[changeDate].valueDate = "{change-date}"
* .extension[changeReason].valueString = "{change-reason}"
