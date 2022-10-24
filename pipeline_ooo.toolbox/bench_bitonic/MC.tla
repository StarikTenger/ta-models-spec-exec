---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_1660748764650254000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_1660748764650255000 == 
{
4746, 
4748, 
4750, 
4751, 
4752, 
4753, 
4757, 
4758, 
4763, 
4764, 
4776, 
4778, 
4780, 
4781, 
4782, 
4783, 
4787, 
4788, 
4793, 
4794, 
4806, 
4808, 
4810, 
4811, 
4812, 
4813, 
4817, 
4818, 
4823, 
4824
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1660748764650256000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_1660748764650257000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_1660748764650258000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_1660748764650259000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_1660748764650260000 == 
<<
[ ind |-> 4730, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x106c2" ],
[ ind |-> 4731, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x106c4" ],
[ ind |-> 4732, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x106c6" ],
[ ind |-> 4733, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x106c8" ],
[ ind |-> 4734, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x106ca" ],
[ ind |-> 4735, type |-> "IntAlu", r0 |-> "a2", r1 |-> "a5", r2 |-> "", addr |-> "0x106cc" ],
[ ind |-> 4736, type |-> "IntAlu", r0 |-> "a1", r1 |-> "zero", r2 |-> "", addr |-> "0x106ce" ],
[ ind |-> 4737, type |-> "IntAlu", r0 |-> "a0", r1 |-> "", r2 |-> "", addr |-> "0x106d2" ],
[ ind |-> 4738, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x106d4" ],
[ ind |-> 4739, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x1062c" ],
[ ind |-> 4740, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x1062e" ],
[ ind |-> 4741, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x10630" ],
[ ind |-> 4742, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x10632" ],
[ ind |-> 4743, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a0", r2 |-> "", addr |-> "0x10634" ],
[ ind |-> 4744, type |-> "IntAlu", r0 |-> "a3", r1 |-> "a1", r2 |-> "", addr |-> "0x10636" ],
[ ind |-> 4745, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a2", r2 |-> "", addr |-> "0x10638" ],
[ ind |-> 4746, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1063a" ],
[ ind |-> 4747, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a3", r2 |-> "", addr |-> "0x1063e" ],
[ ind |-> 4748, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10640" ],
[ ind |-> 4749, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10644" ],
[ ind |-> 4750, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10646" ],
[ ind |-> 4751, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1064a" ],
[ ind |-> 4752, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1064e" ],
[ ind |-> 4753, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10652" ],
[ ind |-> 4754, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10656" ],
[ ind |-> 4755, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x1065a" ],
[ ind |-> 4756, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a5", r2 |-> "", addr |-> "0x1065c" ],
[ ind |-> 4757, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10660" ],
[ ind |-> 4758, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10664" ],
[ ind |-> 4759, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10668" ],
[ ind |-> 4760, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1066c" ],
[ ind |-> 4761, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x1066e" ],
[ ind |-> 4762, type |-> "IntAlu", r0 |-> "a3", r1 |-> "", r2 |-> "", addr |-> "0x10672" ],
[ ind |-> 4763, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10674" ],
[ ind |-> 4764, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10678" ],
[ ind |-> 4765, type |-> "IntAlu", r0 |-> "a2", r1 |-> "a3", r2 |-> "", addr |-> "0x1067c" ],
[ ind |-> 4766, type |-> "IntAlu", r0 |-> "a1", r1 |-> "a4", r2 |-> "", addr |-> "0x1067e" ],
[ ind |-> 4767, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", addr |-> "0x10680" ],
[ ind |-> 4768, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10682" ],
[ ind |-> 4769, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x1062c" ],
[ ind |-> 4770, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x1062e" ],
[ ind |-> 4771, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x10630" ],
[ ind |-> 4772, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x10632" ],
[ ind |-> 4773, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a0", r2 |-> "", addr |-> "0x10634" ],
[ ind |-> 4774, type |-> "IntAlu", r0 |-> "a3", r1 |-> "a1", r2 |-> "", addr |-> "0x10636" ],
[ ind |-> 4775, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a2", r2 |-> "", addr |-> "0x10638" ],
[ ind |-> 4776, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1063a" ],
[ ind |-> 4777, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a3", r2 |-> "", addr |-> "0x1063e" ],
[ ind |-> 4778, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10640" ],
[ ind |-> 4779, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10644" ],
[ ind |-> 4780, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10646" ],
[ ind |-> 4781, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1064a" ],
[ ind |-> 4782, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1064e" ],
[ ind |-> 4783, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10652" ],
[ ind |-> 4784, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10656" ],
[ ind |-> 4785, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x1065a" ],
[ ind |-> 4786, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a5", r2 |-> "", addr |-> "0x1065c" ],
[ ind |-> 4787, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10660" ],
[ ind |-> 4788, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10664" ],
[ ind |-> 4789, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10668" ],
[ ind |-> 4790, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1066c" ],
[ ind |-> 4791, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x1066e" ],
[ ind |-> 4792, type |-> "IntAlu", r0 |-> "a3", r1 |-> "", r2 |-> "", addr |-> "0x10672" ],
[ ind |-> 4793, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10674" ],
[ ind |-> 4794, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10678" ],
[ ind |-> 4795, type |-> "IntAlu", r0 |-> "a2", r1 |-> "a3", r2 |-> "", addr |-> "0x1067c" ],
[ ind |-> 4796, type |-> "IntAlu", r0 |-> "a1", r1 |-> "a4", r2 |-> "", addr |-> "0x1067e" ],
[ ind |-> 4797, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", addr |-> "0x10680" ],
[ ind |-> 4798, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10682" ],
[ ind |-> 4799, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x1062c" ],
[ ind |-> 4800, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x1062e" ],
[ ind |-> 4801, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x10630" ],
[ ind |-> 4802, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x10632" ],
[ ind |-> 4803, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a0", r2 |-> "", addr |-> "0x10634" ],
[ ind |-> 4804, type |-> "IntAlu", r0 |-> "a3", r1 |-> "a1", r2 |-> "", addr |-> "0x10636" ],
[ ind |-> 4805, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a2", r2 |-> "", addr |-> "0x10638" ],
[ ind |-> 4806, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1063a" ],
[ ind |-> 4807, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a3", r2 |-> "", addr |-> "0x1063e" ],
[ ind |-> 4808, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10640" ],
[ ind |-> 4809, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10644" ],
[ ind |-> 4810, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10646" ],
[ ind |-> 4811, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1064a" ],
[ ind |-> 4812, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1064e" ],
[ ind |-> 4813, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10652" ],
[ ind |-> 4814, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10656" ],
[ ind |-> 4815, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x1065a" ],
[ ind |-> 4816, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a5", r2 |-> "", addr |-> "0x1065c" ],
[ ind |-> 4817, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10660" ],
[ ind |-> 4818, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10664" ],
[ ind |-> 4819, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10668" ],
[ ind |-> 4820, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1066c" ],
[ ind |-> 4821, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x1066e" ],
[ ind |-> 4822, type |-> "IntAlu", r0 |-> "a3", r1 |-> "", r2 |-> "", addr |-> "0x10672" ],
[ ind |-> 4823, type |-> "MemRead", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10674" ],
[ ind |-> 4824, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10678" ],
[ ind |-> 4825, type |-> "IntAlu", r0 |-> "a2", r1 |-> "a3", r2 |-> "", addr |-> "0x1067c" ],
[ ind |-> 4826, type |-> "IntAlu", r0 |-> "a1", r1 |-> "a4", r2 |-> "", addr |-> "0x1067e" ],
[ ind |-> 4827, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", addr |-> "0x10680" ],
[ ind |-> 4828, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10682" ],
[ ind |-> 4829, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x1062c" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_1660748764650261000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_1660748764650262000 == 
"bitonic-rev"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_1660748764650263000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_1660748764650264000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1660748764650264000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1660748764650265000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Wed Aug 17 17:06:04 CEST 2022 by benjaminbinder
