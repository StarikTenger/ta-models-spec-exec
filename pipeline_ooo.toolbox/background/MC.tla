---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_1618947966278713000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_1618947966278714000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1} ],
   [ pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3} ] >>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_1618947966278715000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_1618947966278716000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_1618947966278717000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_1618947966278718000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_1618947966278719000 == 
{1,5}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_1618947966278720000 == 
-1
----

=============================================================================
\* Modification History
\* Created Tue Apr 20 21:46:06 CEST 2021 by benjaminbinder
