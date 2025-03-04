---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_16225535479272000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program 
const_16225535479273000 == 
<< 
    [ pc |-> 1, type |-> {1}, lat |-> {1,3}, dep |-> {} ],
    [ pc |-> 2, type |-> {1,2}, lat |-> {3}, dep |-> {1} ],
    [ pc |-> 3, type |-> {1,2}, lat |-> {3}, dep |-> {} ],
    [ pc |-> 4, type |-> {1,2}, lat |-> {3}, dep |-> {3} ]
>>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_16225535479274000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_16225535479275000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_16225535479276000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_16225535479277000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_16225535479278000 == 
{1,5}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_16225535479279000 == 
-1
----

=============================================================================
\* Modification History
\* Created Tue Jun 01 15:19:07 CEST 2021 by benjaminbinder
