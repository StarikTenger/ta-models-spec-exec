---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1625234301848932000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1625234301848933000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1625234301848934000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1625234301848935000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1625234301848936000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1625234301848937000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1625234301848938000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1625234301848939000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1625234301848940000 ==
ProgDone(ProgLen) /\ NoTALoc => NoTAInter
----
=============================================================================
\* Modification History
\* Created Fri Jul 02 15:58:21 CEST 2021 by benjaminbinder
