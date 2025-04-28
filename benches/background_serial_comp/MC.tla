---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_163502319332547000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_163502319332548000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 4, type |-> {1}, lat |-> {2,3}, dep |-> {3} ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_163502319332549000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_163502319332550000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_163502319332551000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_163502319332552000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_163502319332553000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_163502319332554000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_163502319332555000 ==
NoTALoc \/ FULat[4] /= 2 \/ FULat2[4] /= 3
----
=============================================================================
\* Modification History
\* Created Sat Oct 23 23:06:33 CEST 2021 by benjaminbinder
