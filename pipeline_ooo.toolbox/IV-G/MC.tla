---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_162255365480771000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_162255365480772000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1}, dep |-> {1}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 4, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 5, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_162255365480773000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_162255365480774000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_162255365480775000 == 
6
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_162255365480776000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_162255365480777000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_162255365480778000 == 
-1
----

=============================================================================
\* Modification History
\* Created Tue Jun 01 15:20:54 CEST 2021 by benjaminbinder
