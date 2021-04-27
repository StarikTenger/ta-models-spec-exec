---------------------------- MODULE pipeline_exec_ooo ----------------------------
EXTENDS Sequences, instructions_ooo, Integers, TLC, FiniteSets
CONSTANTS varIF, missLat, superscal, N_FU
VARIABLES currCycle, prog, _IF, _ID, _RS, _FU, _COM, iMiss, iMissTmp, FU, FUTmp, FULat, FUTmpLat \*, IFBus
-----------------------------------------------------------------------------
pipe_stages == << _IF, _ID, _RS, _FU, _COM >> \* TODO: MEM

Min(S) == IF S = {} THEN 0 ELSE CHOOSE x \in S: \A y \in S: y >= x
-----------------------------------------------------------------------------
Init == /\ currCycle = 0
        /\ prog = [ rest |-> Program, exec |-> << >> ]
        /\ _IF = [ i \in (1..superscal) |-> [ PC |-> empty, baseLat |-> 1, currLat |-> 1 ] ]
        /\ _ID = [ i \in (1..superscal) |-> [ PC |-> empty ] ]
        /\ _RS = [ i \in (1..N_FU) |-> {} ]
        /\ _FU = [ i \in (1..N_FU) |-> [ PC |-> empty, baseLat |-> 1, currLat |-> 1 ] ]
        /\ _COM = [ i \in (1..superscal) |-> [ PC |-> empty ] ]
        \*/\ IFBus = FALSE

NxtIFBusy == \E i \in 1..superscal: _IF[i].currLat < _IF[i].baseLat \* A I-cache miss stalls each pipeline
NxtFUBusy(i) == _FU[i].currLat < _FU[i].baseLat

\* Set of (indexes of) instructions fully executed or about to finish execution
Exec == { i \in 1..Len(prog.exec): \/ prog.exec[i].executed
                                   \/ \E j \in 1..N_FU: prog.exec[i].PC = _FU[j].PC /\ ~NxtFUBusy(j) }
\* Set of (indexes of) instructions committed or about to leave the pipeline
Done == { i \in 1..Len(prog.exec): \/ prog.exec[i].done
                                   \/ \E j \in 1..superscal: prog.exec[i].PC = _COM[j].PC }

NxtFU(i) == IF NxtFUBusy(i)
            THEN _FU[i].PC
            ELSE
                \* If existing, older instruction (in program order) among the set of the waiting instructions (in the corresponding RS)
                \* whose all dependencies are satisfied (executed) or about to be.
                \* One instruction issued per cycle.
                LET minReady == Min({ x.pc: x \in { y \in _RS[i]: \A z \in y.dep: z \in Exec } }) IN
                IF minReady = 0 THEN empty ELSE CHOOSE x \in _RS[i]: x.pc = minReady

\* Fetch & Decode (in-order)
ProgressIF == LET nxt(i) == next_instr(prog.rest, i) IN
              LET cacheHit(i) == nxt(i) = empty \/ (nxt(i) /= empty /\ ~iMiss[nxt(i).pc]) IN
              LET cacheMiss(i) == nxt(i) /= empty /\ iMiss[nxt(i).pc] IN
              LET IFp(i) == IF ~NxtIFBusy /\ cacheHit(i)
                            THEN [ PC |-> nxt(i), baseLat |-> 1, currLat |-> 1 ]
                            ELSE IF ~NxtIFBusy /\ cacheMiss(i) THEN [ PC |-> nxt(i), baseLat |-> missLat, currLat |-> 1 ]
                            ELSE [ _IF[i] EXCEPT !.currLat = _IF[i].currLat+1 ]
                            \* Warning: hit // miss => stalling
              (*LET IFBusp(i) == IF cacheHit(i)
                            THEN FALSE
                            ELSE IF cacheMiss(i) THEN TRUE
                            ELSE IFBus*)
              IN _IF' = [ i \in (1..superscal) |-> IFp(i) ]

ProgressID == LET nxtPc(i) == IF ~NxtIFBusy THEN _IF[i].PC ELSE empty IN
              _ID' = [ i \in (1..superscal) |-> [ PC |-> nxtPc(i) ] ]

\* Dispatch (in-order)
ProgressRS == LET restRS(i) == _RS[i] \ { NxtFU(i) } IN \* Instructions in RSs are erased when beginning execution
              LET nxtPC(j) == _ID[j].PC IN \* TODO: RS full => structural hazard
              _RS' = [ i \in (1..N_FU) |-> restRS(i)
                                           \union
                                           \* The decoded instructions to go into the i-th RS, i.e., to be executed in the i-th FU.
                                           \* There can be none or several per cycle.
                                           { nxtPC(j): j \in { k \in 1..superscal: nxtPC(k) /= empty /\ FU[nxtPC(k).pc] = i } }
                     ]

\* OoO execution
ProgressFU == LET FUp(i) == IF ~NxtFUBusy(i)
                            THEN
                                IF NxtFU(i) = empty
                                THEN [ PC |-> empty, baseLat |-> 1, currLat |-> 1 ]
                                ELSE [ PC |-> NxtFU(i), baseLat |-> FULat[NxtFU(i).pc], currLat |-> 1 ]
                            ELSE [ _FU[i] EXCEPT !.currLat = _FU[i].currLat+1 ]
              IN _FU' = [ i \in (1..N_FU) |-> FUp(i) ]

\* (Multiple) in-order commit
RECURSIVE nxtCOM(_)
nxtCOM(s) ==  \* The set of (indexes of) instructions *potentially* ready for in-order commit (ROB)
              \* i.e., whose all previous instructions (in program order) either have been committed/are about to leave the pipeline
              \* or are about to be committed in the same cycle.
              LET ReadyInOrder(DoneCOM) == { j \in 1..Len(prog.exec):
                                              \A k \in 1..Len(prog.exec): \* Actually instructions in prog.exec should be stored in-order...
                                              prog.exec[k].PC.pc < prog.exec[j].PC.pc => k \in DoneCOM
                                            } IN
              \* The set of PCs of the instructions that are:
              \*    - executed or about to finish execution
              \*    - ready for in-order commit
              \*    - not already committed
              LET ready(DoneCOM) == { prog.exec[i].PC.pc: i \in (Exec \intersect ReadyInOrder(DoneCOM)) \ Done } IN
              IF s = 1
              \* The index of the oldest instruction among the instructions indeed ready for in-order commit
              THEN LET min == Min(ready(Done)) IN
                IF min /= 0 THEN CHOOSE i \in 1..Len(prog.exec): prog.exec[i].PC.pc = min ELSE 0
              ELSE
                \* The set of (indexes of) the older instructions ready in the SAME cycle
                LET PrevNxt == { nxtCOM(j): j \in 1..s-1 } IN
                \* The index of the next oldest instruction among the instructions ready for in-order commit, taking into account parallel commits
                LET min == Min((ready(Done \union PrevNxt)) \ PrevNxt) IN
                IF min /= 0 THEN CHOOSE i \in 1..Len(prog.exec): prog.exec[i].PC.pc = min ELSE 0
              
ProgressCOM == LET nxtPc(i) == IF nxtCOM(i) /= 0 THEN prog.exec[nxtCOM(i)].PC ELSE empty IN
               _COM' = [ i \in (1..superscal) |-> [ PC |-> nxtPc(i) ] ]

RECURSIVE execList(_)       
execList(i) == IF i = 0
               THEN prog.exec
               ELSE exec_instr(execList(i-1), [ PC |-> next_instr(prog.rest, i), executed |-> FALSE, done |-> FALSE ])

\* TODO: full ROB (structural hazard)
\* prog.exec acts as a (non-circular) ROB
\* For simplification, instructions are stored while fetching and are never erased.
\* Entries indicate whether instructions are executed and whether done (pipeline left after commit)
ProgressProg == LET restp == IF ~NxtIFBusy THEN rest_instr(prog.rest, superscal) ELSE prog.rest IN
                \* Adds new instructions:
                LET nwExec == IF ~NxtIFBusy THEN execList(superscal) ELSE prog.exec IN
                LET execp == [ i \in 1..Len(nwExec) |-> LET instr == nwExec[i] IN
                                                        \* Updates status
                                                        LET executedp == i \in Exec IN
                                                        LET donep == i \in Done IN
                                                        [ instr EXCEPT !.executed = executedp, !.done = donep ]
                             ]
                IN prog' = [ rest |-> restp, exec |-> execp ]

Progress == ProgressIF /\ ProgressID /\ ProgressRS /\ ProgressFU /\ ProgressCOM /\ ProgressProg

TimeProgress == IF \E i \in 1 .. Len(pipe_stages):
                LET x == pipe_stages[i] IN x' /= x
                THEN currCycle' = currCycle + 1 \* /\ PrintT(Done)
                ELSE UNCHANGED << currCycle >> \* /\ PrintT(currCycle)

Next == Progress /\ TimeProgress /\ UNCHANGED << iMiss, iMissTmp, FU, FUTmp, FULat, FUTmpLat >>

-----------------------------------------------------------------------------
Spec == Init /\ [][Next]_<< prog, pipe_stages, currCycle, iMiss, iMissTmp, FU, FUTmp, FULat, FUTmpLat >>
-----------------------------------------------------------------------------
NotCompleted == Len(prog.rest) > 0 \/ Cardinality(Done) < Len(Program)
IdealExec == currCycle <= Len(pipe_stages) + Len(Program) + 2
TimeBound(n) == currCycle <= n

InOrderComp == \A x \in Done: \A i \in 1..Len(prog.exec): prog.exec[i].PC.pc < prog.exec[x].PC.pc => i \in Done
DependExec == \A i \in 1..N_FU: _FU[i].PC /= empty => \A j \in _FU[i].PC.dep: j \in Exec
RAWDep == \A i \in 1..Len(Program): \A d \in Program[i].dep: d < Program[i].pc

=============================================================================
\* Modification History
\* Last modified Wed Oct 28 18:02:59 CET 2020 by benjaminbinder
\* Created Thu Sep 10 13:44:58 CEST 2020 by benjaminbinder
