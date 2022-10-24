---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_163113643308683000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_163113643308684000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1} ],
   [ pc |-> 3, type |-> {1,2}, lat |-> {3,2}, dep |-> {} ],
   [ pc |-> 4, type |-> {1}, lat |-> {2}, dep |-> {3} ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_163113643308685000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_163113643308686000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_163113643308687000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_163113643308688000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_163113643308689000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_163113643308690000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_163113643308691000 ==
~(ProgDone(ProgLen) /\ FULat[1] = 1 /\ FU[3] = 1 /\ FULat[3] = 3 /\ FULat2[1] = 3 /\ FU2[3] = 2 /\ FULat2[3] = 2)
----
=============================================================================
\* Modification History
\* Created Wed Sep 08 23:27:13 CEST 2021 by benjaminbinder
