---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_163304638104811000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_163304638104812000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 4, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 5, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_163304638104813000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_163304638104814000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_163304638104815000 == 
6
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_163304638104816000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_163304638104817000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_163304638104818000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_163304638104819000 ==
~(ProgDone(ProgLen)
/\ (NoTALocPart(ProgLen-1) /\ NoTAInterPart(ProgLen-1))
/\ (~NoTALocPart(ProgLen) \/ ~NoTAInterPart(ProgLen)))
----
=============================================================================
\* Modification History
\* Created Fri Oct 01 01:59:41 CEST 2021 by benjaminbinder
