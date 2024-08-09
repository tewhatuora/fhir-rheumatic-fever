CodeSystem: NzRheumaticFeverCodeSystem
Id: nz-rheumaticfever-codesystem
Title: "NZ-specific terminology in rheumatic fever data representation"
Description:  "This system defines standard codes used throughout this Implementation Guide for New Zealand rheumatic fever data representation"
* ^publisher = "Te Whatu Ora / Health New Zealand"
* ^experimental = false
* ^caseSensitive = true
* ^version = "1.0.0"
* ^purpose = """
The codes defined in this CodeSystem are used throughout the rheumatic fever IG, including in resource profiles.

Originally it was sought to define these codes as concepts in the NZ Edition of SNOMED CT.  However, this turned out to be unworkable due to 
restrictions imposed by SNOMED that only 'affiliate members' can access the contents of the SNOMED CT edition.  As a consequence of this, applications 
cannot lookup nor access term definitions on NZHTS -- NZ's official terminology server.  This prevents FHIR validation of FHIR resources using (or 
meant to use) NZ edition SNOMED terms/codes.

Due to these restrictions this IG defines codes needed for NZ rheumatic fever data representation locally within the IG, in this CodeSystem.  
Some of these codes re-use the original code numbers assigned in the NZ SNOMED edition in case this becomes publically accessible in future.
The codes here are arranged in a 2-layer hierarchy which enables ValueSets segregated by purpose and help consumers understand the various purposes of the codes.
"""

* ^status = #active

* #meta-tags "meta tags" "These codes are used to tag an instance via its meta.tag element" 
  * #rf-nz "rheumatic fever" "General purpose FHIR tag/classifier signifying FHIR information about an NZ rheumatic fever patient/case" 

// condition diagnosis summary concepts
* #condition-summary-codes "These codes are used in NZ to summarise the condition diagnosis" "These code values originate in SNOMED CT but are defined only in the SNOMED NZ Edition" 
  * #302471000210100 "Rheumatic heart disease with absence of signs and symptoms of acute rheumatic fever (situation)" "Can be used to summarise the diagnosis of a patient with a rheumatic fever condition"
  * #299171000210109 "History of acute rheumatic fever without heart disease" "Can be used to summarise the diagnosis of a patient with a rheumatic fever condition"

// RF diagnostic certainty
* #diagnostic-certainty-codes "Certainty of diagnosis classifiers" "As rheumatic fever can be difficult to diagnose, these codes provide a way to classify confidence in a particular case diagnosis"
  * #not-a-case "not a case"
  * #under-investigation "under investigation"
  * #borderline "borderline"
  * #possible "possible"
  * #probable "probable"
  * #definite "definite"

// RF RHD severity concepts
* #rhd-severity-special-codes
  * #300171000210106  "Trivial (qualifier value)"
  * #59391000119102   "History of heart valve repair (situation)"
  * #301561000210102  "History of heart valve replacement (situation)"

// diagnosis evidence groupings of Observation data
* #diagnosis-evidence-group-codes "Observation diagnosis evidence groupings" "These code values originate in SNOMED CT, two being defined only in the SNOMED NZ Edition"
  * #439238004        "Echocardiography test interpretation (observable entity)"
  * #447541000210107  "New Zealand Jones Criteria Assessment (observable entity)"
  * #448011000210101  "Evidence of preceding Streptococcus group A infection"

// special RF diagnosis component coding
* #diagnosis-component-NZ-special-concepts "Special concepts in NZ RF diagnosis" "These code value originate in SNOMED CT, one being defined only in the SNOMED NZ Edition"
  * #448021000210106  "Indolent carditis (disorder)"

* #NZ-specific-role-codes
  * #320731000210100 "Support person" "Role code used in patient whanau care team (RfPatient.contact)"

* #NZ-specific-injection-site-codes "Specific injection sites in rheumatic fever secondary prophylaxis" "These code values originate in the SNOMED NZ Edition"
  * #299151000210101   "Structure of left ventrogluteal region (body structure)"
  * #299161000210103   "Structure of right ventrogluteal region (body structure)"
  * #299121000210105   "Structure of left upper outer quadrant of buttock (body structure)"
  * #299141000210104   "Structure of right upper outer quadrant of buttock (body structure)"

* #nz-specific-medication-frequency-codes "Specific medication frequency in rheumatic fever secondary prophylaxis" "This code value originates in the SNOMED NZ Edition"
  * #447521000210101  "Every thirteen weeks (qualifier value)"

* #nz-specific-medication-allergy-codes "Specific allergy types relevant to rheumatic fever secondary prophylaxis" "These code values originate in the SNOMED NZ Edition"
  * #332571000210107 "Allergy to benzathine penicillin"
  * #332581000210109 "Allergy to pharmaceutical excipient"          // a.k.a "Components of bicillin"

* #nz-national-system-identifier-type-codes "Codes for differentiating types of external identifiers in national system slice of FHIR resource Identifier" "These codes signify identifiers which originate in a national system but synchronised into FHIR.  The purpose of designating these codes is to provide a type discriminator for slicing Identifier in FHIR resource profiles"
  * #rfccs-careplan-id "Identifies a CarePlan (case number) object in the NZ national RF Care Coordination System"
  * #rfccs-careplanactivity-id "Identifies a CarePlanActivity object in the NZ national RF Care Coordination System"
  * #rfccs-condition-id "Identifies a patient Condition object in the NZ national RF Care Coordination System"
  * #rfccs-careteam-id "Identifies a CareTeam object in the NZ national RF Care Coordination System"
  * #rfccs-serviceappointment-id "Identifies a patient appointment object in the NZ national RF Care Coordination System"
  * #rfccs-clinicalencounter-id "Identifies a secondary prophylaxis appointment encounter object in the NZ national RF Care Coordination System"
  * #rfccs-observation-id "Identifies an observation object in the NZ national RF Care Coordination System"
  * #episurv-number "Identifies a notifiable disease surveillance case number in ESR's EpiSurv national system"

