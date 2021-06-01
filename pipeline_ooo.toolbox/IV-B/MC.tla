---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0Program
const_162255362368826000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {1}, dep |-> {1} ],
   [ pc |-> 3, type |-> {2}, lat |-> {1}, dep |-> {} ],
   \*[ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3} ]
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3,2} ]
>>
----

\* CONSTANT definitions @modelParameterConstants:1missLat
const_162255362368827000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_162255362368828000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3varIF
const_162255362368829000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:4superscal
const_162255362368830000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_162255362368831000 == 
{1}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_162255362368832000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_162255362368833000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_162255362368834000 ==
NoTAInter => NoTASteps
----
=============================================================================
\* Modification History
\* Created Tue Jun 01 15:20:23 CEST 2021 by benjaminbinder
