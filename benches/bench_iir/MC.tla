---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_166317848694662000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_166317848694663000 == 
{
6629, 
6670, 
6672, 
6673
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_166317848694664000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_166317848694665000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_166317848694666000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_166317848694667000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_166317848694668000 == 
<<
[ ind |-> 6611, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x1059c" ],
[ ind |-> 6612, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x1059e" ],
[ ind |-> 6613, type |-> "MemWrite", r0 |-> "s1", r1 |-> "", r2 |-> "", addr |-> "0x105a0" ],
[ ind |-> 6614, type |-> "MemWrite", r0 |-> "s2", r1 |-> "", r2 |-> "", addr |-> "0x105a2" ],
[ ind |-> 6615, type |-> "MemWrite", r0 |-> "s3", r1 |-> "", r2 |-> "", addr |-> "0x105a4" ],
[ ind |-> 6616, type |-> "FloatMemWrite", r0 |-> "fs0", r1 |-> "24(sp)", r2 |-> "", addr |-> "0x105a6" ],
[ ind |-> 6617, type |-> "FloatMemWrite", r0 |-> "fs1", r1 |-> "16(sp)", r2 |-> "", addr |-> "0x105a8" ],
[ ind |-> 6618, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x105aa" ],
[ ind |-> 6619, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105ac" ],
[ ind |-> 6620, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x105b0" ],
[ ind |-> 6621, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105b4" ],
[ ind |-> 6622, type |-> "IntAlu", r0 |-> "s1", r1 |-> "a5", r2 |-> "", addr |-> "0x105b8" ],
[ ind |-> 6623, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105bc" ],
[ ind |-> 6624, type |-> "IntAlu", r0 |-> "s3", r1 |-> "a5", r2 |-> "", addr |-> "0x105c0" ],
[ ind |-> 6625, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x105c4" ],
[ ind |-> 6626, type |-> "FloatMemRead", r0 |-> "fs0", r1 |-> "-1376(a5)", r2 |-> "", addr |-> "0x105c8" ],
[ ind |-> 6627, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x105cc" ],
[ ind |-> 6628, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x105d0" ],
[ ind |-> 6629, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1065e" ],
[ ind |-> 6630, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10662" ],
[ ind |-> 6631, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10666" ],
[ ind |-> 6632, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10668" ],
[ ind |-> 6633, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x105d2" ],
[ ind |-> 6634, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x105d4" ],
[ ind |-> 6635, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x105d8" ],
[ ind |-> 6636, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(s1)", r2 |-> "", addr |-> "0x105dc" ],
[ ind |-> 6637, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x105e0" ],
[ ind |-> 6638, type |-> "FloatAdd", r0 |-> "fs1", r1 |-> "fs0", r2 |-> "fa5", addr |-> "0x105e4" ],
[ ind |-> 6639, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x105e8" ],
[ ind |-> 6640, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x105ea" ],
[ ind |-> 6641, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x105ee" ],
[ ind |-> 6642, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(s3)", r2 |-> "", addr |-> "0x105f2" ],
[ ind |-> 6643, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x105f6" ],
[ ind |-> 6644, type |-> "FloatAdd", r0 |-> "fs1", r1 |-> "fs1", r2 |-> "fa5", addr |-> "0x105fa" ],
[ ind |-> 6645, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x105fe" ],
[ ind |-> 6646, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x10600" ],
[ ind |-> 6647, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x10604" ],
[ ind |-> 6648, type |-> "FloatMult", r0 |-> "fs0", r1 |-> "fs1", r2 |-> "fa5", addr |-> "0x10608" ],
[ ind |-> 6649, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x1060c" ],
[ ind |-> 6650, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x1060e" ],
[ ind |-> 6651, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x10612" ],
[ ind |-> 6652, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(s1)", r2 |-> "", addr |-> "0x10616" ],
[ ind |-> 6653, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x1061a" ],
[ ind |-> 6654, type |-> "FloatAdd", r0 |-> "fs0", r1 |-> "fs0", r2 |-> "fa5", addr |-> "0x1061e" ],
[ ind |-> 6655, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x10622" ],
[ ind |-> 6656, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x10624" ],
[ ind |-> 6657, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x10628" ],
[ ind |-> 6658, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(s3)", r2 |-> "", addr |-> "0x1062c" ],
[ ind |-> 6659, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x10630" ],
[ ind |-> 6660, type |-> "FloatAdd", r0 |-> "fs0", r1 |-> "fs0", r2 |-> "fa5", addr |-> "0x10634" ],
[ ind |-> 6661, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s3", r2 |-> "", addr |-> "0x10638" ],
[ ind |-> 6662, type |-> "IntAlu", r0 |-> "s3", r1 |-> "a5", r2 |-> "", addr |-> "0x1063a" ],
[ ind |-> 6663, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(s1)", r2 |-> "", addr |-> "0x1063e" ],
[ ind |-> 6664, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x10642" ],
[ ind |-> 6665, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s1", r2 |-> "", addr |-> "0x10646" ],
[ ind |-> 6666, type |-> "IntAlu", r0 |-> "s1", r1 |-> "a5", r2 |-> "", addr |-> "0x10648" ],
[ ind |-> 6667, type |-> "FloatMemWrite", r0 |-> "fs1", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x1064c" ],
[ ind |-> 6668, type |-> "IntAlu", r0 |-> "s3", r1 |-> "", r2 |-> "", addr |-> "0x10650" ],
[ ind |-> 6669, type |-> "IntAlu", r0 |-> "s1", r1 |-> "", r2 |-> "", addr |-> "0x10652" ],
[ ind |-> 6670, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10654" ],
[ ind |-> 6671, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10658" ],
[ ind |-> 6672, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1065a" ],
[ ind |-> 6673, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1065e" ],
[ ind |-> 6674, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10662" ],
[ ind |-> 6675, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10666" ],
[ ind |-> 6676, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10668" ],
[ ind |-> 6677, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x105d2" ],
[ ind |-> 6678, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x105d4" ],
[ ind |-> 6679, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x105d8" ],
[ ind |-> 6680, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(s1)", r2 |-> "", addr |-> "0x105dc" ],
[ ind |-> 6681, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x105e0" ],
[ ind |-> 6682, type |-> "FloatAdd", r0 |-> "fs1", r1 |-> "fs0", r2 |-> "fa5", addr |-> "0x105e4" ],
[ ind |-> 6683, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x105e8" ],
[ ind |-> 6684, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x105ea" ],
[ ind |-> 6685, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x105ee" ],
[ ind |-> 6686, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(s3)", r2 |-> "", addr |-> "0x105f2" ],
[ ind |-> 6687, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x105f6" ],
[ ind |-> 6688, type |-> "FloatAdd", r0 |-> "fs1", r1 |-> "fs1", r2 |-> "fa5", addr |-> "0x105fa" ],
[ ind |-> 6689, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x105fe" ],
[ ind |-> 6690, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x10600" ],
[ ind |-> 6691, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x10604" ],
[ ind |-> 6692, type |-> "FloatMult", r0 |-> "fs0", r1 |-> "fs1", r2 |-> "fa5", addr |-> "0x10608" ],
[ ind |-> 6693, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x1060c" ],
[ ind |-> 6694, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x1060e" ],
[ ind |-> 6695, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x10612" ],
[ ind |-> 6696, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(s1)", r2 |-> "", addr |-> "0x10616" ],
[ ind |-> 6697, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x1061a" ],
[ ind |-> 6698, type |-> "FloatAdd", r0 |-> "fs0", r1 |-> "fs0", r2 |-> "fa5", addr |-> "0x1061e" ],
[ ind |-> 6699, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x10622" ],
[ ind |-> 6700, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x10624" ],
[ ind |-> 6701, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x10628" ],
[ ind |-> 6702, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(s3)", r2 |-> "", addr |-> "0x1062c" ],
[ ind |-> 6703, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x10630" ],
[ ind |-> 6704, type |-> "FloatAdd", r0 |-> "fs0", r1 |-> "fs0", r2 |-> "fa5", addr |-> "0x10634" ],
[ ind |-> 6705, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s3", r2 |-> "", addr |-> "0x10638" ],
[ ind |-> 6706, type |-> "IntAlu", r0 |-> "s3", r1 |-> "a5", r2 |-> "", addr |-> "0x1063a" ],
[ ind |-> 6707, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(s1)", r2 |-> "", addr |-> "0x1063e" ],
[ ind |-> 6708, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x10642" ],
[ ind |-> 6709, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s1", r2 |-> "", addr |-> "0x10646" ],
[ ind |-> 6710, type |-> "IntAlu", r0 |-> "s1", r1 |-> "a5", r2 |-> "", addr |-> "0x10648" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_166317848694669000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_166317848694670000 == 
"iir-final-only"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_166317848694671000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4, FloatMemRead |-> 1, FloatMemWrite |-> 1, FloatMult |-> 5, FloatAdd |-> 2 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_166317848694672000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_166317848694672000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_166317848694673000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Wed Sep 14 20:01:26 CEST 2022 by benjaminbinder
