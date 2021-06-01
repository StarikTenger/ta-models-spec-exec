---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_16225004997161280000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_16225004997161281000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {2}, lat |-> {1,3}, dep |-> {2}, imiss |-> FALSE ],
   [ pc |-> 4, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 5, type |-> {1}, lat |-> {3}, dep |-> {4}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_16225004997161282000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_16225004997161283000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_16225004997161284000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_16225004997161285000 == 
{1}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_16225004997161286000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_16225004997161287000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_16225004997161288000 ==
~(ProgDone(ProgLen) /\ NoTAComp /\ NoTALoc /\ NoTAInter /\ \E i \in 3..ProgLen: FULat[i]/=FULat2[i])
----
=============================================================================
\* Modification History
\* Created Tue Jun 01 00:34:59 CEST 2021 by benjaminbinder
