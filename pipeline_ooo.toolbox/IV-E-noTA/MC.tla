---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_16312140039872000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_16312140039873000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_16312140039874000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_16312140039875000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_16312140039876000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_16312140039877000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_16312140039878000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_16312140039879000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_163121400398810000 ==
~(ProgDone(ProgLen) /\ (\E i \in 1..ProgLen: FULat[i]/=FULat2[i]) /\ NoTAInter /\ NoTALoc /\ NoTAComp)
----
=============================================================================
\* Modification History
\* Created Thu Sep 09 21:00:03 CEST 2021 by benjaminbinder
