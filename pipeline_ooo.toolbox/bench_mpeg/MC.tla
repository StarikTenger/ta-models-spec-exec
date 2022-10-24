---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_1652717202568302000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_1652717202568303000 == 
{
129, 
130, 
132, 
133, 
134, 
135, 
136, 
138, 
139, 
142, 
143, 
144, 
23, 
27, 
31, 
32, 
34, 
35, 
39, 
53, 
55, 
77
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1652717202568304000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_1652717202568305000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_1652717202568306000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_1652717202568307000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_1652717202568308000 == 
<<
[ ind |-> 22, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 23, type |-> "IntAlu", r0 |-> "gp", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 24, type |-> "IntAlu", r0 |-> "gp", r1 |-> "gp", r2 |-> "", targA |-> "" ],
[ ind |-> 25, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 26, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a0", r2 |-> "", targA |-> "" ],
[ ind |-> 27, type |-> "IntAlu", r0 |-> "a0", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 28, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a0", r2 |-> "", targA |-> "" ],
[ ind |-> 29, type |-> "MemRead", r0 |-> "a1", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff40" ],
[ ind |-> 30, type |-> "IntAlu", r0 |-> "a2", r1 |-> "sp", r2 |-> "", targA |-> "" ],
[ ind |-> 31, type |-> "IntAlu", r0 |-> "sp", r1 |-> "sp", r2 |-> "", targA |-> "" ],
[ ind |-> 32, type |-> "IntAlu", r0 |-> "a3", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 33, type |-> "IntAlu", r0 |-> "a3", r1 |-> "a3", r2 |-> "", targA |-> "" ],
[ ind |-> 34, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 35, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a4", r2 |-> "", targA |-> "" ],
[ ind |-> 36, type |-> "IntAlu", r0 |-> "a6", r1 |-> "sp", r2 |-> "", targA |-> "" ],
[ ind |-> 37, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 38, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 39, type |-> "IntAlu", r0 |-> "a7", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 40, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff30" ],
[ ind |-> 41, type |-> "MemWrite", r0 |-> "s1", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff28" ],
[ ind |-> 42, type |-> "MemWrite", r0 |-> "s2", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff20" ],
[ ind |-> 43, type |-> "MemWrite", r0 |-> "a2", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffe10" ],
[ ind |-> 44, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff38" ],
[ ind |-> 45, type |-> "IntAlu", r0 |-> "t1", r1 |-> "a7", r2 |-> "", targA |-> "" ],
[ ind |-> 46, type |-> "MemWrite", r0 |-> "a0", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffe18" ],
[ ind |-> 47, type |-> "MemWrite", r0 |-> "a1", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffe08" ],
[ ind |-> 48, type |-> "IntAlu", r0 |-> "s0", r1 |-> "a3", r2 |-> "", targA |-> "" ],
[ ind |-> 49, type |-> "IntAlu", r0 |-> "s1", r1 |-> "a4", r2 |-> "", targA |-> "" ],
[ ind |-> 50, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", targA |-> "" ],
[ ind |-> 51, type |-> "IntAlu", r0 |-> "a2", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 52, type |-> "IntAlu", r0 |-> "t1", r1 |-> "zero", r2 |-> "", targA |-> "" ],
[ ind |-> 53, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffe08" ],
[ ind |-> 54, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", targA |-> "" ],
[ ind |-> 55, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffe10" ],
[ ind |-> 56, type |-> "IntAlu", r0 |-> "a0", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 57, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", targA |-> "" ],
[ ind |-> 58, type |-> "MemWrite", r0 |-> "a2", r1 |-> "", r2 |-> "", targA |-> "0x86a70" ],
[ ind |-> 59, type |-> "MemWrite", r0 |-> "a0", r1 |-> "", r2 |-> "", targA |-> "0x86bf0" ],
[ ind |-> 60, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 61, type |-> "MemWrite", r0 |-> "a6", r1 |-> "", r2 |-> "", targA |-> "0x6efb0" ],
[ ind |-> 62, type |-> "MemRead", r0 |-> "a2", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff58" ],
[ ind |-> 63, type |-> "IntAlu", r0 |-> "a0", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 64, type |-> "IntAlu", r0 |-> "a2", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 65, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 66, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff60" ],
[ ind |-> 67, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 68, type |-> "MemWrite", r0 |-> "a0", r1 |-> "", r2 |-> "", targA |-> "0x90328" ],
[ ind |-> 69, type |-> "IntAlu", r0 |-> "a5", r1 |-> "zero", r2 |-> "", targA |-> "" ],
[ ind |-> 70, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 71, type |-> "MemWrite", r0 |-> "s1", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffdf0" ],
[ ind |-> 72, type |-> "IntAlu", r0 |-> "s1", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 73, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x90370" ],
[ ind |-> 74, type |-> "MemWrite", r0 |-> "s3", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffde0" ],
[ ind |-> 75, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd60" ],
[ ind |-> 76, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x86c08" ],
[ ind |-> 77, type |-> "IntAlu", r0 |-> "a6", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 78, type |-> "IntAlu", r0 |-> "a6", r1 |-> "a6", r2 |-> "", targA |-> "" ],
[ ind |-> 79, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd40" ],
[ ind |-> 80, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x6efa0" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_1652717202568309000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_1652717202568310000 == 
"mpeg_1tr_onlyCom"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_1652717202568311000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_1652717202569312000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1652717202569312000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1652717202569313000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Mon May 16 18:06:42 CEST 2022 by benjaminbinder
