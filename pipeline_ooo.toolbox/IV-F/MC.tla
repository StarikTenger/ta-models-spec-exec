---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1622725492149103000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1622725492150104000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {2}, lat |-> {1,3}, dep |-> {2}, imiss |-> FALSE ],
   [ pc |-> 4, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 5, type |-> {1}, lat |-> {3}, dep |-> {4}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1622725492150105000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1622725492150106000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1622725492150107000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1622725492150108000 == 
{1}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1622725492150109000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1622725492150110000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1622725492150111000 ==
NoTAComp /\ NoTALoc
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1622725492150112000 ==
~(ProgDone(ProgLen) /\ NoTAComp /\ NoTALoc /\ NoTAInter /\ \E i \in 3..ProgLen: FULat[i]/=FULat2[i])
----
=============================================================================
\* Modification History
\* Created Thu Jun 03 15:04:52 CEST 2021 by benjaminbinder
