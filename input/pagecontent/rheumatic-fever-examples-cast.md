### Rheumatic fever examples cast

This page outlines the parties that appear throughout the rheumatic fever instance examples.

All examples and identities are mock data.

|Party|Mock identifiers|Position in mock service hierarchy|Purpose|
|:-------|:----|:---------|:------------|
|[**Madeleine Meringue**](Patient-MadeleineMeringue.html)|NHI:`SCF7824` (fake)|A teenage rheumatic fever patient of NZ European ethnicity who speaks English and has relatives registered as designated contacts|Demonstrates usage of the *rheumatic fever profile* of the FHIR `Patient` (this profile extends `NzPatient` from NZBase).
|[**Madeleine Meringue and whanau (care team)**](Patient-MadeleineMeringueAndWhanau.html)|NHI:`SCF7824` (fake)|A patient and their designated care team|Demonstrates a patient-designated care team, identifying family relatives/friends, each modelled as a FHIR Patient `contact` element.|
|[**Pania Punga**](Patient-PaniaPunga.html)|NHI:`SCF7825` (fake)|A Māori patient|Demonstrates a patient of Māori ethnicity and who speaks Māori language.  Will also encompass iwi (tribal) affiliation when the RF service requires.|
|**Beryl Hackett**<br>[(as patient's contact)](Patient-MadeleineMeringue.html)<br>[(as RelatedPerson in `Consent`)](Consent-ConsentByRelatedPersonExample.html)|name|Mother of Madeleine Meringue|Demonstrates a relative of a patient as a designated contact.  Also appears in the form of a contained `RelatedPerson` instance in [consent by a related person](Consent-ConsentByRelatedPersonExample.html).|
|[**Te Tai Tokerau Rheumatic Fever Secondary Prevention Service**](Organization-TeTaiTokerauRFSecondaryPreventionService.html)|HPI org: `G0M086-B` (official)|A (real) rheumatic fever lead service provider coordinating care of patients in the former Northland DHB area|Demonstrates a FHIR Organisation identified by HPI organisation number.  Appears as creator/author of Madeleine's RF CarePlan; one of the two founding participants of the [LeadProvidersGroup](CareTeam-LeadProvidersGroup.html) `CareTeam` resource.|
|[**Waikato Rheumatic Fever Secondary Prevention Service**](Organization-WaikatoRFSecondaryPreventionService.html)|HPI org: `G0M087-D` (official)|A (real) rheumatic fever lead service provider coordinating care of patients in the former Waikato DHB area|Demonstrates a FHIR Organisation identified by HPI organisation number.  One of the two founding participants of the [LeadProvidersGroup](CareTeam-LeadProvidersGroup.html) `CareTeam` resource.|
|[**Lead Providers Group**](CareTeam-LeadProvidersGroup.html)|well-known identifier=`RheumaticFeverLeadProviderGroup`|A group representing all of the RF lead service providersfounding participants of the [LeadProvidersGroup](CareTeam-LeadProvidersGroup.html) `CareTeam` resource|A definition, used by the server's consent-based access management, which controls which organisations (FHIR client-ids) can create/access RF FHIR resources.|
|[**Madeleine Meringue's secondary prophylaxis team**](CareTeam-SecondaryProphylaxisCareTeam.html)|-|A group of all the parties who will be involved in delivery of RF treatment ('secondary prophylaxis') to a particular patient|Demonstrates representation of organisations and practitioners as participants in a `CareTeam`, all with official HPI/NHI identifiers.|
|[**Isabel Injecta**](Patient-PaniaPunga.html)|HPI pract. ID:`99ZAAA` (fake)|A district nurse who delivers RF secondary prophylaxis as part of patient care|Demonstrates logical reference to an HPI practitioner in the same organisation as an RF prevention service.|
|[**Felicity Faraway**](Patient-PaniaPunga.html)|HPI pract. ID:`99ZABC` (fake)|A district nurse in another region away from the RF patient's normal RF care team|Demonstrates logical reference to an HPI practitioner in another HPI organisation.|