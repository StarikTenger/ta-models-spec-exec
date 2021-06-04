---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_162272547660883000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_162272547660884000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_162272547660885000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_162272547660886000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_162272547660887000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_162272547660888000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_162272547660889000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_162272547660890000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_162272547660891000 ==
NoTAComp \/ NoTAInter => NoTALoc
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_162272547660892000 ==
~(ProgDone(ProgLen) /\ (\E i \in 1..ProgLen: FULat[i]/=FULat2[i]) /\ NoTAInter /\ NoTALoc /\ NoTAComp)
----
=============================================================================
\* Modification History
\* Created Thu Jun 03 15:04:36 CEST 2021 by benjaminbinder
