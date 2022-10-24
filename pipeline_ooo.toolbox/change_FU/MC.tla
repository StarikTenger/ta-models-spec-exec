---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_16378693875142000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_16378693875143000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 2, type |-> {1}, lat |-> {3}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {1,2}, lat |-> {3}, dep |-> {}, imiss |-> {FALSE} ]
   \*,[ pc |-> 4, type |-> {2}, lat |-> {3}, dep |-> {}, imiss |-> {FALSE} ]
    >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_16378693875144000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_16378693875145000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_16378693875146000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_16378693875147000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_16378693875148000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_16378693875149000 == 
-1
----

=============================================================================
\* Modification History
\* Created Thu Nov 25 20:43:07 CET 2021 by benjaminbinder
