---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1644412446874386000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1644412446874387000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3} ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1644412446874388000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1644412446874389000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1644412446874390000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1644412446874391000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1644412446874392000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1644412446874393000 == 
-1
----

=============================================================================
\* Modification History
\* Created Wed Feb 09 14:14:06 CET 2022 by benjaminbinder
