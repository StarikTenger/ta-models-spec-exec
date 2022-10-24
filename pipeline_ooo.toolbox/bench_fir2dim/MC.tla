---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_1660605098230740000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_1660605098230741000 == 
{
9795, 
9808, 
9821, 
9834
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1660605098230742000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_1660605098230743000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_1660605098230744000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_1660605098230745000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_1660605098230746000 == 
<<
[ ind |-> 9758, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x1075c" ],
[ ind |-> 9759, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x1075e" ],
[ ind |-> 9760, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x10760" ],
[ ind |-> 9761, type |-> "MemWrite", r0 |-> "s1", r1 |-> "", r2 |-> "", addr |-> "0x10762" ],
[ ind |-> 9762, type |-> "MemWrite", r0 |-> "s2", r1 |-> "", r2 |-> "", addr |-> "0x10764" ],
[ ind |-> 9763, type |-> "MemWrite", r0 |-> "s3", r1 |-> "", r2 |-> "", addr |-> "0x10766" ],
[ ind |-> 9764, type |-> "MemWrite", r0 |-> "s4", r1 |-> "", r2 |-> "", addr |-> "0x10768" ],
[ ind |-> 9765, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x1076a" ],
[ ind |-> 9766, type |-> "IntAlu", r0 |-> "s2", r1 |-> "gp", r2 |-> "", addr |-> "0x1076c" ],
[ ind |-> 9767, type |-> "IntAlu", r0 |-> "s1", r1 |-> "gp", r2 |-> "", addr |-> "0x10770" ],
[ ind |-> 9768, type |-> "IntAlu", r0 |-> "ra", r1 |-> "gp", r2 |-> "", addr |-> "0x10774" ],
[ ind |-> 9769, type |-> "IntAlu", r0 |-> "a3", r1 |-> "gp", r2 |-> "", addr |-> "0x10778" ],
[ ind |-> 9770, type |-> "IntAlu", r0 |-> "a2", r1 |-> "gp", r2 |-> "", addr |-> "0x1077c" ],
[ ind |-> 9771, type |-> "IntAlu", r0 |-> "a1", r1 |-> "gp", r2 |-> "", addr |-> "0x10780" ],
[ ind |-> 9772, type |-> "IntAlu", r0 |-> "a0", r1 |-> "gp", r2 |-> "", addr |-> "0x10784" ],
[ ind |-> 9773, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10788" ],
[ ind |-> 9774, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x10588" ],
[ ind |-> 9775, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x1058a" ],
[ ind |-> 9776, type |-> "FloatMemWrite", r0 |-> "fs0", r1 |-> "40(sp)", r2 |-> "", addr |-> "0x1058c" ],
[ ind |-> 9777, type |-> "FloatMemWrite", r0 |-> "fs1", r1 |-> "32(sp)", r2 |-> "", addr |-> "0x1058e" ],
[ ind |-> 9778, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x10590" ],
[ ind |-> 9779, type |-> "MemWrite", r0 |-> "a0", r1 |-> "", r2 |-> "", addr |-> "0x10592" ],
[ ind |-> 9780, type |-> "MemWrite", r0 |-> "a1", r1 |-> "", r2 |-> "", addr |-> "0x10596" ],
[ ind |-> 9781, type |-> "MemWrite", r0 |-> "a2", r1 |-> "", r2 |-> "", addr |-> "0x1059a" ],
[ ind |-> 9782, type |-> "MemWrite", r0 |-> "a3", r1 |-> "", r2 |-> "", addr |-> "0x1059e" ],
[ ind |-> 9783, type |-> "FloatCvt", r0 |-> "fs0", r1 |-> "zero", r2 |-> "", addr |-> "0x105a2" ],
[ ind |-> 9784, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x105a6" ],
[ ind |-> 9785, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105ec" ],
[ ind |-> 9786, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1380(a5)", r2 |-> "", addr |-> "0x105f0" ],
[ ind |-> 9787, type |-> "FloatCmp", r0 |-> "a5", r1 |-> "fs0", r2 |-> "fa5", addr |-> "0x105f4" ],
[ ind |-> 9788, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105f8" ],
[ ind |-> 9789, type |-> "FloatCvt", r0 |-> "fs1", r1 |-> "zero", r2 |-> "", addr |-> "0x105a8" ],
[ ind |-> 9790, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x105ac" ],
[ ind |-> 9791, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105d2" ],
[ ind |-> 9792, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1380(a5)", r2 |-> "", addr |-> "0x105d6" ],
[ ind |-> 9793, type |-> "FloatCmp", r0 |-> "a5", r1 |-> "fs1", r2 |-> "fa5", addr |-> "0x105da" ],
[ ind |-> 9794, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105de" ],
[ ind |-> 9795, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105ae" ],
[ ind |-> 9796, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x105b2" ],
[ ind |-> 9797, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x105b6" ],
[ ind |-> 9798, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x105ba" ],
[ ind |-> 9799, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1376(a4)", r2 |-> "", addr |-> "0x105be" ],
[ ind |-> 9800, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x105c2" ],
[ ind |-> 9801, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105c6" ],
[ ind |-> 9802, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1376(a5)", r2 |-> "", addr |-> "0x105ca" ],
[ ind |-> 9803, type |-> "FloatAdd", r0 |-> "fs1", r1 |-> "fs1", r2 |-> "fa5", addr |-> "0x105ce" ],
[ ind |-> 9804, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105d2" ],
[ ind |-> 9805, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1380(a5)", r2 |-> "", addr |-> "0x105d6" ],
[ ind |-> 9806, type |-> "FloatCmp", r0 |-> "a5", r1 |-> "fs1", r2 |-> "fa5", addr |-> "0x105da" ],
[ ind |-> 9807, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105de" ],
[ ind |-> 9808, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105ae" ],
[ ind |-> 9809, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x105b2" ],
[ ind |-> 9810, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x105b6" ],
[ ind |-> 9811, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x105ba" ],
[ ind |-> 9812, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1376(a4)", r2 |-> "", addr |-> "0x105be" ],
[ ind |-> 9813, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x105c2" ],
[ ind |-> 9814, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105c6" ],
[ ind |-> 9815, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1376(a5)", r2 |-> "", addr |-> "0x105ca" ],
[ ind |-> 9816, type |-> "FloatAdd", r0 |-> "fs1", r1 |-> "fs1", r2 |-> "fa5", addr |-> "0x105ce" ],
[ ind |-> 9817, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105d2" ],
[ ind |-> 9818, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1380(a5)", r2 |-> "", addr |-> "0x105d6" ],
[ ind |-> 9819, type |-> "FloatCmp", r0 |-> "a5", r1 |-> "fs1", r2 |-> "fa5", addr |-> "0x105da" ],
[ ind |-> 9820, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105de" ],
[ ind |-> 9821, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105ae" ],
[ ind |-> 9822, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x105b2" ],
[ ind |-> 9823, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x105b6" ],
[ ind |-> 9824, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x105ba" ],
[ ind |-> 9825, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1376(a4)", r2 |-> "", addr |-> "0x105be" ],
[ ind |-> 9826, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x105c2" ],
[ ind |-> 9827, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105c6" ],
[ ind |-> 9828, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1376(a5)", r2 |-> "", addr |-> "0x105ca" ],
[ ind |-> 9829, type |-> "FloatAdd", r0 |-> "fs1", r1 |-> "fs1", r2 |-> "fa5", addr |-> "0x105ce" ],
[ ind |-> 9830, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105d2" ],
[ ind |-> 9831, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1380(a5)", r2 |-> "", addr |-> "0x105d6" ],
[ ind |-> 9832, type |-> "FloatCmp", r0 |-> "a5", r1 |-> "fs1", r2 |-> "fa5", addr |-> "0x105da" ],
[ ind |-> 9833, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105de" ],
[ ind |-> 9834, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105ae" ],
[ ind |-> 9835, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x105b2" ],
[ ind |-> 9836, type |-> "MemWrite", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x105b6" ],
[ ind |-> 9837, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x105ba" ],
[ ind |-> 9838, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1376(a4)", r2 |-> "", addr |-> "0x105be" ],
[ ind |-> 9839, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x105c2" ],
[ ind |-> 9840, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105c6" ],
[ ind |-> 9841, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1376(a5)", r2 |-> "", addr |-> "0x105ca" ],
[ ind |-> 9842, type |-> "FloatAdd", r0 |-> "fs1", r1 |-> "fs1", r2 |-> "fa5", addr |-> "0x105ce" ],
[ ind |-> 9843, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105d2" ],
[ ind |-> 9844, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1380(a5)", r2 |-> "", addr |-> "0x105d6" ],
[ ind |-> 9845, type |-> "FloatCmp", r0 |-> "a5", r1 |-> "fs1", r2 |-> "fa5", addr |-> "0x105da" ],
[ ind |-> 9846, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105de" ],
[ ind |-> 9847, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105e0" ],
[ ind |-> 9848, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1376(a5)", r2 |-> "", addr |-> "0x105e4" ],
[ ind |-> 9849, type |-> "FloatAdd", r0 |-> "fs0", r1 |-> "fs0", r2 |-> "fa5", addr |-> "0x105e8" ],
[ ind |-> 9850, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105ec" ],
[ ind |-> 9851, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1380(a5)", r2 |-> "", addr |-> "0x105f0" ],
[ ind |-> 9852, type |-> "FloatCmp", r0 |-> "a5", r1 |-> "fs0", r2 |-> "fa5", addr |-> "0x105f4" ],
[ ind |-> 9853, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105f8" ],
[ ind |-> 9854, type |-> "FloatCvt", r0 |-> "fs1", r1 |-> "zero", r2 |-> "", addr |-> "0x105a8" ],
[ ind |-> 9855, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x105ac" ],
[ ind |-> 9856, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105d2" ],
[ ind |-> 9857, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "1380(a5)", r2 |-> "", addr |-> "0x105d6" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_1660605098230747000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_1660605098230748000 == 
"fir2dim-rev"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_1660605098230749000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4, FloatMemRead |-> 1, FloatMemWrite |-> 1, FloatMult |-> 5, FloatAdd |-> 2, FloatCmp |-> 1, FloatCvt |-> 1 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_1660605098231750000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1660605098231750000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1660605098231751000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Tue Aug 16 01:11:38 CEST 2022 by benjaminbinder
