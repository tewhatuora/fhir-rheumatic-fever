<!-- markdownlint-disable MD041 -->
### FHIR data models (pilot phase)

This section provides an overview of the design of the FHIR data representations that authorized applications can use to record and interchange rheumatic fever information.

#### FHIR resource model

<!-- markdownlint-disable MD033 -->
<div width="100%">
<!-- Generated from `input/images-source/FHIR-resource-model-rheumaticfever-pilot.plantuml` -->
{% include FHIR-resource-model-rheumaticfever.svg %}
</div>
<br clear="all">

#### FHIR careplan instance lifecycle

<div width="100%">
<!-- Generated from `input/images-source/flow-FHIR-rheumaticfever-lifecycle.plantuml` -->
{% include flow-FHIR-rheumaticfever-lifecycle.svg %}
</div>
<br clear="all">

#### Secondary prophylaxis medication planning and encounter recording

<div width="90%">
<!-- Generated from `input/images-source/obj-FHIR-medication-planandrecord.plantuml` -->
{% include obj-FHIR-medication-planandrecord.svg %}
</div>
<br clear="all">

#### Secondary prophylaxis appointment planning and recording states model

<div width="100%">
<!-- Generated from `input/images-source/state-FHIR-rheumaticfever-SPrecordinglifecycles.plantuml` -->
{% include state-FHIR-rheumaticfever-SPrecordinglifecycles.svg %}
</div>
<br clear="all">

#### Other care planning and encounter recording

<div width="100%">
<!-- Generated from `input/images-source/obj-FHIR-otherencounters-planandrecord.plantuml` -->
{% include obj-FHIR-otherencounters-planandrecord.svg %}
</div>
<br clear="all">

#### Enhanced diagnosis representation

<div width="100%">
<!-- Generated from `input/images-source/obj-FHIR-data-diagnosis.plantuml` -->
{% include obj-FHIR-data-diagnosis.svg %}
</div>
<br clear="all">
