---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_1660749251582278000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_1660749251582279000 == 
{
4180, 
4183, 
4188, 
4205, 
4209, 
4218, 
4219, 
4221, 
4222, 
4225, 
4226, 
4227, 
4229, 
4231, 
4232, 
4236, 
4245, 
4246, 
4248, 
4249, 
4252, 
4253, 
4254, 
4256, 
4258, 
4259, 
4263
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1660749251582280000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_1660749251582281000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_1660749251582282000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_1660749251582283000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_1660749251582284000 == 
<<
[ ind |-> 4174, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x10508" ],
[ ind |-> 4175, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x1050a" ],
[ ind |-> 4176, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x1050c" ],
[ ind |-> 4177, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x1050e" ],
[ ind |-> 4178, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10510" ],
[ ind |-> 4179, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10514" ],
[ ind |-> 4180, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10516" ],
[ ind |-> 4181, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x1051a" ],
[ ind |-> 4182, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1056a" ],
[ ind |-> 4183, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1056e" ],
[ ind |-> 4184, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10572" ],
[ ind |-> 4185, type |-> "IntAlu", r0 |-> "a5", r1 |-> "zero", r2 |-> "", addr |-> "0x10574" ],
[ ind |-> 4186, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10578" ],
[ ind |-> 4187, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1051c" ],
[ ind |-> 4188, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10520" ],
[ ind |-> 4189, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10524" ],
[ ind |-> 4190, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10526" ],
[ ind |-> 4191, type |-> "IntAlu", r0 |-> "a1", r1 |-> "a5", r2 |-> "", addr |-> "0x1052a" ],
[ ind |-> 4192, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a4", r2 |-> "", addr |-> "0x1052e" ],
[ ind |-> 4193, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10530" ],
[ ind |-> 4194, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x10458" ],
[ ind |-> 4195, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x1045a" ],
[ ind |-> 4196, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x1045c" ],
[ ind |-> 4197, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x1045e" ],
[ ind |-> 4198, type |-> "MemWrite", r0 |-> "a0", r1 |-> "", r2 |-> "", addr |-> "0x10460" ],
[ ind |-> 4199, type |-> "MemWrite", r0 |-> "a1", r1 |-> "", r2 |-> "", addr |-> "0x10464" ],
[ ind |-> 4200, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x10468" ],
[ ind |-> 4201, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x1046c" ],
[ ind |-> 4202, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x10470" ],
[ ind |-> 4203, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x10474" ],
[ ind |-> 4204, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x10478" ],
[ ind |-> 4205, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104e0" ],
[ ind |-> 4206, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x104e4" ],
[ ind |-> 4207, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104e8" ],
[ ind |-> 4208, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x104ea" ],
[ ind |-> 4209, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1047a" ],
[ ind |-> 4210, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x1047e" ],
[ ind |-> 4211, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10482" ],
[ ind |-> 4212, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10486" ],
[ ind |-> 4213, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10488" ],
[ ind |-> 4214, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x1048a" ],
[ ind |-> 4215, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1048c" ],
[ ind |-> 4216, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10490" ],
[ ind |-> 4217, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10494" ],
[ ind |-> 4218, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10496" ],
[ ind |-> 4219, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1049a" ],
[ ind |-> 4220, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1049e" ],
[ ind |-> 4221, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104a0" ],
[ ind |-> 4222, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104a4" ],
[ ind |-> 4223, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104a8" ],
[ ind |-> 4224, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104aa" ],
[ ind |-> 4225, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104ac" ],
[ ind |-> 4226, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x104b0" ],
[ ind |-> 4227, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104b4" ],
[ ind |-> 4228, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x104b8" ],
[ ind |-> 4229, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104d6" ],
[ ind |-> 4230, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104da" ],
[ ind |-> 4231, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104dc" ],
[ ind |-> 4232, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104e0" ],
[ ind |-> 4233, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x104e4" ],
[ ind |-> 4234, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104e8" ],
[ ind |-> 4235, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x104ea" ],
[ ind |-> 4236, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1047a" ],
[ ind |-> 4237, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x1047e" ],
[ ind |-> 4238, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10482" ],
[ ind |-> 4239, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10486" ],
[ ind |-> 4240, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10488" ],
[ ind |-> 4241, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x1048a" ],
[ ind |-> 4242, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1048c" ],
[ ind |-> 4243, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10490" ],
[ ind |-> 4244, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10494" ],
[ ind |-> 4245, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10496" ],
[ ind |-> 4246, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1049a" ],
[ ind |-> 4247, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1049e" ],
[ ind |-> 4248, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104a0" ],
[ ind |-> 4249, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104a4" ],
[ ind |-> 4250, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104a8" ],
[ ind |-> 4251, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104aa" ],
[ ind |-> 4252, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104ac" ],
[ ind |-> 4253, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x104b0" ],
[ ind |-> 4254, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104b4" ],
[ ind |-> 4255, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x104b8" ],
[ ind |-> 4256, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104d6" ],
[ ind |-> 4257, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104da" ],
[ ind |-> 4258, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104dc" ],
[ ind |-> 4259, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104e0" ],
[ ind |-> 4260, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x104e4" ],
[ ind |-> 4261, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104e8" ],
[ ind |-> 4262, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x104ea" ],
[ ind |-> 4263, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1047a" ],
[ ind |-> 4264, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x1047e" ],
[ ind |-> 4265, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10482" ],
[ ind |-> 4266, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10486" ],
[ ind |-> 4267, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10488" ],
[ ind |-> 4268, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x1048a" ],
[ ind |-> 4269, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1048c" ],
[ ind |-> 4270, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10490" ],
[ ind |-> 4271, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10494" ],
[ ind |-> 4272, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10496" ],
[ ind |-> 4273, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1049a" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_1660749251582285000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_1660749251582286000 == 
"isqrt-rev"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_1660749251582287000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_1660749251583288000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1660749251583288000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1660749251583289000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Wed Aug 17 17:14:11 CEST 2022 by benjaminbinder
