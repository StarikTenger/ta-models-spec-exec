---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_163337528504747000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_163337528504748000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}, imiss |-> {FALSE} ],
   [ pc |-> 5, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_163337528504749000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_163337528504750000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_163337528504751000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_163337528504752000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_163337528504753000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_163337528504754000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_163337528504855000 ==
~(ProgDone(ProgLen) /\ NoTALoc /\ ~NoTAInter)
----
=============================================================================
\* Modification History
\* Created Mon Oct 04 21:21:25 CEST 2021 by benjaminbinder
