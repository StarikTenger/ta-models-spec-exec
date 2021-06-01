---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_162255364314062000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_162255364314063000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {2}, lat |-> {1,3}, dep |-> {2}, imiss |-> FALSE ],
   [ pc |-> 4, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 5, type |-> {1}, lat |-> {3}, dep |-> {4}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_162255364314064000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_162255364314065000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_162255364314066000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_162255364314067000 == 
{1}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_162255364314068000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_162255364314069000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_162255364314070000 ==
~(ProgDone(ProgLen) /\ NoTAComp /\ NoTALoc /\ NoTAInter /\ \E i \in 3..ProgLen: FULat[i]/=FULat2[i])
----
=============================================================================
\* Modification History
\* Created Tue Jun 01 15:20:43 CEST 2021 by benjaminbinder
