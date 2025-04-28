---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1624991658139651000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1624991658139652000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3} ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1624991658139653000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1624991658139654000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1624991658139655000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1624991658139656000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1624991658139657000 == 
{1,5}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1624991658139658000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1624991658139659000 ==
~(ProgDone(ProgLen) /\ NoTAInter /\ NoTASteps /\ NoTALoc /\ NoTAComp)
----
=============================================================================
\* Modification History
\* Created Tue Jun 29 20:34:18 CEST 2021 by benjaminbinder
