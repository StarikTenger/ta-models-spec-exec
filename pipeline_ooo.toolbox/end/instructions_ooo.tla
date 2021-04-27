---------------------------- MODULE instructions_ooo ----------------------------
EXTENDS Integers, Sequences
CONSTANTS Program

empty == [ pc |-> 0, type |-> "empty" ]

next_instr(p, i) == IF Len(p) > i-1 THEN p[i] ELSE empty

RECURSIVE rest_instr(_,_)
rest_instr(p, n) == LET rest(l) == IF Len(l) > 0 THEN Tail(l) ELSE << >> IN
                    IF n = 1
                    THEN rest(p)
                    ELSE rest_instr(rest(p), n-1)

exec_instr(p, pc) == IF pc.PC /= empty THEN Append(p, pc) ELSE p

=============================================================================
