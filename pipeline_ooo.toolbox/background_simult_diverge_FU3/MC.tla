---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_164372033050983000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_164372033050984000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}, imiss |-> {FALSE} ],
   [ pc |-> 5, type |-> {3}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_164372033050985000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_164372033050986000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_164372033050987000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_164372033050988000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_164372033050989000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_164372033050990000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_164372033050991000 ==
~(ProgDone(ProgLen) /\ ~NoTALoc /\ ~NoTAInter)
----
=============================================================================
\* Modification History
\* Created Tue Feb 01 13:58:50 CET 2022 by benjaminbinder
