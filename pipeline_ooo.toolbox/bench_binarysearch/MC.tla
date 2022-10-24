---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_1653048447828122000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_1653048447828123000 == 
{
5450, 
5452, 
5454, 
5455, 
5459, 
5460, 
5464, 
5467, 
5470, 
5471, 
5479
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1653048447828124000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_1653048447828125000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_1653048447828126000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_1653048447828127000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_1653048447828128000 == 
<<
[ ind |-> 5437, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x105b6" ],
[ ind |-> 5438, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x105b8" ],
[ ind |-> 5439, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x105ba" ],
[ ind |-> 5440, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x105bc" ],
[ ind |-> 5441, type |-> "IntAlu", r0 |-> "a0", r1 |-> "", r2 |-> "", addr |-> "0x105be" ],
[ ind |-> 5442, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x105c0" ],
[ ind |-> 5443, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x104f8" ],
[ ind |-> 5444, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x104fa" ],
[ ind |-> 5445, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x104fc" ],
[ ind |-> 5446, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a0", r2 |-> "", addr |-> "0x104fe" ],
[ ind |-> 5447, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10500" ],
[ ind |-> 5448, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x10504" ],
[ ind |-> 5449, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10508" ],
[ ind |-> 5450, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1050a" ],
[ ind |-> 5451, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1050e" ],
[ ind |-> 5452, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10510" ],
[ ind |-> 5453, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x10514" ],
[ ind |-> 5454, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1059a" ],
[ ind |-> 5455, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1059e" ],
[ ind |-> 5456, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x105a2" ],
[ ind |-> 5457, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105a4" ],
[ ind |-> 5458, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x105a6" ],
[ ind |-> 5459, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10516" ],
[ ind |-> 5460, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1051a" ],
[ ind |-> 5461, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x1051e" ],
[ ind |-> 5462, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10520" ],
[ ind |-> 5463, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a5", r2 |-> "", addr |-> "0x10522" ],
[ ind |-> 5464, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10526" ],
[ ind |-> 5465, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1052a" ],
[ ind |-> 5466, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x1052e" ],
[ ind |-> 5467, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10532" ],
[ ind |-> 5468, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10536" ],
[ ind |-> 5469, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10538" ],
[ ind |-> 5470, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1053a" ],
[ ind |-> 5471, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1053c" ],
[ ind |-> 5472, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10540" ],
[ ind |-> 5473, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10542" ],
[ ind |-> 5474, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10568" ],
[ ind |-> 5475, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x1056c" ],
[ ind |-> 5476, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10570" ],
[ ind |-> 5477, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10574" ],
[ ind |-> 5478, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10576" ],
[ ind |-> 5479, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10578" ],
[ ind |-> 5480, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1057a" ],
[ ind |-> 5481, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1057e" ],
[ ind |-> 5482, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10580" ],
[ ind |-> 5483, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10584" ],
[ ind |-> 5484, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10588" ],
[ ind |-> 5485, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1058a" ],
[ ind |-> 5486, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x1058e" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_1653048447828129000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_1653048447828130000 == 
"binarysearch"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_1653048447828131000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_1653048447828132000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1653048447828132000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1653048447828133000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Fri May 20 14:07:27 CEST 2022 by benjaminbinder
