---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_162255362676735000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_162255362676736000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_162255362676737000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_162255362676738000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_162255362676739000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_162255362676740000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_162255362676741000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_162255362676742000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_162255362676943000 ==
NoTALoc => NoTAInter
----
=============================================================================
\* Modification History
\* Created Tue Jun 01 15:20:26 CEST 2021 by benjaminbinder
