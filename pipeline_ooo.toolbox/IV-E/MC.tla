---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1622496343750911000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1622496343750912000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1622496343750913000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1622496343750914000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1622496343750915000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1622496343750916000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1622496343750917000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1622496343750918000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1622496343750919000 ==
NoTAComp \/ NoTAInter => NoTALoc
----
=============================================================================
\* Modification History
\* Created Mon May 31 23:25:43 CEST 2021 by benjaminbinder
