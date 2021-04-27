---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0Program
const_16155569397902000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {1}, dep |-> {1} ],
   [ pc |-> 3, type |-> {2}, lat |-> {1}, dep |-> {} ],
   \*[ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3} ]
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3,2} ]
>>
----

\* CONSTANT definitions @modelParameterConstants:1missLat
const_16155569397903000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_16155569397904000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3varIF
const_16155569397905000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:4superscal
const_16155569397906000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_16155569397907000 == 
{1}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_16155569397908000 ==
NoTACass
----
=============================================================================
\* Modification History
\* Created Fri Mar 12 14:48:59 CET 2021 by benjaminbinder
