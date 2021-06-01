---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1622483129462187000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1622483129462188000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3} ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1622483129462189000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1622483129462190000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1622483129462191000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1622483129462192000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1622483129462193000 == 
{1,5}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1622483129462194000 == 
-1
----

=============================================================================
\* Modification History
\* Created Mon May 31 19:45:29 CEST 2021 by benjaminbinder
