---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_162272508530655000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_162272508530656000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1}, dep |-> {1}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 4, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 5, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_162272508530657000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_162272508530658000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_162272508530659000 == 
6
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_162272508530660000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_162272508530661000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_162272508530662000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_162272508530663000 ==
~(ProgDone(ProgLen)
/\ (NoTALocPart(ProgLen-1) /\ NoTAInterPart(ProgLen-1))
/\ (~NoTALocPart(ProgLen) \/ ~NoTAInterPart(ProgLen)))
----
=============================================================================
\* Modification History
\* Created Thu Jun 03 14:58:05 CEST 2021 by benjaminbinder
