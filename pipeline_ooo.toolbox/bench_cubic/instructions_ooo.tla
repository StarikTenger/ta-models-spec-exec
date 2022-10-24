---------------------------- MODULE instructions_ooo ----------------------------
EXTENDS Integers, Sequences, FiniteSets
CONSTANTS program, superscal, N_FU, mayIMiss, mayDMiss, lat, missLat, robSize, RSsize, name
ASSUME robSize%superscal = 0
ASSUME \A t \in {program[i].type: i \in DOMAIN program}: t \in DOMAIN lat
----------------------------------------------------------------------------

Min(S) == IF S = {} THEN 0 ELSE CHOOSE x \in S : \A y \in S : y >= x
Max(S) == IF S = {} THEN 0 ELSE CHOOSE x \in S : \A y \in S : y <= x

Empty == [ ind |-> 0, addr |-> "", type |-> "No_OpClass", r0 |-> "", r1 |-> "", r2 |-> ""]
NotEmpty(instr) == instr.type /= "No_OpClass"

ProgLen == Len(program)
Instr(pc) == IF ProgLen >= pc THEN program[pc] ELSE Empty
=============================================================================
