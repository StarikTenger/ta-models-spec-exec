---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0Program
const_1622483290754226000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {1}, dep |-> {1} ],
   [ pc |-> 3, type |-> {2}, lat |-> {1}, dep |-> {} ],
   \*[ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3} ]
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3,2} ]
>>
----

\* CONSTANT definitions @modelParameterConstants:1missLat
const_1622483290754227000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1622483290754228000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3varIF
const_1622483290754229000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:4superscal
const_1622483290754230000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1622483290754231000 == 
{1}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1622483290754232000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1622483290754233000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1622483290754234000 ==
NoTAInter => NoTASteps
----
=============================================================================
\* Modification History
\* Created Mon May 31 19:48:10 CEST 2021 by benjaminbinder
