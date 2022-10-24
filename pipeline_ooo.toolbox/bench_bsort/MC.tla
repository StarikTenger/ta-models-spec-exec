---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_1659536334589242000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_1659536334589243000 == 
{
5697, 
5698, 
5700, 
5705, 
5706, 
5708, 
5713, 
5716, 
5721, 
5723, 
5727, 
5729, 
5732, 
5734, 
5736, 
5737, 
5738, 
5741, 
5745, 
5747, 
5748, 
5749, 
5752, 
5754, 
5755, 
5756, 
5757, 
5759, 
5760, 
5765, 
5768, 
5773, 
5775, 
5779
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1659536334589244000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_1659536334589245000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_1659536334589246000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_1659536334589247000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_1659536334589248000 == 
<<
[ ind |-> 5687, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x105e2" ],
[ ind |-> 5688, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x105e4" ],
[ ind |-> 5689, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x105e6" ],
[ ind |-> 5690, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x105e8" ],
[ ind |-> 5691, type |-> "IntAlu", r0 |-> "a0", r1 |-> "gp", r2 |-> "", addr |-> "0x105ea" ],
[ ind |-> 5692, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x105ee" ],
[ ind |-> 5693, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x104ee" ],
[ ind |-> 5694, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x104f0" ],
[ ind |-> 5695, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x104f2" ],
[ ind |-> 5696, type |-> "MemWrite", r0 |-> "a0", r1 |-> "", r2 |-> "", addr |-> "0x104f4" ],
[ ind |-> 5697, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x104f8" ],
[ ind |-> 5698, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x104fc" ],
[ ind |-> 5699, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x10500" ],
[ ind |-> 5700, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105c4" ],
[ ind |-> 5701, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x105c8" ],
[ ind |-> 5702, type |-> "IntAlu", r0 |-> "a5", r1 |-> "zero", r2 |-> "", addr |-> "0x105cc" ],
[ ind |-> 5703, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x105d0" ],
[ ind |-> 5704, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10502" ],
[ ind |-> 5705, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10504" ],
[ ind |-> 5706, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x10508" ],
[ ind |-> 5707, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x1050c" ],
[ ind |-> 5708, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1059e" ],
[ ind |-> 5709, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x105a2" ],
[ ind |-> 5710, type |-> "IntAlu", r0 |-> "a5", r1 |-> "zero", r2 |-> "", addr |-> "0x105a6" ],
[ ind |-> 5711, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x105aa" ],
[ ind |-> 5712, type |-> "IntAlu", r0 |-> "a4", r1 |-> "zero", r2 |-> "", addr |-> "0x1050e" ],
[ ind |-> 5713, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10512" ],
[ ind |-> 5714, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "a5", addr |-> "0x10516" ],
[ ind |-> 5715, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x1051a" ],
[ ind |-> 5716, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1051e" ],
[ ind |-> 5717, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10522" ],
[ ind |-> 5718, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10524" ],
[ ind |-> 5719, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10528" ],
[ ind |-> 5720, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1052c" ],
[ ind |-> 5721, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1052e" ],
[ ind |-> 5722, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10532" ],
[ ind |-> 5723, type |-> "MemRead", r0 |-> "a3", r1 |-> "", r2 |-> "", addr |-> "0x10534" ],
[ ind |-> 5724, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10536" ],
[ ind |-> 5725, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1053a" ],
[ ind |-> 5726, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1053c" ],
[ ind |-> 5727, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1053e" ],
[ ind |-> 5728, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10542" ],
[ ind |-> 5729, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10544" ],
[ ind |-> 5730, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a3", r2 |-> "", addr |-> "0x10546" ],
[ ind |-> 5731, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10548" ],
[ ind |-> 5732, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1054c" ],
[ ind |-> 5733, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10550" ],
[ ind |-> 5734, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10552" ],
[ ind |-> 5735, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10556" ],
[ ind |-> 5736, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10558" ],
[ ind |-> 5737, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1055a" ],
[ ind |-> 5738, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1055e" ],
[ ind |-> 5739, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10562" ],
[ ind |-> 5740, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10564" ],
[ ind |-> 5741, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10566" ],
[ ind |-> 5742, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x1056a" ],
[ ind |-> 5743, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1056c" ],
[ ind |-> 5744, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10570" ],
[ ind |-> 5745, type |-> "MemRead", r0 |-> "a3", r1 |-> "", r2 |-> "", addr |-> "0x10572" ],
[ ind |-> 5746, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a3", r2 |-> "", addr |-> "0x10576" ],
[ ind |-> 5747, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10578" ],
[ ind |-> 5748, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1057a" ],
[ ind |-> 5749, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1057c" ],
[ ind |-> 5750, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10580" ],
[ ind |-> 5751, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10582" ],
[ ind |-> 5752, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10584" ],
[ ind |-> 5753, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10588" ],
[ ind |-> 5754, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1058a" ],
[ ind |-> 5755, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1058e" ],
[ ind |-> 5756, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x10590" ],
[ ind |-> 5757, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10594" ],
[ ind |-> 5758, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10598" ],
[ ind |-> 5759, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1059a" ],
[ ind |-> 5760, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1059e" ],
[ ind |-> 5761, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x105a2" ],
[ ind |-> 5762, type |-> "IntAlu", r0 |-> "a5", r1 |-> "zero", r2 |-> "", addr |-> "0x105a6" ],
[ ind |-> 5763, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x105aa" ],
[ ind |-> 5764, type |-> "IntAlu", r0 |-> "a4", r1 |-> "zero", r2 |-> "", addr |-> "0x1050e" ],
[ ind |-> 5765, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10512" ],
[ ind |-> 5766, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "a5", addr |-> "0x10516" ],
[ ind |-> 5767, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x1051a" ],
[ ind |-> 5768, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1051e" ],
[ ind |-> 5769, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10522" ],
[ ind |-> 5770, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10524" ],
[ ind |-> 5771, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10528" ],
[ ind |-> 5772, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1052c" ],
[ ind |-> 5773, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1052e" ],
[ ind |-> 5774, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10532" ],
[ ind |-> 5775, type |-> "MemRead", r0 |-> "a3", r1 |-> "", r2 |-> "", addr |-> "0x10534" ],
[ ind |-> 5776, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10536" ],
[ ind |-> 5777, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1053a" ],
[ ind |-> 5778, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1053c" ],
[ ind |-> 5779, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1053e" ],
[ ind |-> 5780, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10542" ],
[ ind |-> 5781, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10544" ],
[ ind |-> 5782, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a3", r2 |-> "", addr |-> "0x10546" ],
[ ind |-> 5783, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10548" ],
[ ind |-> 5784, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1054c" ],
[ ind |-> 5785, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10550" ],
[ ind |-> 5786, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10552" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_1659536334589249000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_1659536334589250000 == 
"bsort-exp"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_1659536334589251000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4, FloatMemRead |-> 1, FloatMemWrite |-> 1, FloatMult |-> 5, FloatAdd |-> 2 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_1659536334589252000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1659536334589252000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1659536334589253000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Wed Aug 03 16:18:54 CEST 2022 by benjaminbinder
