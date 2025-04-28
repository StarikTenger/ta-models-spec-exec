---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_1660754344846350000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_1660754344846351000 == 
{
4470, 
4474, 
4479, 
4483, 
4484, 
4485
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1660754344846352000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_1660754344846353000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_1660754344846354000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_1660754344846355000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_1660754344846356000 == 
<<
[ ind |-> 4466, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x10552" ],
[ ind |-> 4467, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x10554" ],
[ ind |-> 4468, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x10556" ],
[ ind |-> 4469, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10558" ],
[ ind |-> 4470, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1055a" ],
[ ind |-> 4471, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1055e" ],
[ ind |-> 4472, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x10562" ],
[ ind |-> 4473, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x10566" ],
[ ind |-> 4474, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10688" ],
[ ind |-> 4475, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x1068c" ],
[ ind |-> 4476, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10690" ],
[ ind |-> 4477, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10692" ],
[ ind |-> 4478, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10568" ],
[ ind |-> 4479, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1056c" ],
[ ind |-> 4480, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10570" ],
[ ind |-> 4481, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10572" ],
[ ind |-> 4482, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10576" ],
[ ind |-> 4483, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1057a" ],
[ ind |-> 4484, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1057e" ],
[ ind |-> 4485, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10582" ],
[ ind |-> 4486, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10586" ],
[ ind |-> 4487, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x1058a" ],
[ ind |-> 4488, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x1058e" ],
[ ind |-> 4489, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10608" ],
[ ind |-> 4490, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x1060c" ],
[ ind |-> 4491, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10610" ],
[ ind |-> 4492, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10614" ],
[ ind |-> 4493, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10616" ],
[ ind |-> 4494, type |-> "MemRead", r0 |-> "a3", r1 |-> "", r2 |-> "", addr |-> "0x10618" ],
[ ind |-> 4495, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1061a" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_1660754344846357000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_1660754344846358000 == 
"insertsort-rev-1tr-s2"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_1660754344846359000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_1660754344846360000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1660754344846360000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1660754344846361000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Wed Aug 17 18:39:04 CEST 2022 by benjaminbinder
