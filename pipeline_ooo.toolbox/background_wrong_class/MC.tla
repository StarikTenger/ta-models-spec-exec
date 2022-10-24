---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1625236592541986000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1625236592541987000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}, imiss |-> {FALSE} ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1625236592541988000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1625236592541989000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1625236592541990000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1625236592541991000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1625236592541992000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1625236592541993000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1625236592541994000 ==
~(ProgDone(ProgLen) /\ NoTALoc /\ ~NoTAInter)
----
=============================================================================
\* Modification History
\* Created Fri Jul 02 16:36:32 CEST 2021 by benjaminbinder
