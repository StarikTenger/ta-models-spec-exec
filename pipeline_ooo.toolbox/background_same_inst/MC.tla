---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_163337634754065000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_163337634754066000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 4, type |-> {2}, lat |-> {3}, dep |-> {3}, imiss |-> {FALSE} ],
   [ pc |-> 5, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ]
   \*,   [ pc |-> 6, type |-> {1}, lat |-> {3}, dep |-> {5}, imiss |-> {FALSE} ]
   >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_163337634754067000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_163337634754068000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_163337634754069000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_163337634754070000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_163337634754071000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_163337634754072000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_163337634754073000 ==
~(ProgDone(ProgLen) /\ FULat[1] = 1 /\ FULat2[1] = 3 /\ iMiss[5] /\ ~iMiss2[5] /\ ~NoTALoc)
----
=============================================================================
\* Modification History
\* Created Mon Oct 04 21:39:07 CEST 2021 by benjaminbinder
