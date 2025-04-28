---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_1660587427874326000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_1660587427874327000 == 
{1}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1660587427874328000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_1660587427874329000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_1660587427874330000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_1660587427874331000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_1660587427874332000 == 
<<
[ ind |-> 1, type |-> "MemRead", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x1" ],
[ ind |-> 2, type |-> "IntAlu", r0 |-> "", r1 |-> "ra", r2 |-> "", addr |-> "0x2" ],
[ ind |-> 3, type |-> "IntAlu", r0 |-> "rb", r1 |-> "", r2 |-> "", addr |-> "0x3" ],
[ ind |-> 4, type |-> "MemWrite", r0 |-> "", r1 |-> "rb", r2 |-> "", addr |-> "0x4" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_1660587427874333000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_1660587427874334000 == 
"TA_pattern"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_1660587427874335000 == 
[ IntAlu |-> 3, MemRead |-> 1, MemWrite |-> 3, IntDiv |-> 3, IntMult |-> 3 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_1660587427874336000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1660587427874336000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1660587427874337000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Mon Aug 15 20:17:07 CEST 2022 by benjaminbinder
