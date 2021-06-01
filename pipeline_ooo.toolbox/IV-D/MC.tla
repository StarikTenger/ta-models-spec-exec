---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0varIF
const_162255363145344000 == 
FALSE
----

\* CONSTANT definitions @modelParameterConstants:1Program
const_162255363145345000 == 
<< [ pc |-> 1, type |-> {1}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 2, type |-> {2}, lat |-> {2,3}, dep |-> {} ],
   [ pc |-> 3, type |-> {3}, lat |-> {3}, dep |-> {1} ],
   [ pc |-> 4, type |-> {1,2}, lat |-> {3}, dep |-> {} ],
   [ pc |-> 5, type |-> {2}, lat |-> {3}, dep |-> {} ]
>>
----

\* CONSTANT definitions @modelParameterConstants:2superscal
const_162255363145346000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3N_FU
const_162255363145347000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:4missLat
const_162255363145348000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:5locFU
const_162255363145349000 == 
{2}
----

\* CONSTANT definitions @modelParameterConstants:6Lat
const_162255363145350000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:7modeLen
const_162255363145351000 == 
-1
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_162255363146352000 ==
(NoTAInter \/ NoTASteps) => NoTALoc
----
=============================================================================
\* Modification History
\* Created Tue Jun 01 15:20:31 CEST 2021 by benjaminbinder
