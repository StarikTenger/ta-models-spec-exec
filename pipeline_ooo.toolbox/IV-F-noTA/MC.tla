---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_163121400809111000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_163121400809112000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {2}, lat |-> {1,3}, dep |-> {2}, imiss |-> FALSE ],
   [ pc |-> 4, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 5, type |-> {1}, lat |-> {3}, dep |-> {4}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_163121400809113000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_163121400809114000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_163121400809115000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_163121400809216000 == 
{1}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_163121400810217000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_163121400810218000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_163121400810219000 ==
NoTAComp /\ NoTALoc
----
=============================================================================
\* Modification History
\* Created Thu Sep 09 21:00:08 CEST 2021 by benjaminbinder
