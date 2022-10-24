---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1644414391670458000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1644414391670459000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {2} ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1644414391670460000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1644414391670461000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1644414391670462000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1644414391670463000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1644414391670464000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1644414391670465000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1644414391670466000 ==
FULat[1]=FULat2[1] \/ ~ProgDone(ProgLen)
----
=============================================================================
\* Modification History
\* Created Wed Feb 09 14:46:31 CET 2022 by benjaminbinder
