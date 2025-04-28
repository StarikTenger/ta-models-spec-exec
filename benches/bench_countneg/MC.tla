---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_166317822428838000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_166317822428839000 == 
{
23626,
23649, 
23653, 
23661
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_166317822428840000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_166317822428841000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_166317822428842000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_166317822428843000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_166317822428844000 == 
<<
[ ind |-> 23616, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x1065e" ],
[ ind |-> 23617, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10660" ],
[ ind |-> 23618, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x10662" ],
[ ind |-> 23619, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x10664" ],
[ ind |-> 23620, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10666" ],
[ ind |-> 23621, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", addr |-> "0x1066a" ],
[ ind |-> 23622, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x1066e" ],
[ ind |-> 23623, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x10560" ],
[ ind |-> 23624, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x10562" ],
[ ind |-> 23625, type |-> "MemWrite", r0 |-> "s1", r1 |-> "", r2 |-> "", addr |-> "0x10564" ],
[ ind |-> 23626, type |-> "MemWrite", r0 |-> "s2", r1 |-> "", r2 |-> "", addr |-> "0x10566" ],
[ ind |-> 23627, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x10568" ],
[ ind |-> 23628, type |-> "MemWrite", r0 |-> "a0", r1 |-> "", r2 |-> "", addr |-> "0x1056a" ],
[ ind |-> 23629, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x1056e" ],
[ ind |-> 23630, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x10572" ],
[ ind |-> 23631, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x10576" ],
[ ind |-> 23632, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x1057a" ],
[ ind |-> 23633, type |-> "IntAlu", r0 |-> "s2", r1 |-> "", r2 |-> "", addr |-> "0x1057e" ],
[ ind |-> 23634, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x10580" ],
[ ind |-> 23635, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s2", r2 |-> "", addr |-> "0x1061a" ],
[ ind |-> 23636, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1061c" ],
[ ind |-> 23637, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x1061e" ],
[ ind |-> 23638, type |-> "IntAlu", r0 |-> "s1", r1 |-> "", r2 |-> "", addr |-> "0x10582" ],
[ ind |-> 23639, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x10584" ],
[ ind |-> 23640, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s1", r2 |-> "", addr |-> "0x1060a" ],
[ ind |-> 23641, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1060c" ],
[ ind |-> 23642, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x1060e" ],
[ ind |-> 23643, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s2", r2 |-> "", addr |-> "0x10586" ],
[ ind |-> 23644, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10588" ],
[ ind |-> 23645, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1058a" ],
[ ind |-> 23646, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x1058c" ],
[ ind |-> 23647, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1058e" ],
[ ind |-> 23648, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10590" ],
[ ind |-> 23649, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10592" ],
[ ind |-> 23650, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10596" ],
[ ind |-> 23651, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s1", r2 |-> "", addr |-> "0x10598" ],
[ ind |-> 23652, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x1059c" ],
[ ind |-> 23653, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1059e" ],
[ ind |-> 23654, type |-> "IntAlu", r0 |-> "a5", r1 |-> "zero", r2 |-> "", addr |-> "0x105a0" ],
[ ind |-> 23655, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s2", r2 |-> "", addr |-> "0x105a4" ],
[ ind |-> 23656, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x105a6" ],
[ ind |-> 23657, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105a8" ],
[ ind |-> 23658, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x105aa" ],
[ ind |-> 23659, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105ac" ],
[ ind |-> 23660, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x105ae" ],
[ ind |-> 23661, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105b0" ],
[ ind |-> 23662, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x105b4" ],
[ ind |-> 23663, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s1", r2 |-> "", addr |-> "0x105b6" ],
[ ind |-> 23664, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x105ba" ],
[ ind |-> 23665, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105bc" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_166317822428845000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_166317822428846000 == 
"countneg-s4-final-only"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_166317822428847000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_166317822428848000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_166317822428848000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_166317822428849000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Wed Sep 14 19:57:04 CEST 2022 by benjaminbinder
