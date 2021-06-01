---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_16225006917381289000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_16225006917381290000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1}, dep |-> {1}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 4, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 5, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_16225006917381291000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_16225006917381292000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_16225006917381293000 == 
6
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_16225006917381294000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_16225006917381295000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_16225006917381296000 == 
-1
----

=============================================================================
\* Modification History
\* Created Tue Jun 01 00:38:11 CEST 2021 by benjaminbinder
