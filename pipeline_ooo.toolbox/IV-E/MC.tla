---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_162255363438553000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_162255363438554000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_162255363438555000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_162255363438556000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_162255363438557000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_162255363438558000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_162255363438559000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_162255363438560000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_162255363438561000 ==
NoTAComp \/ NoTAInter => NoTALoc
----
=============================================================================
\* Modification History
\* Created Tue Jun 01 15:20:34 CEST 2021 by benjaminbinder
