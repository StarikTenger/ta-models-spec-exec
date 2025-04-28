---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_163347156193329000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_163347156193330000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}, imiss |-> {FALSE} ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_163347156193331000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_163347156193332000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_163347156193333000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_163347156193334000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_163347156193335000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_163347156193336000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_163347156193337000 ==
~(ProgDone(ProgLen) /\ iMiss[3] /\ iMiss2[3] /\ FULat[1]=1 /\ FULat2[1]=3)
----
=============================================================================
\* Modification History
\* Created Wed Oct 06 00:06:01 CEST 2021 by benjaminbinder
