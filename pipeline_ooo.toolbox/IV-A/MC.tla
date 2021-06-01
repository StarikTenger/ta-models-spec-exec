---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_162255362023414000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_162255362023415000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3} ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_162255362023416000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_162255362023417000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_162255362023418000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_162255362023419000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_162255362023420000 == 
{1,5}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_162255362023421000 == 
-1
----

=============================================================================
\* Modification History
\* Created Tue Jun 01 15:20:20 CEST 2021 by benjaminbinder
