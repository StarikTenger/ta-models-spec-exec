---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_1660748357643230000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_1660748357643231000 == 
{
6038, 
6088, 
6090, 
6092
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_1660748357643232000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_1660748357643233000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_1660748357643234000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_1660748357643235000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_1660748357643236000 == 
<<
[ ind |-> 6021, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x10678" ],
[ ind |-> 6022, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x1067a" ],
[ ind |-> 6023, type |-> "MemWrite", r0 |-> "s1", r1 |-> "", r2 |-> "", addr |-> "0x1067c" ],
[ ind |-> 6024, type |-> "MemWrite", r0 |-> "s2", r1 |-> "", r2 |-> "", addr |-> "0x1067e" ],
[ ind |-> 6025, type |-> "MemWrite", r0 |-> "s3", r1 |-> "", r2 |-> "", addr |-> "0x10680" ],
[ ind |-> 6026, type |-> "MemWrite", r0 |-> "s4", r1 |-> "", r2 |-> "", addr |-> "0x10682" ],
[ ind |-> 6027, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x10684" ],
[ ind |-> 6028, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10686" ],
[ ind |-> 6029, type |-> "IntAlu", r0 |-> "s1", r1 |-> "a5", r2 |-> "", addr |-> "0x1068a" ],
[ ind |-> 6030, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1068e" ],
[ ind |-> 6031, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x10692" ],
[ ind |-> 6032, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10696" ],
[ ind |-> 6033, type |-> "IntAlu", r0 |-> "s4", r1 |-> "a5", r2 |-> "", addr |-> "0x1069a" ],
[ ind |-> 6034, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1069e" ],
[ ind |-> 6035, type |-> "IntAlu", r0 |-> "s3", r1 |-> "a5", r2 |-> "", addr |-> "0x106a2" ],
[ ind |-> 6036, type |-> "MemWrite", r0 |-> "zero", r1 |-> "", r2 |-> "", addr |-> "0x106a6" ],
[ ind |-> 6037, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x106aa" ],
[ ind |-> 6038, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1075a" ],
[ ind |-> 6039, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x1075e" ],
[ ind |-> 6040, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10762" ],
[ ind |-> 6041, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10764" ],
[ ind |-> 6042, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s4", r2 |-> "", addr |-> "0x106ac" ],
[ ind |-> 6043, type |-> "IntAlu", r0 |-> "s4", r1 |-> "a5", r2 |-> "", addr |-> "0x106ae" ],
[ ind |-> 6044, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x106b2" ],
[ ind |-> 6045, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s1", r2 |-> "", addr |-> "0x106b6" ],
[ ind |-> 6046, type |-> "IntAlu", r0 |-> "s1", r1 |-> "a5", r2 |-> "", addr |-> "0x106b8" ],
[ ind |-> 6047, type |-> "FloatMemRead", r0 |-> "fa3", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x106bc" ],
[ ind |-> 6048, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x106c0" ],
[ ind |-> 6049, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x106c2" ],
[ ind |-> 6050, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x106c6" ],
[ ind |-> 6051, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa3", r2 |-> "fa5", addr |-> "0x106ca" ],
[ ind |-> 6052, type |-> "FloatAdd", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x106ce" ],
[ ind |-> 6053, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "0(s3)", r2 |-> "", addr |-> "0x106d2" ],
[ ind |-> 6054, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(s1)", r2 |-> "", addr |-> "0x106d6" ],
[ ind |-> 6055, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x106da" ],
[ ind |-> 6056, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x106dc" ],
[ ind |-> 6057, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x106e0" ],
[ ind |-> 6058, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x106e4" ],
[ ind |-> 6059, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s3", r2 |-> "", addr |-> "0x106e8" ],
[ ind |-> 6060, type |-> "IntAlu", r0 |-> "s3", r1 |-> "a5", r2 |-> "", addr |-> "0x106ea" ],
[ ind |-> 6061, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x106ee" ],
[ ind |-> 6062, type |-> "FloatAdd", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x106f2" ],
[ ind |-> 6063, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x106f6" ],
[ ind |-> 6064, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s4", r2 |-> "", addr |-> "0x106fa" ],
[ ind |-> 6065, type |-> "IntAlu", r0 |-> "s4", r1 |-> "a5", r2 |-> "", addr |-> "0x106fc" ],
[ ind |-> 6066, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x10700" ],
[ ind |-> 6067, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s1", r2 |-> "", addr |-> "0x10704" ],
[ ind |-> 6068, type |-> "IntAlu", r0 |-> "s1", r1 |-> "a5", r2 |-> "", addr |-> "0x10706" ],
[ ind |-> 6069, type |-> "FloatMemRead", r0 |-> "fa3", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x1070a" ],
[ ind |-> 6070, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x1070e" ],
[ ind |-> 6071, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x10710" ],
[ ind |-> 6072, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x10714" ],
[ ind |-> 6073, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa3", r2 |-> "fa5", addr |-> "0x10718" ],
[ ind |-> 6074, type |-> "FloatAdd", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x1071c" ],
[ ind |-> 6075, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "0(s3)", r2 |-> "", addr |-> "0x10720" ],
[ ind |-> 6076, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s1", r2 |-> "", addr |-> "0x10724" ],
[ ind |-> 6077, type |-> "IntAlu", r0 |-> "s1", r1 |-> "a5", r2 |-> "", addr |-> "0x10726" ],
[ ind |-> 6078, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x1072a" ],
[ ind |-> 6079, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x1072e" ],
[ ind |-> 6080, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x10730" ],
[ ind |-> 6081, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x10734" ],
[ ind |-> 6082, type |-> "FloatMult", r0 |-> "fa4", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x10738" ],
[ ind |-> 6083, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s3", r2 |-> "", addr |-> "0x1073c" ],
[ ind |-> 6084, type |-> "IntAlu", r0 |-> "s3", r1 |-> "a5", r2 |-> "", addr |-> "0x1073e" ],
[ ind |-> 6085, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x10742" ],
[ ind |-> 6086, type |-> "FloatAdd", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x10746" ],
[ ind |-> 6087, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x1074a" ],
[ ind |-> 6088, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1074e" ],
[ ind |-> 6089, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10752" ],
[ ind |-> 6090, type |-> "MemWrite", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10754" ],
[ ind |-> 6091, type |-> "IntAlu", r0 |-> "s1", r1 |-> "", r2 |-> "", addr |-> "0x10758" ],
[ ind |-> 6092, type |-> "MemRead", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x1075a" ],
[ ind |-> 6093, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x1075e" ],
[ ind |-> 6094, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x10762" ],
[ ind |-> 6095, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a4", r2 |-> "", addr |-> "0x10764" ],
[ ind |-> 6096, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s4", r2 |-> "", addr |-> "0x106ac" ],
[ ind |-> 6097, type |-> "IntAlu", r0 |-> "s4", r1 |-> "a5", r2 |-> "", addr |-> "0x106ae" ],
[ ind |-> 6098, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x106b2" ],
[ ind |-> 6099, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s1", r2 |-> "", addr |-> "0x106b6" ],
[ ind |-> 6100, type |-> "IntAlu", r0 |-> "s1", r1 |-> "a5", r2 |-> "", addr |-> "0x106b8" ],
[ ind |-> 6101, type |-> "FloatMemRead", r0 |-> "fa3", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x106bc" ],
[ ind |-> 6102, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x106c0" ],
[ ind |-> 6103, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x106c2" ],
[ ind |-> 6104, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x106c6" ],
[ ind |-> 6105, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa3", r2 |-> "fa5", addr |-> "0x106ca" ],
[ ind |-> 6106, type |-> "FloatAdd", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x106ce" ],
[ ind |-> 6107, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "0(s3)", r2 |-> "", addr |-> "0x106d2" ],
[ ind |-> 6108, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(s1)", r2 |-> "", addr |-> "0x106d6" ],
[ ind |-> 6109, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s2", r2 |-> "", addr |-> "0x106da" ],
[ ind |-> 6110, type |-> "IntAlu", r0 |-> "s2", r1 |-> "a5", r2 |-> "", addr |-> "0x106dc" ],
[ ind |-> 6111, type |-> "FloatMemRead", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x106e0" ],
[ ind |-> 6112, type |-> "FloatMult", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x106e4" ],
[ ind |-> 6113, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s3", r2 |-> "", addr |-> "0x106e8" ],
[ ind |-> 6114, type |-> "IntAlu", r0 |-> "s3", r1 |-> "a5", r2 |-> "", addr |-> "0x106ea" ],
[ ind |-> 6115, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x106ee" ],
[ ind |-> 6116, type |-> "FloatAdd", r0 |-> "fa5", r1 |-> "fa4", r2 |-> "fa5", addr |-> "0x106f2" ],
[ ind |-> 6117, type |-> "FloatMemWrite", r0 |-> "fa5", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x106f6" ],
[ ind |-> 6118, type |-> "IntAlu", r0 |-> "a5", r1 |-> "s4", r2 |-> "", addr |-> "0x106fa" ],
[ ind |-> 6119, type |-> "IntAlu", r0 |-> "s4", r1 |-> "a5", r2 |-> "", addr |-> "0x106fc" ],
[ ind |-> 6120, type |-> "FloatMemRead", r0 |-> "fa4", r1 |-> "0(a5)", r2 |-> "", addr |-> "0x10700" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_1660748357643237000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_1660748357643238000 == 
"complexup-rev"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_1660748357643239000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4, FloatMemRead |-> 1, FloatMemWrite |-> 1, FloatMult |-> 5, FloatAdd |-> 2 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_1660748357643240000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1660748357643240000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1660748357643241000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Wed Aug 17 16:59:17 CEST 2022 by benjaminbinder
