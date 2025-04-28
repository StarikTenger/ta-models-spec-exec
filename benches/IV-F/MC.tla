---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1631213779683139000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1631213779683140000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {2}, lat |-> {1,3}, dep |-> {2}, imiss |-> FALSE ],
   [ pc |-> 4, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 5, type |-> {1}, lat |-> {3}, dep |-> {4}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1631213779683141000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1631213779683142000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1631213779683143000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1631213779683144000 == 
{1}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1631213779683145000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1631213779684146000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1631213779684147000 ==
~(ProgDone(ProgLen) /\ NoTAComp /\ NoTALoc /\ NoTAInter /\ \E i \in 3..ProgLen: FULat[i]/=FULat2[i])
----
=============================================================================
\* Modification History
\* Created Thu Sep 09 20:56:19 CEST 2021 by benjaminbinder
