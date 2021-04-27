---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_16155586690699000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_161555866906910000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 2, type |-> {1}, lat |-> {1}, dep |-> {1}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 4, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 5, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> BOOLEAN ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_161555866906911000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_161555866906912000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_161555866906913000 == 
6
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_161555866906914000 == 
{1,2}
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_161555866907015000 ==
~(/\ \A ex \in 1..2: \E i \in 1..Len(progs[ex].exec): progs[ex].exec[i].PC.pc = Len(Program) /\ progs[ex].exec[i].done
  /\ FULat[1] = 1 /\ FULat2[1] = 3
  /\ ~iMiss[5] /\ iMiss2[5]
 )
----
=============================================================================
\* Modification History
\* Created Fri Mar 12 15:17:49 CET 2021 by benjaminbinder
