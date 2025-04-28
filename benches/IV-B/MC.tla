---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0Program
const_1624991662926660000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {1}, dep |-> {1} ],
   [ pc |-> 3, type |-> {2}, lat |-> {1}, dep |-> {} ],
   \*[ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3} ]
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3,2} ]
>>
----

\* CONSTANT definitions @modelParameterConstants:1missLat
const_1624991662926661000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1624991662926662000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3varIF
const_1624991662926663000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:4superscal
const_1624991662926664000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1624991662926665000 == 
{1}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1624991662926666000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1624991662926667000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1624991662927668000 ==
NoTAInter => NoTASteps
----
=============================================================================
\* Modification History
\* Created Tue Jun 29 20:34:22 CEST 2021 by benjaminbinder
