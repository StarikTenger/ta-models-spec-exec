---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1604508390815998000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1604508390815999000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_16045083908151000000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_16045083908151001000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_16045083908151002000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_16045083908151003000 == 
{1,2}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_16045083908151004000 ==
~(/\ \A ex \in 1..2: \E i \in 1..Len(progs[ex].exec): progs[ex].exec[i].PC.pc = Len(Program) /\ progs[ex].exec[i].done
  /\ NoTARei /\ ~NoTAGlob
 )
----
=============================================================================
\* Modification History
\* Created Wed Nov 04 17:46:30 CET 2020 by benjaminbinder
