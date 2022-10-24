---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_1653060168095674000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_1653060168095675000 == 
{
4245, 
4268, 
4269, 
4271, 
4272, 
4273, 
4275, 
4276, 
4277, 
4279, 
4280, 
4282, 
4284, 
4288, 
4290, 
4291, 
4293, 
4295, 
4297, 
4299, 
4301, 
4304, 
4306, 
4310, 
4312, 
4313, 
4315, 
4317, 
4320, 
4321, 
4328, 
4330
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1653060168095676000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_1653060168095677000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_1653060168095678000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_1653060168095679000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_1653060168095680000 == 
<<
[ ind |-> 4238, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x10558" ],
[ ind |-> 4239, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x1055a" ],
[ ind |-> 4240, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x1055c" ],
[ ind |-> 4241, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x1055e" ],
[ ind |-> 4242, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10560" ],
[ ind |-> 4243, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x10564" ],
[ ind |-> 4244, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10568" ],
[ ind |-> 4245, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "", r2 |-> "", addr |-> "0x1056c" ],
[ ind |-> 4246, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10570" ],
[ ind |-> 4247, type |-> "FloatMemRead", r0 |-> "fa2", r1 |-> "", r2 |-> "", addr |-> "0x10574" ],
[ ind |-> 4248, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10578" ],
[ ind |-> 4249, type |-> "FloatMemRead", r0 |-> "fa3", r1 |-> "", r2 |-> "", addr |-> "0x1057c" ],
[ ind |-> 4250, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10580" ],
[ ind |-> 4251, type |-> "IntAlu", r0 |-> "a1", r1 |-> "a5", r2 |-> "", addr |-> "0x10584" ],
[ ind |-> 4252, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10588" ],
[ ind |-> 4253, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", addr |-> "0x1058c" ],
[ ind |-> 4254, type |-> "FloatMisc", r0 |-> "fa1", r1 |-> "fa4", r2 |-> "fa4", addr |-> "0x10590" ],
[ ind |-> 4255, type |-> "FloatMisc", r0 |-> "fa0", r1 |-> "fa5", r2 |-> "fa5", addr |-> "0x10594" ],
[ ind |-> 4256, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10598" ],
[ ind |-> 4257, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x1083e" ],
[ ind |-> 4258, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10840" ],
[ ind |-> 4259, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x10842" ],
[ ind |-> 4260, type |-> "FloatMemWrite", r0 |-> "fs0", r1 |-> "", r2 |-> "", addr |-> "0x10844" ],
[ ind |-> 4261, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x10846" ],
[ ind |-> 4262, type |-> "FloatMemWrite", r0 |-> "fa0", r1 |-> "", r2 |-> "", addr |-> "0x10848" ],
[ ind |-> 4263, type |-> "FloatMemWrite", r0 |-> "fa1", r1 |-> "", r2 |-> "", addr |-> "0x1084c" ],
[ ind |-> 4264, type |-> "FloatMemWrite", r0 |-> "fa2", r1 |-> "", r2 |-> "", addr |-> "0x10850" ],
[ ind |-> 4265, type |-> "FloatMemWrite", r0 |-> "fa3", r1 |-> "", r2 |-> "", addr |-> "0x10854" ],
[ ind |-> 4266, type |-> "MemWrite", r0 |-> "a0", r1 |-> "", r2 |-> "", addr |-> "0x10858" ],
[ ind |-> 4267, type |-> "MemWrite", r0 |-> "a1", r1 |-> "", r2 |-> "", addr |-> "0x1085c" ],
[ ind |-> 4268, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "", r2 |-> "", addr |-> "0x10860" ],
[ ind |-> 4269, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x10864" ],
[ ind |-> 4270, type |-> "FloatDiv", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x10868" ],
[ ind |-> 4271, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x1086c" ],
[ ind |-> 4272, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "", r2 |-> "", addr |-> "0x10870" ],
[ ind |-> 4273, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x10874" ],
[ ind |-> 4274, type |-> "FloatDiv", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x10878" ],
[ ind |-> 4275, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x1087c" ],
[ ind |-> 4276, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "", r2 |-> "", addr |-> "0x10880" ],
[ ind |-> 4277, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x10884" ],
[ ind |-> 4278, type |-> "FloatDiv", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x10888" ],
[ ind |-> 4279, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x1088c" ],
[ ind |-> 4280, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x10890" ],
[ ind |-> 4281, type |-> "FloatMult", r0 |-> "fa4", r1 |-> "fa5", r2 |-> "fa5", addr |-> "0x10894" ],
[ ind |-> 4282, type |-> "FloatMemRead", r0 |-> "fa3", r1 |-> "", r2 |-> "", addr |-> "0x10898" ],
[ ind |-> 4283, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1089c" ],
[ ind |-> 4284, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x108a0" ],
[ ind |-> 4285, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa3", r2 |-> "fa5", addr |-> "0x108a4" ],
[ ind |-> 4286, type |-> "FloatAdd", r0 |-> "fa4", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x108a8" ],
[ ind |-> 4287, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x108ac" ],
[ ind |-> 4288, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x108b0" ],
[ ind |-> 4289, type |-> "FloatDiv", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x108b4" ],
[ ind |-> 4290, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x108b8" ],
[ ind |-> 4291, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x108bc" ],
[ ind |-> 4292, type |-> "FloatAdd", r0 |-> "fa4", r1 |-> "fa5", r2 |-> "fa5", addr |-> "0x108c0" ],
[ ind |-> 4293, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x108c4" ],
[ ind |-> 4294, type |-> "FloatMult", r0 |-> "fa4", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x108c8" ],
[ ind |-> 4295, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x108cc" ],
[ ind |-> 4296, type |-> "FloatMult", r0 |-> "fa4", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x108d0" ],
[ ind |-> 4297, type |-> "FloatMemRead", r0 |-> "fa3", r1 |-> "", r2 |-> "", addr |-> "0x108d4" ],
[ ind |-> 4298, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x108d8" ],
[ ind |-> 4299, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x108dc" ],
[ ind |-> 4300, type |-> "FloatMult", r0 |-> "fa3", r1 |-> "fa3", r2 |-> "fa5", addr |-> "0x108e0" ],
[ ind |-> 4301, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x108e4" ],
[ ind |-> 4302, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa3", r2 |-> "fa5", addr |-> "0x108e8" ],
[ ind |-> 4303, type |-> "FloatAdd", r0 |-> "fa4", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x108ec" ],
[ ind |-> 4304, type |-> "FloatMemRead", r0 |-> "fa3", r1 |-> "", r2 |-> "", addr |-> "0x108f0" ],
[ ind |-> 4305, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x108f4" ],
[ ind |-> 4306, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x108f8" ],
[ ind |-> 4307, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa3", r2 |-> "fa5", addr |-> "0x108fc" ],
[ ind |-> 4308, type |-> "FloatAdd", r0 |-> "fa4", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x10900" ],
[ ind |-> 4309, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10904" ],
[ ind |-> 4310, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x10908" ],
[ ind |-> 4311, type |-> "FloatDiv", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x1090c" ],
[ ind |-> 4312, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x10910" ],
[ ind |-> 4313, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x10914" ],
[ ind |-> 4314, type |-> "FloatMult", r0 |-> "fa4", r1 |-> "fa5", r2 |-> "fa5", addr |-> "0x10918" ],
[ ind |-> 4315, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x1091c" ],
[ ind |-> 4316, type |-> "FloatMult", r0 |-> "fa3", r1 |-> "fa5", r2 |-> "fa5", addr |-> "0x10920" ],
[ ind |-> 4317, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x10924" ],
[ ind |-> 4318, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa3", r2 |-> "fa5", addr |-> "0x10928" ],
[ ind |-> 4319, type |-> "FloatAdd", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x1092c" ],
[ ind |-> 4320, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x10930" ],
[ ind |-> 4321, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x10934" ],
[ ind |-> 4322, type |-> "FloatCvt", r0 |-> "fa4", r1 |-> "zero", r2 |-> "", addr |-> "0x10938" ],
[ ind |-> 4323, type |-> "FloatCmp", r0 |-> "a5", r1 |-> "fa5", r2 |-> "fa4", addr |-> "0x1093c" ],
[ ind |-> 4324, type |-> "IntAlu", r0 |-> "a5", r1 |-> "zero", r2 |-> "", addr |-> "0x10940" ],
[ ind |-> 4325, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10944" ],
[ ind |-> 4326, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10948" ],
[ ind |-> 4327, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1094a" ],
[ ind |-> 4328, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x1094c" ],
[ ind |-> 4329, type |-> "FloatMult", r0 |-> "fa4", r1 |-> "fa5", r2 |-> "fa5", addr |-> "0x10950" ],
[ ind |-> 4330, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "", r2 |-> "", addr |-> "0x10954" ],
[ ind |-> 4331, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x10958" ],
[ ind |-> 4332, type |-> "FloatMisc", r0 |-> "fa0", r1 |-> "fa5", r2 |-> "fa5", addr |-> "0x1095c" ],
[ ind |-> 4333, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10960" ],
[ ind |-> 4334, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x1232e" ],
[ ind |-> 4335, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x12330" ],
[ ind |-> 4336, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x12332" ],
[ ind |-> 4337, type |-> "FloatMemWrite", r0 |-> "fa0", r1 |-> "", r2 |-> "", addr |-> "0x12334" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_1653060168095681000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_1653060168095682000 == 
"cubic"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_1653060168095683000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4, FloatMemRead |-> 1, FloatMemWrite |-> 1, FloatMult |-> 5, FloatAdd |-> 2, FloatMisc |-> 1, FloatCvt |-> 1, FloatCmp |-> 1, FloatDiv |-> 5 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_1653060168095684000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1653060168095684000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1653060168096685000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Fri May 20 17:22:48 CEST 2022 by benjaminbinder
