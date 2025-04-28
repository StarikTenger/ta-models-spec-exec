---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_16528233002922000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_16528233002923000 == 
{
4167, 
4169, 
4172, 
4180, 
4181, 
4194, 
4199, 
4201, 
4203, 
4205, 
4208, 
4216, 
4217, 
4220, 
4230, 
4231, 
4243, 
4254
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_16528233002924000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_16528233002925000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_16528233002926000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_16528233002927000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_16528233002928000 == 
<<
[ ind |-> 4160, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x10494" ],
[ ind |-> 4161, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10496" ],
[ ind |-> 4162, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x10498" ],
[ ind |-> 4163, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x1049a" ],
[ ind |-> 4164, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x1049c" ],
[ ind |-> 4165, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x104a0" ],
[ ind |-> 4166, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104d0" ],
[ ind |-> 4167, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104d4" ],
[ ind |-> 4168, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x104d8" ],
[ ind |-> 4169, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104dc" ],
[ ind |-> 4170, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104e0" ],
[ ind |-> 4171, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x104e2" ],
[ ind |-> 4172, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104a2" ],
[ ind |-> 4173, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", addr |-> "0x104a6" ],
[ ind |-> 4174, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x104a8" ],
[ ind |-> 4175, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x10454" ],
[ ind |-> 4176, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10456" ],
[ ind |-> 4177, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x10458" ],
[ ind |-> 4178, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x1045a" ],
[ ind |-> 4179, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a0", r2 |-> "", addr |-> "0x1045c" ],
[ ind |-> 4180, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1045e" ],
[ ind |-> 4181, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10462" ],
[ ind |-> 4182, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10466" ],
[ ind |-> 4183, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10468" ],
[ ind |-> 4184, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1046a" ],
[ ind |-> 4185, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x1046c" ],
[ ind |-> 4186, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", addr |-> "0x1048a" ],
[ ind |-> 4187, type |-> "MemRead", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x1048c" ],
[ ind |-> 4188, type |-> "MemRead", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x1048e" ],
[ ind |-> 4189, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x10490" ],
[ ind |-> 4190, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10492" ],
[ ind |-> 4191, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a0", r2 |-> "", addr |-> "0x104ac" ],
[ ind |-> 4192, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x104ae" ],
[ ind |-> 4193, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104b0" ],
[ ind |-> 4194, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104b4" ],
[ ind |-> 4195, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x104b8" ],
[ ind |-> 4196, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x104ba" ],
[ ind |-> 4197, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104be" ],
[ ind |-> 4198, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x104c2" ],
[ ind |-> 4199, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104c6" ],
[ ind |-> 4200, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104ca" ],
[ ind |-> 4201, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104cc" ],
[ ind |-> 4202, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104d0" ],
[ ind |-> 4203, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104d4" ],
[ ind |-> 4204, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x104d8" ],
[ ind |-> 4205, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104dc" ],
[ ind |-> 4206, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104e0" ],
[ ind |-> 4207, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x104e2" ],
[ ind |-> 4208, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104a2" ],
[ ind |-> 4209, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", addr |-> "0x104a6" ],
[ ind |-> 4210, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x104a8" ],
[ ind |-> 4211, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x10454" ],
[ ind |-> 4212, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10456" ],
[ ind |-> 4213, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x10458" ],
[ ind |-> 4214, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x1045a" ],
[ ind |-> 4215, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a0", r2 |-> "", addr |-> "0x1045c" ],
[ ind |-> 4216, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1045e" ],
[ ind |-> 4217, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10462" ],
[ ind |-> 4218, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10466" ],
[ ind |-> 4219, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10468" ],
[ ind |-> 4220, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1046e" ],
[ ind |-> 4221, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10472" ],
[ ind |-> 4222, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10474" ],
[ ind |-> 4223, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", addr |-> "0x10476" ],
[ ind |-> 4224, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10478" ],
[ ind |-> 4225, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x10454" ],
[ ind |-> 4226, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10456" ],
[ ind |-> 4227, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x10458" ],
[ ind |-> 4228, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x1045a" ],
[ ind |-> 4229, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a0", r2 |-> "", addr |-> "0x1045c" ],
[ ind |-> 4230, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1045e" ],
[ ind |-> 4231, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10462" ],
[ ind |-> 4232, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10466" ],
[ ind |-> 4233, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10468" ],
[ ind |-> 4234, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1046a" ],
[ ind |-> 4235, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x1046c" ],
[ ind |-> 4236, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", addr |-> "0x1048a" ],
[ ind |-> 4237, type |-> "MemRead", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x1048c" ],
[ ind |-> 4238, type |-> "MemRead", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x1048e" ],
[ ind |-> 4239, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x10490" ],
[ ind |-> 4240, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10492" ],
[ ind |-> 4241, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a0", r2 |-> "", addr |-> "0x1047c" ],
[ ind |-> 4242, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x1047e" ],
[ ind |-> 4243, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10480" ],
[ ind |-> 4244, type |-> "IntMult", r0 |-> "a5", r1 |-> "a5", r2 |-> "a4", addr |-> "0x10484" ],
[ ind |-> 4245, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10488" ],
[ ind |-> 4246, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", addr |-> "0x1048a" ],
[ ind |-> 4247, type |-> "MemRead", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x1048c" ],
[ ind |-> 4248, type |-> "MemRead", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x1048e" ],
[ ind |-> 4249, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x10490" ],
[ ind |-> 4250, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10492" ],
[ ind |-> 4251, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a0", r2 |-> "", addr |-> "0x104ac" ],
[ ind |-> 4252, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x104ae" ],
[ ind |-> 4253, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104b0" ],
[ ind |-> 4254, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104b4" ],
[ ind |-> 4255, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x104b8" ],
[ ind |-> 4256, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x104ba" ],
[ ind |-> 4257, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104be" ],
[ ind |-> 4258, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x104c2" ],
[ ind |-> 4259, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x104c6" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_16528233002929000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_165282330029210000 == 
"fac"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_165282330029211000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_165282330029312000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_165282330029312000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_165282330029313000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Tue May 17 23:35:00 CEST 2022 by benjaminbinder
