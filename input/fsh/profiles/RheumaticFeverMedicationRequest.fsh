Profile: RheumaticFeverMedicationRequest
Parent: NzMedicationRequest         // conform to upcoming FHIR API design standards by using NZ Base
Title: "Rheumatic Fever Medication Request"
Description: "Describes medication planned for a rheumatic fever patient over a period of time.  Referenced as an activity in rheumatic fever care plans.  Includes an extension defining the medication frequency which determines the scheduling intervals for Appointments."
Id: nz-sharedcare-rheumaticfever-medicationrequest

* ^version = "1.0.0"
* ^jurisdiction = urn:iso:std:iso:3166#NZ
* ^purpose = "Controls values of medication frequency (secondary prophylaxis appointments) to a set of standard frequency intervals used in NZ RF care."
* insert metaContactDetail([[David Grainger]],[[david.grainger@middleware.co.nz]])

* meta obeys RFNZTagConstraint      // see file CategoriesLabelsTags.fsh

// elements modified from base profile
* extension contains
  RfMedicationRequestFrequencyExtension named medicationFrequency 0..1

* extension[medicationFrequency] ^short = "Sets a standard interval between RF sceondary prophylaxis medication appointments."

// elements from base profile prohibited - NONE

* dosageInstruction.route ^definition = """The planned route for secondary prophylaxis medication delivery is typically one of the following (SNOMED):
- *Intramuscular Injection* 78421000 Intramuscular route (qualifier value)
- *Oral Administration* 26643006 Oral route (qualifier value)
- *Subcutaneous Injection* 34206005 Subcutaneous route (qualifier value)
"""

* dosageInstruction.site ^definition = """The planned site for secondary prophylaxis medication delivery are expected to be one of the following (SNOMED):
- *Ventrogluteal* | 78333006 | Structure of gluteus medius muscle (body structure)
- *Dorsogluteal* | 206007 | Structure of gluteus maximus muscle (body structure)
- *Vastus lateralis* | 1403006 | Structure of vastus lateralis muscle (body structure)
- *Abdomen* | 42972002 |  Subcutaneous tissue structure of anterior abdominal wall (body structure)
"""

* dosageInstruction.extension 0..0
* dosageInstruction.modifierExtension 0..0
* dosageInstruction.sequence 0..0
* dosageInstruction.method 0..0
* dosageInstruction.asNeeded[x] 0..0
