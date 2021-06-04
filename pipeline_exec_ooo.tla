---------------------------- MODULE pipeline_exec_ooo ----------------------------
EXTENDS Sequences, instructions_ooo, Integers, TLC, FiniteSets
VARIABLES currCycle, prog, _IF, _ID, _RS, _FU, _COM, iMiss, FU, FULat
-----------------------------------------------------------------------------

pipe_stages == << _IF, _ID, _RS, _FU, _COM >>
Min(S) == IF S = {} THEN 0 ELSE CHOOSE x \in S: \A y \in S: y >= x
-----------------------------------------------------------------------------

Init == /\ currCycle = 0
        /\ _IF = [ i \in (1..superscal) |-> [ PC |-> empty, baseLat |-> 1, currLat |-> 1 ] ]
        /\ _ID = [ i \in (1..superscal) |-> [ PC |-> empty ] ]
        /\ _RS = [ i \in (1..N_FU) |-> {} ]
        /\ _FU = [ i \in (1..N_FU) |-> [ PC |-> empty, baseLat |-> 1, currLat |-> 1, usage |-> 0 ] ]
        /\ _COM = [ i \in (1..superscal) |-> [ PC |-> empty ] ]
-----------------------------------------------------------------------------

NxtIFBusy == \E i \in 1..superscal: _IF[i].currLat < _IF[i].baseLat \* A I-cache miss stalls each pipeline
NxtFUBusy(i) == _FU[i].currLat < _FU[i].baseLat

\* Set of (indexes of) instructions fully executed or about to finish execution
Exec == { i \in 1..Len(prog.exec): \/ prog.exec[i].executed
                                   \/ \E j \in 1..N_FU: prog.exec[i].PC = _FU[j].PC /\ ~NxtFUBusy(j) }
\* Set of (indexes of) instructions committed or about to leave the pipeline
Done == { i \in 1..Len(prog.exec): \/ prog.exec[i].done
                                   \/ \E j \in 1..superscal: prog.exec[i].PC = _COM[j].PC }

\* The decoded instructions to be executed in the i-th FU. There can be none or several per cycle.
FURouting(i) == { _ID[j].PC: j \in { k \in 1..superscal: _ID[k].PC /= empty /\ FU[_ID[k].PC.pc] = i } }

\* The next instruction to be executed in the i-th FU (not necessarily on the next cycle)
NxtFU(i) == IF NxtFUBusy(i)
            THEN empty
            ELSE
                \* Older instruction (in program order) among the set of the waiting instructions in the corresponding
                \* RS or still in ID, whose all dependencies are satisfied (executed) or about to be.
                \* At most one instruction dispatched per cycle in each FU.
                LET minReady == Min({ x.pc: x \in
                                        { y \in _RS[i] \union FURouting(i):
                                            \A z \in y.dep: z \in Exec }
                                    }) IN
                IF minReady = 0 THEN empty
                ELSE CHOOSE x \in _RS[i] \union FURouting(i): x.pc = minReady
                
\* The set of (indexes of) the instructions that are:
\*    - executed or about to finish execution
\*    - ready for in-order commit
\*    - not already committed
ReadyCOM(DoneCOM) == \* The set of (indexes of) instructions *potentially* ready for in-order commit
\* (within the ROB), i.e., whose all previous instructions (in program order) either have been committed/are about
\* to leave the pipeline or are about to be committed in the same cycle (depending on DoneCOM).
                      LET readyInOrder == { j \in 1..Len(prog.exec):
                                            \A k \in 1..j-1: k \in DoneCOM
                                         } IN
                      (Exec \intersect readyInOrder) \ DoneCOM
-----------------------------------------------------------------------------

\* Fetch (in-order)
ProgressIF == LET nxt(i) == next_instr(prog.rest, i) IN
              LET cacheHit(i) == nxt(i) = empty \/ (nxt(i) /= empty /\ ~iMiss[nxt(i).pc]) IN
              LET cacheMiss(i) == nxt(i) /= empty /\ iMiss[nxt(i).pc] IN
              LET IFp(i) == IF ~NxtIFBusy /\ cacheHit(i)
                            THEN [ PC |-> nxt(i), baseLat |-> 1, currLat |-> 1 ]
                            ELSE IF ~NxtIFBusy /\ cacheMiss(i)
                                 THEN [ PC |-> nxt(i), baseLat |-> missLat, currLat |-> 1 ]
                                 ELSE [ _IF[i] EXCEPT !.currLat = _IF[i].currLat+1 ]
              IN _IF' = [ i \in (1..superscal) |-> IFp(i) ]

\* Decode (in-order)
ProgressID == LET nxtPc(i) == IF ~NxtIFBusy THEN _IF[i].PC ELSE empty IN
              _ID' = [ i \in (1..superscal) |-> [ PC |-> nxtPc(i) ] ]

\* Issue
ProgressRS == _RS' = [ i \in (1..N_FU) |-> (_RS[i] \union FURouting(i))
                     \* Instructions are erased when beginning execution and do not go to RSs if executable at once:
                                           \ { NxtFU(i) } ]

\* OoO execution
ProgressFU == LET FUp(i) ==
              IF ~NxtFUBusy(i)
              THEN
                IF NxtFU(i) = empty
                THEN [ PC |-> empty, baseLat |-> 1, currLat |-> 1, usage |-> _FU[i].usage ]
                ELSE [ PC |-> NxtFU(i), baseLat |-> FULat[NxtFU(i).pc],
                       currLat |-> 1, usage |-> _FU[i].usage+1 ]
              ELSE [ _FU[i] EXCEPT !.currLat = @+1, !.usage = @+1 ]
              IN _FU' = [ i \in (1..N_FU) |-> FUp(i) ]

\* Multiple in-order commit
RECURSIVE nxtCOM(_)
nxtCOM(s) ==  IF s = 1
              THEN
                \* The (index of the) instructions already ready for in-order commit
                ReadyCOM(Done)
              ELSE
                \* The instructions ready for in-order commit, taking into account parallel commit (in the same cycle)
                ReadyCOM(Done \union UNION({ nxtCOM(j): j \in 1..s-1 }))
              
\* Superscalar commit: the oldest instruction (min. address) is selected among the ready instructions
\* for each iteration of the multiple commit
ProgressCOM == LET nxtPc(i) ==
               IF nxtCOM(i) /= {} THEN prog.exec[Min(nxtCOM(i))].PC ELSE empty IN
               _COM' = [ i \in 1..superscal |-> [ PC |-> nxtPc(i) ] ]

RECURSIVE execList(_)
execList(i) == IF i = 0
               THEN prog.exec
               ELSE exec_instr(execList(i-1), [ PC |-> next_instr(prog.rest, i), executed |-> FALSE,
                                                done |-> FALSE, exStartTime |-> 0, comTime |-> 0 ])

\* prog.rest contains the instructions not already fetched
\* prog.exec acts as a (non-circular) ROB
\*  For simplification, instructions are stored while fetching and never removed.
\*  Entries indicate whether instructions are executed and whether done (pipeline left after commit)
ProgressProg == LET restp == IF ~NxtIFBusy THEN rest_instr(prog.rest, superscal) ELSE prog.rest IN
                \* Add new instructions:
                LET nwExec == IF ~NxtIFBusy THEN execList(superscal) ELSE prog.exec IN
                LET execp == [ i \in 1..Len(nwExec) |-> 
                                LET instr == nwExec[i] IN
                                \* Update status:
                                LET executedp == i \in Exec IN
                                LET donep == i \in Done IN
                                LET comTimep ==
                                    IF \E k \in (1..superscal): _COM[k] /= empty /\ _COM[k].PC = instr.PC
                                    THEN currCycle
                                    ELSE instr.comTime IN
                                LET exStartTimep ==
                                    IF \E k \in (1..N_FU): NxtFU(k) /= empty /\ NxtFU(k) = instr.PC
                                    THEN currCycle
                                    ELSE instr.exStartTime IN
                                [ instr EXCEPT !.executed = executedp, !.done = donep,
                                  !.exStartTime = exStartTimep, !.comTime = comTimep ]
                             ]
                IN prog' = [ rest |-> restp, exec |-> execp ]
-----------------------------------------------------------------------------
                 
Progress == ProgressIF /\ ProgressID /\ ProgressRS /\ ProgressFU /\ ProgressCOM /\ ProgressProg

TimeProgress == IF \E i \in 1 .. Len(pipe_stages):
                LET x == pipe_stages[i] IN x' /= x
                THEN currCycle' = currCycle + 1 \* /\ PrintT(Done)
                ELSE UNCHANGED << currCycle >> \* /\ PrintT(currCycle)

Next == Progress /\ TimeProgress /\ UNCHANGED << iMiss, FU, FULat >>

-----------------------------------------------------------------------------
Spec == Init /\ [][Next]_<< prog, pipe_stages, currCycle, iMiss, FU, FULat >>
-----------------------------------------------------------------------------

NotCompleted == Len(prog.rest) > 0 \/ Cardinality(Done) < Len(Program)
IdealExec == currCycle <= Len(pipe_stages) + Len(Program) + 2
TimeBound(n) == currCycle <= n

InOrderComp == \A x \in Done: \A i \in 1..Len(prog.exec): prog.exec[i].PC.pc < prog.exec[x].PC.pc => i \in Done
DependExec == \A i \in 1..N_FU: _FU[i].PC /= empty => \A j \in _FU[i].PC.dep: j \in Exec
RAWDep == \A i \in 1..Len(Program): \A d \in Program[i].dep: d < Program[i].pc

=============================================================================
\* Modification History
\* Last modified Fri Jun 04 12:31:02 CEST 2021 by benjaminbinder
\* Created Thu Sep 10 13:44:58 CEST 2020 by benjaminbinder
