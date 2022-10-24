---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_1660752634244302000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_1660752634244303000 == 
{
4170, 
4172, 
4185, 
4186, 
4187, 
4191, 
4192
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1660752634244304000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_1660752634244305000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_1660752634244306000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_1660752634244307000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_1660752634244308000 == 
<<
[ ind |-> 4164, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x10454" ],
[ ind |-> 4165, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10456" ],
[ ind |-> 4166, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x10458" ],
[ ind |-> 4167, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x1045a" ],
[ ind |-> 4168, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x1045c" ],
[ ind |-> 4169, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x10460" ],
[ ind |-> 4170, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "", r2 |-> "", addr |-> "0x10496" ],
[ ind |-> 4171, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1049a" ],
[ ind |-> 4172, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x1049e" ],
[ ind |-> 4173, type |-> "FloatCmp", r0 |-> "a5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x104a2" ],
[ ind |-> 4174, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104a6" ],
[ ind |-> 4175, type |-> "FloatMemRead", r0 |-> "fa0", r1 |-> "", r2 |-> "", addr |-> "0x10462" ],
[ ind |-> 4176, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10466" ],
[ ind |-> 4177, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x12288" ],
[ ind |-> 4178, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x1228a" ],
[ ind |-> 4179, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x1228c" ],
[ ind |-> 4180, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x1228e" ],
[ ind |-> 4181, type |-> "FloatMemWrite", r0 |-> "fa0", r1 |-> "", r2 |-> "", addr |-> "0x12290" ],
[ ind |-> 4182, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x12294" ],
[ ind |-> 4183, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x12298" ],
[ ind |-> 4184, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x1229c" ],
[ ind |-> 4185, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x122a0" ],
[ ind |-> 4186, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x122a4" ],
[ ind |-> 4187, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x122a8" ],
[ ind |-> 4188, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x122ac" ],
[ ind |-> 4189, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a5", r2 |-> "", addr |-> "0x122b0" ],
[ ind |-> 4190, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x122b4" ],
[ ind |-> 4191, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x122b6" ],
[ ind |-> 4192, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x122ba" ],
[ ind |-> 4193, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x122be" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_1660752634244309000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_1660752634244310000 == 
"cosf-30-rev-s2"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_1660752634244311000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4, FloatMemRead |-> 1, FloatMemWrite |-> 1, FloatMult |-> 5, FloatAdd |-> 2, FloatMisc |-> 1, FloatCvt |-> 1, FloatCmp |-> 1 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_1660752634244312000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1660752634244312000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1660752634244313000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Wed Aug 17 18:10:34 CEST 2022 by benjaminbinder
