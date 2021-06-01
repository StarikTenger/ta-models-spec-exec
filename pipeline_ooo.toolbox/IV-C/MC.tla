---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1622485492252587000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1622485492252588000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1622485492252589000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1622485492252590000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1622485492252591000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1622485492252592000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1622485492252593000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1622485492252594000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1622485492252595000 ==
NoTALoc => NoTAInter
----
=============================================================================
\* Modification History
\* Created Mon May 31 20:24:52 CEST 2021 by benjaminbinder
