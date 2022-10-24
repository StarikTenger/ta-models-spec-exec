---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_1652800683019398000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_1652800683019399000 == 
{
4181, 
4183, 
4187, 
4189, 
4191
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1652800683019400000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_1652800683019401000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_1652800683019402000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_1652800683019403000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_1652800683019404000 == 
<<
[ ind |-> 4177, type |-> "IntAlu", r0 |-> "sp", r1 |-> "sp", r2 |-> "", targA |-> "" ],
[ ind |-> 4178, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffde8" ],
[ ind |-> 4179, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", targA |-> "" ],
[ ind |-> 4180, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 4181, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffddc" ],
[ ind |-> 4182, type |-> "IntAlu", r0 |-> "zero", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 4183, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffddc" ],
[ ind |-> 4184, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 4185, type |-> "IntAlu", r0 |-> "zero", r1 |-> "a5", r2 |-> "", targA |-> "" ],
[ ind |-> 4186, type |-> "IntAlu", r0 |-> "zero", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 4187, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffddc" ],
[ ind |-> 4188, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 4189, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffddc" ],
[ ind |-> 4190, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 4191, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x6eab0" ],
[ ind |-> 4192, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 4193, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", targA |-> "" ],
[ ind |-> 4194, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 4195, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", targA |-> "" ],
[ ind |-> 4196, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 4197, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x6eab0" ],
[ ind |-> 4198, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 4199, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", targA |-> "" ],
[ ind |-> 4200, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 4201, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", targA |-> "" ],
[ ind |-> 4202, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_1652800683019405000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_1652800683019406000 == 
"petrinet"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_1652800683019407000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_1652800683019408000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1652800683019408000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1652800683019409000 ==
NoTA(TRUE)
----
=============================================================================
\* Modification History
\* Created Tue May 17 17:18:03 CEST 2022 by benjaminbinder
