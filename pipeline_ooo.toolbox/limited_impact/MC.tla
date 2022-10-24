---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_1660605033532728000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_1660605033532729000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1660605033532730000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_1660605033532731000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_1660605033532732000 == 
{3}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_1660605033532733000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_1660605033532734000 == 
<<
[ ind |-> 1, type |-> "MemRead", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x1" ],
[ ind |-> 2, type |-> "IntAlu", r0 |-> "", r1 |-> "ra", r2 |-> "", addr |-> "0x2" ],
[ ind |-> 3, type |-> "IntAlu", r0 |-> "rb", r1 |-> "", r2 |-> "", addr |-> "0x3" ],
[ ind |-> 4, type |-> "MemWrite", r0 |-> "", r1 |-> "rb", r2 |-> "", addr |-> "0x4" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_1660605033532735000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_1660605033532736000 == 
"limited_impact"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_1660605033532737000 == 
[ IntAlu |-> 3, MemRead |-> 3, MemWrite |-> 3, IntDiv |-> 3, IntMult |-> 3 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_1660605033532738000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1660605033532738000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1660605033532739000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Tue Aug 16 01:10:33 CEST 2022 by benjaminbinder
