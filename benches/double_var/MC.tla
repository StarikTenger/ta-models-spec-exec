---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1625077513847914000 == 
TRUE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1625077513847915000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1}, dep |-> {}, imiss |-> BOOLEAN ],
   [ pc |-> 2, type |-> {1}, lat |-> {1,5}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 3, type |-> {2}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ],
   [ pc |-> 4, type |-> {2}, lat |-> {1}, dep |-> {}, imiss |-> {FALSE} ]
    >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1625077513847916000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1625077513847917000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1625077513847918000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1625077513847919000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1625077513847920000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1625077513847921000 == 
-1
----

=============================================================================
\* Modification History
\* Created Wed Jun 30 20:25:13 CEST 2021 by benjaminbinder
