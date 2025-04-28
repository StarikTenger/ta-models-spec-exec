---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_163112192423347000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_163112192423348000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1}, dep |-> {} ], \*,3
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1} ],
   [ pc |-> 3, type |-> {1,2}, lat |-> {3,2}, dep |-> {} ],
   [ pc |-> 4, type |-> {1}, lat |-> {2}, dep |-> {3} ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_163112192423349000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_163112192423350000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_163112192423351000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_163112192423352000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_163112192423353000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_163112192423354000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_163112192423355000 ==
~(ProgDone(ProgLen) /\ FU[3] = 1 /\ FULat[3] = 3 /\ FU2[3] = 2 /\ FULat2[3] = 2)
----
=============================================================================
\* Modification History
\* Created Wed Sep 08 19:25:24 CEST 2021 by benjaminbinder
