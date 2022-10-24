---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_1652716093595290000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_1652716093595291000 == 
{1}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1652716093595292000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_1652716093595293000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_1652716093595294000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_1652716093595295000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_1652716093595296000 == 
<<
[ ind |-> 1, type |-> "MemRead", r0 |-> "ra", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 2, type |-> "IntAlu", r0 |-> "", r1 |-> "ra", r2 |-> "", targA |-> "" ],
[ ind |-> 3, type |-> "IntAlu", r0 |-> "rb", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 4, type |-> "MemWrite", r0 |-> "", r1 |-> "rb", r2 |-> "", targA |-> "" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_1652716093595297000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_1652716093595298000 == 
"test"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_1652716093595299000 == 
[ IntAlu |-> 3, MemRead |-> 1, MemWrite |-> 3, IntDiv |-> 4, IntMult |-> 4 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_1652716093596300000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1652716093596300000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1652716093596301000 ==
NoTA(TRUE)
----
=============================================================================
\* Modification History
\* Created Mon May 16 17:48:13 CEST 2022 by benjaminbinder
