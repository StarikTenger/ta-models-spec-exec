---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_1652695317680110000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_1652695317680111000 == 
{
128, 
129, 
131, 
132, 
133, 
134, 
135, 
137, 
138, 
141, 
142, 
143, 
22, 
26, 
30, 
31, 
33, 
34, 
38, 
52, 
54, 
76
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1652695317680112000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_1652695317680113000 == 
2
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_1652695317680114000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_1652695317680115000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_1652695317680116000 == 
<<
[ ind |-> 21, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 22, type |-> "IntAlu", r0 |-> "gp", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 23, type |-> "IntAlu", r0 |-> "gp", r1 |-> "gp", r2 |-> "", targA |-> "" ],
[ ind |-> 24, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 25, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a0", r2 |-> "", targA |-> "" ],
[ ind |-> 26, type |-> "IntAlu", r0 |-> "a0", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 27, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a0", r2 |-> "", targA |-> "" ],
[ ind |-> 28, type |-> "MemRead", r0 |-> "a1", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff40" ],
[ ind |-> 29, type |-> "IntAlu", r0 |-> "a2", r1 |-> "sp", r2 |-> "", targA |-> "" ],
[ ind |-> 30, type |-> "IntAlu", r0 |-> "sp", r1 |-> "sp", r2 |-> "", targA |-> "" ],
[ ind |-> 31, type |-> "IntAlu", r0 |-> "a3", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 32, type |-> "IntAlu", r0 |-> "a3", r1 |-> "a3", r2 |-> "", targA |-> "" ],
[ ind |-> 33, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 34, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a4", r2 |-> "", targA |-> "" ],
[ ind |-> 35, type |-> "IntAlu", r0 |-> "a6", r1 |-> "sp", r2 |-> "", targA |-> "" ],
[ ind |-> 36, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 37, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 38, type |-> "IntAlu", r0 |-> "a7", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 39, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff30" ],
[ ind |-> 40, type |-> "MemWrite", r0 |-> "s1", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff28" ],
[ ind |-> 41, type |-> "MemWrite", r0 |-> "s2", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff20" ],
[ ind |-> 42, type |-> "MemWrite", r0 |-> "a2", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffe10" ],
[ ind |-> 43, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff38" ],
[ ind |-> 44, type |-> "IntAlu", r0 |-> "t1", r1 |-> "a7", r2 |-> "", targA |-> "" ],
[ ind |-> 45, type |-> "MemWrite", r0 |-> "a0", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffe18" ],
[ ind |-> 46, type |-> "MemWrite", r0 |-> "a1", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffe08" ],
[ ind |-> 47, type |-> "IntAlu", r0 |-> "s0", r1 |-> "a3", r2 |-> "", targA |-> "" ],
[ ind |-> 48, type |-> "IntAlu", r0 |-> "s1", r1 |-> "a4", r2 |-> "", targA |-> "" ],
[ ind |-> 49, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", targA |-> "" ],
[ ind |-> 50, type |-> "IntAlu", r0 |-> "a2", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 51, type |-> "IntAlu", r0 |-> "t1", r1 |-> "zero", r2 |-> "", targA |-> "" ],
[ ind |-> 52, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffe08" ],
[ ind |-> 53, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", targA |-> "" ],
[ ind |-> 54, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffe10" ],
[ ind |-> 55, type |-> "IntAlu", r0 |-> "a0", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 56, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", targA |-> "" ],
[ ind |-> 57, type |-> "MemWrite", r0 |-> "a2", r1 |-> "", r2 |-> "", targA |-> "0x70ad0" ],
[ ind |-> 58, type |-> "MemWrite", r0 |-> "a0", r1 |-> "", r2 |-> "", targA |-> "0x70c48" ],
[ ind |-> 59, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 60, type |-> "MemWrite", r0 |-> "a6", r1 |-> "", r2 |-> "", targA |-> "0x6afb0" ],
[ ind |-> 61, type |-> "MemRead", r0 |-> "a2", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff58" ],
[ ind |-> 62, type |-> "IntAlu", r0 |-> "a0", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 63, type |-> "IntAlu", r0 |-> "a2", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 64, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 65, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff60" ],
[ ind |-> 66, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 67, type |-> "MemWrite", r0 |-> "a0", r1 |-> "", r2 |-> "", targA |-> "0x75fc0" ],
[ ind |-> 68, type |-> "IntAlu", r0 |-> "a5", r1 |-> "zero", r2 |-> "", targA |-> "" ],
[ ind |-> 69, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 70, type |-> "MemWrite", r0 |-> "s1", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffdf0" ],
[ ind |-> 71, type |-> "IntAlu", r0 |-> "s1", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 72, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x76008" ],
[ ind |-> 73, type |-> "MemWrite", r0 |-> "s3", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffde0" ],
[ ind |-> 74, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd60" ],
[ ind |-> 75, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x70c60" ],
[ ind |-> 76, type |-> "IntAlu", r0 |-> "a6", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 77, type |-> "IntAlu", r0 |-> "a6", r1 |-> "a6", r2 |-> "", targA |-> "" ],
[ ind |-> 78, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd40" ],
[ ind |-> 79, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x6afa0" ],
[ ind |-> 80, type |-> "IntAlu", r0 |-> "t3", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 81, type |-> "IntAlu", r0 |-> "t1", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 82, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd88" ],
[ ind |-> 83, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x6afb8" ],
[ ind |-> 84, type |-> "MemWrite", r0 |-> "s2", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffde8" ],
[ ind |-> 85, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd70" ],
[ ind |-> 86, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x76050" ],
[ ind |-> 87, type |-> "MemWrite", r0 |-> "s4", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffdd8" ],
[ ind |-> 88, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd80" ],
[ ind |-> 89, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x70c58" ],
[ ind |-> 90, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffdf8" ],
[ ind |-> 91, type |-> "IntAlu", r0 |-> "s0", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 92, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd50" ],
[ ind |-> 93, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x70c68" ],
[ ind |-> 94, type |-> "IntAlu", r0 |-> "t6", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 95, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd38" ],
[ ind |-> 96, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x75fc8" ],
[ ind |-> 97, type |-> "IntAlu", r0 |-> "t2", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 98, type |-> "IntAlu", r0 |-> "t0", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 99, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd28" ],
[ ind |-> 100, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x70a98" ],
[ ind |-> 101, type |-> "IntAlu", r0 |-> "a3", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 102, type |-> "MemWrite", r0 |-> "s5", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffdd0" ],
[ ind |-> 103, type |-> "MemWrite", r0 |-> "s6", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffdc8" ],
[ ind |-> 104, type |-> "MemWrite", r0 |-> "s7", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffdc0" ],
[ ind |-> 105, type |-> "MemWrite", r0 |-> "s8", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffdb8" ],
[ ind |-> 106, type |-> "MemWrite", r0 |-> "s10", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffda8" ],
[ ind |-> 107, type |-> "MemWrite", r0 |-> "s11", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffda0" ],
[ ind |-> 108, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd98" ],
[ ind |-> 109, type |-> "MemRead", r0 |-> "s7", r1 |-> "", r2 |-> "", targA |-> "0x76000" ],
[ ind |-> 110, type |-> "MemRead", r0 |-> "s11", r1 |-> "", r2 |-> "", targA |-> "0x76020" ],
[ ind |-> 111, type |-> "MemWrite", r0 |-> "s9", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffdb0" ],
[ ind |-> 112, type |-> "IntAlu", r0 |-> "s10", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 113, type |-> "MemRead", r0 |-> "s9", r1 |-> "", r2 |-> "", targA |-> "0x75fe8" ],
[ ind |-> 114, type |-> "IntAlu", r0 |-> "s8", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 115, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd90" ],
[ ind |-> 116, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd78" ],
[ ind |-> 117, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd68" ],
[ ind |-> 118, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd58" ],
[ ind |-> 119, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd48" ],
[ ind |-> 120, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", targA |-> "0x7ffffffffffffd30" ],
[ ind |-> 121, type |-> "IntAlu", r0 |-> "s6", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 122, type |-> "IntAlu", r0 |-> "s5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 123, type |-> "IntAlu", r0 |-> "t5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 124, type |-> "IntAlu", r0 |-> "a7", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 125, type |-> "IntAlu", r0 |-> "a1", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 126, type |-> "IntAlu", r0 |-> "a2", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 127, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 128, type |-> "IntAlu", r0 |-> "a3", r1 |-> "a3", r2 |-> "", targA |-> "" ],
[ ind |-> 129, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 130, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", targA |-> "" ],
[ ind |-> 131, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 132, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a3", r2 |-> "", targA |-> "" ],
[ ind |-> 133, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x4e8d8" ],
[ ind |-> 134, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 135, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff70" ],
[ ind |-> 136, type |-> "IntAlu", r0 |-> "a0", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 137, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 138, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 139, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", targA |-> "" ],
[ ind |-> 140, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 141, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a3", r2 |-> "", targA |-> "" ],
[ ind |-> 142, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x4e8c8" ],
[ ind |-> 143, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 144, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff80" ],
[ ind |-> 145, type |-> "MemRead", r0 |-> "s11", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff78" ],
[ ind |-> 146, type |-> "IntAlu", r0 |-> "s8", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 147, type |-> "IntAlu", r0 |-> "a0", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 148, type |-> "IntAlu", r0 |-> "a5", r1 |-> "zero", r2 |-> "", targA |-> "" ],
[ ind |-> 149, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 150, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", targA |-> "" ],
[ ind |-> 151, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 152, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a3", r2 |-> "", targA |-> "" ],
[ ind |-> 153, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x4e8c4" ],
[ ind |-> 154, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 155, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "0x7fffffffffffff90" ],
[ ind |-> 156, type |-> "IntAlu", r0 |-> "a0", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 157, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 158, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ],
[ ind |-> 159, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", targA |-> "" ],
[ ind |-> 160, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", targA |-> "" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_1652695317680117000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_1652695317680118000 == 
"epic"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_1652695317680119000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_1652695317680120000 == 
Len(program)

----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1652695317680120000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1652695317680121000 ==
NoTA(TRUE)
----
=============================================================================
\* Modification History
\* Created Mon May 16 12:01:57 CEST 2022 by benjaminbinder
