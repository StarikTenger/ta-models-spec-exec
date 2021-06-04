---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_162272545057964000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_162272545057965000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3} ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_162272545057966000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_162272545057967000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_162272545057968000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_162272545057969000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_162272545057970000 == 
{1,5}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_162272545057971000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_162272545057972000 ==
~(ProgDone(ProgLen) /\ NoTAInter /\ NoTASteps /\ NoTALoc /\ NoTAComp)
----
=============================================================================
\* Modification History
\* Created Thu Jun 03 15:04:10 CEST 2021 by benjaminbinder
