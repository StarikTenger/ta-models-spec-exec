---- MODULE MC ----
EXTENDS pipeline_ooo, TLC

\* CONSTANT definitions @modelParameterConstants:0missLat
const_166074749252186000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1mayDMiss
const_166074749252187000 == 
{
374437, 
374503, 
374504
}
----

\* CONSTANT definitions @modelParameterConstants:2N_FU
const_166074749252188000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:3superscal
const_166074749252189000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:4mayIMiss
const_166074749252190000 == 
{}
----

\* CONSTANT definitions @modelParameterConstants:5RSsize
const_166074749252191000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:6program
const_166074749252192000 == 
<<
[ ind |-> 374420, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x109f0" ],
[ ind |-> 374421, type |-> "MemWrite", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x109f2" ],
[ ind |-> 374422, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x109f4" ],
[ ind |-> 374423, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x109f6" ],
[ ind |-> 374424, type |-> "IntAlu", r0 |-> "a5", r1 |-> "", r2 |-> "", addr |-> "0x109f8" ],
[ ind |-> 374425, type |-> "IntAlu", r0 |-> "a0", r1 |-> "a5", r2 |-> "", addr |-> "0x109fc" ],
[ ind |-> 374426, type |-> "IntAlu", r0 |-> "ra", r1 |-> "", r2 |-> "", addr |-> "0x10a00" ],
[ ind |-> 374427, type |-> "IntAlu", r0 |-> "sp", r1 |-> "", r2 |-> "", addr |-> "0x1040c" ],
[ ind |-> 374428, type |-> "MemWrite", r0 |-> "s0", r1 |-> "", r2 |-> "", addr |-> "0x1040e" ],
[ ind |-> 374429, type |-> "MemWrite", r0 |-> "s1", r1 |-> "", r2 |-> "", addr |-> "0x10410" ],
[ ind |-> 374430, type |-> "MemWrite", r0 |-> "s2", r1 |-> "", r2 |-> "", addr |-> "0x10412" ],
[ ind |-> 374431, type |-> "MemWrite", r0 |-> "s3", r1 |-> "", r2 |-> "", addr |-> "0x10414" ],
[ ind |-> 374432, type |-> "MemWrite", r0 |-> "s4", r1 |-> "", r2 |-> "", addr |-> "0x10416" ],
[ ind |-> 374433, type |-> "MemWrite", r0 |-> "s5", r1 |-> "", r2 |-> "", addr |-> "0x10418" ],
[ ind |-> 374434, type |-> "MemWrite", r0 |-> "s6", r1 |-> "", r2 |-> "", addr |-> "0x1041a" ],
[ ind |-> 374435, type |-> "MemWrite", r0 |-> "s7", r1 |-> "", r2 |-> "", addr |-> "0x1041c" ],
[ ind |-> 374436, type |-> "MemWrite", r0 |-> "s8", r1 |-> "", r2 |-> "", addr |-> "0x1041e" ],
[ ind |-> 374437, type |-> "MemWrite", r0 |-> "s9", r1 |-> "", r2 |-> "", addr |-> "0x10420" ],
[ ind |-> 374438, type |-> "MemWrite", r0 |-> "s10", r1 |-> "", r2 |-> "", addr |-> "0x10422" ],
[ ind |-> 374439, type |-> "MemWrite", r0 |-> "s11", r1 |-> "", r2 |-> "", addr |-> "0x10424" ],
[ ind |-> 374440, type |-> "IntAlu", r0 |-> "s0", r1 |-> "sp", r2 |-> "", addr |-> "0x10426" ],
[ ind |-> 374441, type |-> "IntAlu", r0 |-> "a5", r1 |-> "a0", r2 |-> "", addr |-> "0x10428" ],
[ ind |-> 374442, type |-> "IntAlu", r0 |-> "s1", r1 |-> "", r2 |-> "", addr |-> "0x1042a" ],
[ ind |-> 374443, type |-> "IntAlu", r0 |-> "s7", r1 |-> "", r2 |-> "", addr |-> "0x1042c" ],
[ ind |-> 374444, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1042e" ],
[ ind |-> 374445, type |-> "IntAlu", r0 |-> "s9", r1 |-> "a4", r2 |-> "", addr |-> "0x10430" ],
[ ind |-> 374446, type |-> "IntAlu", r0 |-> "s4", r1 |-> "", r2 |-> "", addr |-> "0x10434" ],
[ ind |-> 374447, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x10436" ],
[ ind |-> 374448, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s9", r2 |-> "", addr |-> "0x104ca" ],
[ ind |-> 374449, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x104ce" ],
[ ind |-> 374450, type |-> "IntAlu", r0 |-> "a3", r1 |-> "s4", r2 |-> "", addr |-> "0x104d0" ],
[ ind |-> 374451, type |-> "IntAlu", r0 |-> "a3", r1 |-> "a4", r2 |-> "", addr |-> "0x104d2" ],
[ ind |-> 374452, type |-> "IntAlu", r0 |-> "a3", r1 |-> "s1", r2 |-> "", addr |-> "0x10438" ],
[ ind |-> 374453, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s4", r2 |-> "", addr |-> "0x1043a" ],
[ ind |-> 374454, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a3", r2 |-> "", addr |-> "0x1043c" ],
[ ind |-> 374455, type |-> "IntAlu", r0 |-> "s3", r1 |-> "zero", r2 |-> "", addr |-> "0x10494" ],
[ ind |-> 374456, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x10498" ],
[ ind |-> 374457, type |-> "IntAlu", r0 |-> "a3", r1 |-> "s3", r2 |-> "", addr |-> "0x104aa" ],
[ ind |-> 374458, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x104ac" ],
[ ind |-> 374459, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a3", r2 |-> "", addr |-> "0x104ae" ],
[ ind |-> 374460, type |-> "IntAlu", r0 |-> "a3", r1 |-> "s1", r2 |-> "", addr |-> "0x104b2" ],
[ ind |-> 374461, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s3", r2 |-> "", addr |-> "0x104b4" ],
[ ind |-> 374462, type |-> "IntAlu", r0 |-> "a3", r1 |-> "a4", r2 |-> "", addr |-> "0x104b6" ],
[ ind |-> 374463, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s1", r2 |-> "s3", addr |-> "0x104ba" ],
[ ind |-> 374464, type |-> "IntAlu", r0 |-> "s1", r1 |-> "a4", r2 |-> "", addr |-> "0x104be" ],
[ ind |-> 374465, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s4", r2 |-> "", addr |-> "0x104c2" ],
[ ind |-> 374466, type |-> "IntAlu", r0 |-> "s4", r1 |-> "a4", r2 |-> "", addr |-> "0x104c6" ],
[ ind |-> 374467, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s9", r2 |-> "", addr |-> "0x104ca" ],
[ ind |-> 374468, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x104ce" ],
[ ind |-> 374469, type |-> "IntAlu", r0 |-> "a3", r1 |-> "s4", r2 |-> "", addr |-> "0x104d0" ],
[ ind |-> 374470, type |-> "IntAlu", r0 |-> "a3", r1 |-> "a4", r2 |-> "", addr |-> "0x104d2" ],
[ ind |-> 374471, type |-> "IntAlu", r0 |-> "a3", r1 |-> "s1", r2 |-> "", addr |-> "0x10438" ],
[ ind |-> 374472, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s4", r2 |-> "", addr |-> "0x1043a" ],
[ ind |-> 374473, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a3", r2 |-> "", addr |-> "0x1043c" ],
[ ind |-> 374474, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s1", r2 |-> "", addr |-> "0x10440" ],
[ ind |-> 374475, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10442" ],
[ ind |-> 374476, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10444" ],
[ ind |-> 374477, type |-> "MemRead", r0 |-> "s2", r1 |-> "", r2 |-> "", addr |-> "0x10446" ],
[ ind |-> 374478, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s4", r2 |-> "", addr |-> "0x1044a" ],
[ ind |-> 374479, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1044c" ],
[ ind |-> 374480, type |-> "IntAlu", r0 |-> "a3", r1 |-> "a5", r2 |-> "a4", addr |-> "0x1044e" ],
[ ind |-> 374481, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s1", r2 |-> "", addr |-> "0x10452" ],
[ ind |-> 374482, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10454" ],
[ ind |-> 374483, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10456" ],
[ ind |-> 374484, type |-> "MemRead", r0 |-> "a3", r1 |-> "", r2 |-> "", addr |-> "0x10458" ],
[ ind |-> 374485, type |-> "MemWrite", r0 |-> "a3", r1 |-> "", r2 |-> "", addr |-> "0x1045a" ],
[ ind |-> 374486, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s4", r2 |-> "", addr |-> "0x1045c" ],
[ ind |-> 374487, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1045e" ],
[ ind |-> 374488, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10460" ],
[ ind |-> 374489, type |-> "MemWrite", r0 |-> "s2", r1 |-> "", r2 |-> "", addr |-> "0x10462" ],
[ ind |-> 374490, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s1", r2 |-> "", addr |-> "0x10466" ],
[ ind |-> 374491, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10468" ],
[ ind |-> 374492, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1046a" ],
[ ind |-> 374493, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x1046c" ],
[ ind |-> 374494, type |-> "MemRead", r0 |-> "s2", r1 |-> "", r2 |-> "", addr |-> "0x1046e" ],
[ ind |-> 374495, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s4", r2 |-> "", addr |-> "0x10472" ],
[ ind |-> 374496, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10474" ],
[ ind |-> 374497, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10476" ],
[ ind |-> 374498, type |-> "IntAlu", r0 |-> "a3", r1 |-> "a5", r2 |-> "a4", addr |-> "0x10478" ],
[ ind |-> 374499, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s1", r2 |-> "", addr |-> "0x1047c" ],
[ ind |-> 374500, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1047e" ],
[ ind |-> 374501, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x10480" ],
[ ind |-> 374502, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x10482" ],
[ ind |-> 374503, type |-> "MemRead", r0 |-> "a3", r1 |-> "", r2 |-> "", addr |-> "0x10484" ],
[ ind |-> 374504, type |-> "MemWrite", r0 |-> "a3", r1 |-> "", r2 |-> "", addr |-> "0x10486" ],
[ ind |-> 374505, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s4", r2 |-> "", addr |-> "0x10488" ],
[ ind |-> 374506, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1048a" ],
[ ind |-> 374507, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x1048c" ],
[ ind |-> 374508, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a5", r2 |-> "", addr |-> "0x1048e" ],
[ ind |-> 374509, type |-> "MemWrite", r0 |-> "s2", r1 |-> "", r2 |-> "", addr |-> "0x10490" ],
[ ind |-> 374510, type |-> "IntAlu", r0 |-> "s3", r1 |-> "zero", r2 |-> "", addr |-> "0x10494" ],
[ ind |-> 374511, type |-> "IntAlu", r0 |-> "", r1 |-> "", r2 |-> "", addr |-> "0x10498" ],
[ ind |-> 374512, type |-> "IntAlu", r0 |-> "a3", r1 |-> "s3", r2 |-> "", addr |-> "0x104aa" ],
[ ind |-> 374513, type |-> "IntAlu", r0 |-> "a4", r1 |-> "", r2 |-> "", addr |-> "0x104ac" ],
[ ind |-> 374514, type |-> "IntAlu", r0 |-> "a4", r1 |-> "a3", r2 |-> "", addr |-> "0x104ae" ],
[ ind |-> 374515, type |-> "IntAlu", r0 |-> "a3", r1 |-> "s1", r2 |-> "", addr |-> "0x104b2" ],
[ ind |-> 374516, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s3", r2 |-> "", addr |-> "0x104b4" ],
[ ind |-> 374517, type |-> "IntAlu", r0 |-> "a3", r1 |-> "a4", r2 |-> "", addr |-> "0x104b6" ],
[ ind |-> 374518, type |-> "IntAlu", r0 |-> "a4", r1 |-> "s1", r2 |-> "s3", addr |-> "0x1049a" ],
[ ind |-> 374519, type |-> "IntAlu", r0 |-> "s1", r1 |-> "a4", r2 |-> "", addr |-> "0x1049e" ]
>>
----

\* CONSTANT definitions @modelParameterConstants:7robSize
const_166074749252193000 == 
12
----

\* CONSTANT definitions @modelParameterConstants:8name
const_166074749252194000 == 
"fft-rev"
----

\* CONSTANT definitions @modelParameterConstants:9lat
const_166074749252195000 == 
[ IntAlu |-> 1, MemRead |-> 1, MemWrite |-> 1, IntDiv |-> 4, IntMult |-> 4 ]
----

\* Constant expression definition @modelExpressionEval
const_expr_166074749252196000 == 
Len(program)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_166074749252196000>>)
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_166074749252197000 ==
NoTA(FALSE)
----
=============================================================================
\* Modification History
\* Created Wed Aug 17 16:44:52 CEST 2022 by benjaminbinder
