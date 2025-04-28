---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_167415153230826000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_167415153230827000 == 
{1}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_167415153230828000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_167415153230829000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_167415153230830000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_167415153230831000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_167415153230832000 == 
<<
[ ind |-> 1, type |-> "MemRead", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x1" ],
[ ind |-> 2, type |-> "IntAlu", r0 |-> "", r1 |-> "ra", r2 |-> "", addr |-> "0x2" ],
[ ind |-> 3, type |-> "IntAlu", r0 |-> "rb", r1 |-> "", r2 |-> "", addr |-> "0x3" ],
[ ind |-> 4, type |-> "MemWrite", r0 |-> "", r1 |-> "rb", r2 |-> "", addr |-> "0x4" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_167415153230833000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_167415153230834000 == 
"test"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_167415153230835000 == 
[ IntAlu |-> 3, MemRead |-> 1, MemWrite |-> 3, IntDiv |-> 4, IntMult |-> 4 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_167415153230836000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_167415153230836000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_167415153230837000 ==
NoTA(TRUE)
----
=============================================================================
\* Modification History
\* Created Thu Jan 19 19:05:32 CET 2023 by benjaminbinder
