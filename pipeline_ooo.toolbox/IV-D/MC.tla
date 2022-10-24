---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1624998828916840000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1624998828916841000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {2,3}, dep |-> {} ],
   [ pc |-> 3, type |-> {3}, lat |-> {3}, dep |-> {1} ],
   [ pc |-> 4, type |-> {1,2}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 5, type |-> {2}, lat |-> {3}, dep |-> {} ]
>>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1624998828916842000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1624998828916843000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1624998828916844000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1624998828916845000 == 
{2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1624998828916846000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1624998828916847000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1624998828916848000 ==
(NoTAInter \/ NoTASteps) => NoTALoc
----
=============================================================================
\* Modification History
\* Created Tue Jun 29 22:33:48 CEST 2021 by benjaminbinder
