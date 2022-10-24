---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1631213780112157000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1631213780112158000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1631213780112159000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1631213780112160000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1631213780112161000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1631213780112162000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1631213780112163000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1631213780112164000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1631213780112165000 ==
NoTAComp \/ NoTAInter => NoTALoc
----
=============================================================================
\* Modification History
\* Created Thu Sep 09 20:56:20 CEST 2021 by benjaminbinder
