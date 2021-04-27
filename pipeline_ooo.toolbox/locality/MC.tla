---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1607008750925300000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1607008750925301000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {2,3}, dep |-> {} ],
   [ pc |-> 3, type |-> {3}, lat |-> {3}, dep |-> {1} ],
   [ pc |-> 4, type |-> {1,2}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 5, type |-> {2}, lat |-> {3}, dep |-> {} ]
>>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1607008750925302000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1607008750925303000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1607008750925304000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1607008750925305000 == 
{2}
----

=============================================================================
\* Modification History
\* Created Thu Dec 03 16:19:10 CET 2020 by benjaminbinder
