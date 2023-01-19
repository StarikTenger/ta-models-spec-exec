---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_16741440676022000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_16741440676023000 == 
{1}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_16741440676024000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_16741440676025000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_16741440676026000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_16741440676027000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_16741440676028000 == 
<<
[ ind |-> 1, type |-> "MemRead", r0 |-> "ra", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 2, type |-> "IntAlu", r0 |-> "", r1 |-> "ra", r2 |-> "", targA |-> "" ],
[ ind |-> 3, type |-> "IntAlu", r0 |-> "rb", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 4, type |-> "MemWrite", r0 |-> "", r1 |-> "rb", r2 |-> "", targA |-> "" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_16741440676029000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_167414406760210000 == 
"test"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_167414406760211000 == 
[ IntAlu |-> 3, MemRead |-> 1, MemWrite |-> 3, IntDiv |-> 4, IntMult |-> 4 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_167414406760212000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_167414406760212000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_167414406760213000 ==
NoTA(TRUE)
----
=============================================================================
\* Modification History
\* Created Thu Jan 19 17:01:07 CET 2023 by benjaminbinder
