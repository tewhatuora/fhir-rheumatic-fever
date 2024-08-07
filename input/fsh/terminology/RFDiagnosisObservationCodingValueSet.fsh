ValueSet: RFDiagnosisObservationCodingValueSet
Id: rf-observation-diagnosis-component-code
Title: "Codes for component observations of NZ rheumatic fever diagnosis"
Description:  "This value set combines SNOMED internaional codes with a handful of special codes for NZ RF diagnosis observation data coding"
* ^version = "1.0.0"
* ^experimental = false
* ^status = #active

// The one NZ special code at this time...
* include codes from system $rfnzt where concept descendant-of #diagnosis-component-NZ-special-concepts

// handy regex when copying coding content from instance: delete from ]] to end of line \]\].*$

// ECHO cardio observation component codings
* $sct#48724000   "Mitral valve regurgitation (disorder)"
* $sct#79619009   "Mitral valve stenosis (disorder)"
* $sct#60234000   "Aortic valve regurgitation (disorder)"
* $sct#60573004   "Aortic valve stenosis (disorder)"
* $sct#111287006  "Tricuspid valve regurgitation (disorder)"

// Jones criteria observation component codings
* $sct#703119002  "Carditis due to rheumatic fever (disorder)"
* $sct#95325000   "Subcutaneous nodule (finding)"
* $sct#200951007  "Erythema marginatum in acute rheumatic fever (disorder)"
* $sct#111211002  "Migratory polyarthritis (disorder)"
* $sct#699462004  "Monoarthritis (disorder)"
* $sct#46826000   "Rheumatic chorea (disorder)"
* $sct#35678005   "Multiple joint pain (finding)"
* $sct#165468009  "Erythrocyte sedimentation rate above reference range (finding)"
* $sct#416838001  "Erythrocyte sedimentation rate measurement (procedure)"
* $sct#119971000119104  "C-reactive protein above reference range (finding)"
* $sct#55235003   "C-reactive protein measurement (procedure)"
* $sct#251207006  "PR interval duration (observable entity)"
* $sct#164947007  "Prolonged PR interval (finding)"
* $sct#386661006  "Fever (finding)"
* $sct#44808001   "Conduction disorder of the heart (disorder)"

// Strep primary evidence observation component codings
* $sct#82703001   "Antistreptolysin O titer (procedure)"
* $sct#394723001  "Anti-deoxyribonuclease B antibody level (procedure)"
* $sct#117015009  "Throat culture (procedure)"
* $sct#9718006    "Polymerase chain reaction analysis (procedure)"
* $sct#312504002  "Antigen test (procedure)"