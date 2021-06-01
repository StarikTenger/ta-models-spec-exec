---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1622485679960623000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1622485679960624000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {2,3}, dep |-> {} ],
   [ pc |-> 3, type |-> {3}, lat |-> {3}, dep |-> {1} ],
   [ pc |-> 4, type |-> {1,2}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 5, type |-> {2}, lat |-> {3}, dep |-> {} ]
>>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1622485679960625000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1622485679960626000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1622485679960627000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1622485679960628000 == 
{2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1622485679960629000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1622485679960630000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1622485679960631000 ==
(NoTAInter \/ NoTASteps) => NoTALoc
----
=============================================================================
\* Modification History
\* Created Mon May 31 20:27:59 CEST 2021 by benjaminbinder
