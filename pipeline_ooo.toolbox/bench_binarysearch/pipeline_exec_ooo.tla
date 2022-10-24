---------------------------- MODULE pipeline_exec_ooo ----------------------------
EXTENDS Sequences, instructions_ooo, Integers, TLC, FiniteSets
VARIABLES currCycle, pc, _IF, _ID, _RS, _FU, _COM, rob, robHead, graph, exec_inst
-----------------------------------------------------------------------------

pipe_stages == << _IF, _ID, _RS, _FU, _COM, rob >>

RECURSIVE CartProd(_,_)
CartProd(dom(_), i) == IF i = 1 THEN { <<x>> : x \in dom(1) } ELSE { x \o <<y>> : x \in CartProd(dom, i-1), y \in dom(i) }
-----------------------------------------------------------------------------

Init == /\ currCycle = 0
        /\ pc = 0
        /\ _IF = [ i \in (1..superscal) |-> [ instr |-> Empty, baseLat |-> 1, currLat |-> 1 ] ]
        /\ _ID = [ i \in (1..superscal) |-> Empty ]
        /\ _RS = [ i \in (1..N_FU) |-> {} ]
        /\ _FU = [ i \in (1..N_FU) |-> [ instr |-> Empty, baseLat |-> 1, currLat |-> 1 ] ]
        /\ _COM = [ i \in (1..superscal) |-> Empty ]
        /\ rob = <<>>
        /\ robHead = 1
        /\ graph = [ nodes |-> <<>>,
                     edges |-> {} ]
                                \*UNION { [ type : {"D"}, source : program[i].dep, dest : {i} ] : i \in DOMAIN program }
-----------------------------------------------------------------------------

NxtIFBusy == \E i \in 1..superscal: _IF[i].currLat < _IF[i].baseLat \* A I-cache miss stalls each pipeline
NxtFUBusy(i) == _FU[i].currLat < _FU[i].baseLat

\* Set of (indexes of) instructions fully executed or about to finish execution
Exec == { i \in robHead..Len(rob): \/ rob[i].executed
                                   \/ \E j \in 1..N_FU: rob[i].instr = _FU[j].instr /\ ~NxtFUBusy(j) }
                             
\* Set of (indexes of) instructions committed or about to leave the pipeline
Done == { i \in robHead..Len(rob): \/ rob[i].done
                                   \/ \E j \in 1..superscal: rob[i].instr = _COM[j] }

\* superscal instructions will need a place in the ROB
\*NxtFullRob == (Len(rob)-robHead+1)-Cardinality(Done) > robSize-superscal
FullRob == Len(rob)-robHead+1 > robSize-superscal

RobSelect(instr) == CHOOSE i \in robHead..Len(rob) : rob[i].instr = instr

\* The decoded instructions to be executed in the i-th FU. There can be none or several per cycle.
FURouting(i) == LET FUmap(instr) == CASE instr.type = "IntAlu" -> 1 [] instr.type \in {"MemRead", "MemWrite", "FloatMemRead", "FloatMemWrite"} -> 2 [] instr.type = "IntDiv" -> 3 [] instr.type = "IntMult" -> 4 [] instr.type \in {"FloatMult", "FloatAdd"} -> 5 [] OTHER -> PrintT(instr.type) IN
                { _ID[j] : j \in { k \in 1..superscal : NotEmpty(_ID[k]) /\ FUmap(_ID[k]) = i } }

FullRS(i) == Cardinality(_RS[i]) >= RSsize

NxtStallID == \/ \E i \in 1..N_FU: FullRS(i)
              \/ FullRob
           
\* The next instruction to be executed in the i-th FU
NxtFU(i) == IF NxtFUBusy(i)
            THEN Empty
            ELSE
                \* Oldest instruction (in program order) among the set of the waiting instructions in the corresponding
                \* RS or still in ID, whose all dependencies are satisfied (executed) or about to be.
                \* At most one instruction dispatched per cycle in each FU.
                LET minReadyRS == Min({ RobSelect(y) : y \in
                                    { x \in _RS[i]: \A entry \in robHead..RobSelect(x)-1: rob[entry].instr.r0 \in { x.r1, x.r2 } \ {""} => entry \in Exec }
                                  }) IN
                IF minReadyRS = 0
                THEN IF NxtStallID
                     THEN Empty
                     ELSE LET minFwd == Min({ j \in 1..superscal :
                                              _ID[j] \in { x \in FURouting(i):
                                                            /\ \A entry \in robHead..Len(rob): rob[entry].instr.r0 \in { x.r1, x.r2 } \ {""} => entry \in Exec
                                                            /\ \A k \in 1..j-1: _ID[k].r0 \notin { x.r1, x.r2 }
                                                         }
                                            }) IN
                          IF minFwd = 0 THEN Empty ELSE _ID[minFwd]
                ELSE rob[minReadyRS].instr
                                
\* The set of (indexes of) the instructions that are:
\*    - executed or about to finish execution
\*    - ready for in-order commit
\*    - not already committed
ReadyCOM(DoneCOM) == \* The set of (indexes of) instructions ready for in-order commit
\* (within the ROB), i.e., whose all previous instructions (in program order) either have been committed/are about
\* to leave the pipeline or are about to be committed in the same cycle (depending on DoneCOM).
                      LET readyInOrder == { j \in robHead..Len(rob):
                                            \A k \in robHead..j-1: k \in DoneCOM
                                         } IN
                      (Exec \intersect readyInOrder) \ DoneCOM
-----------------------------------------------------------------------------

\* Fetch (in-order)
ProgressIF == IF ~NxtIFBusy /\ ~NxtStallID
              THEN
              /\ LET init(i, latency) == [ instr |-> Instr(pc+i), baseLat |-> latency, currLat |-> 1 ] IN
                 \/ _IF' = [ i \in 1..superscal |-> init(i, 1) ]
                    \*/\ UNCHANGED missList
                 \/ /\ \E i \in 1..superscal : Instr(pc+i).ind \in mayIMiss
                    /\ _IF' = [ i \in 1..superscal |-> init(i, missLat) ] \* A I-cache miss stalls each pipeline
                    \*/\ missList' = Append(missList, _IF'.instr.ind)
              /\ IF \E i \in 1..superscal: Instr(pc+i) /= Empty
                 THEN pc' = pc+superscal
                 ELSE UNCHANGED pc
              ELSE /\ _IF' = [ i \in 1..superscal |-> [_IF[i] EXCEPT !.currLat = @+1] ]
                   /\ UNCHANGED pc

\* Decode (in-order)
ProgressID == LET nxt(i) == IF ~NxtIFBusy THEN _IF[i].instr ELSE Empty IN
              IF ~NxtStallID THEN _ID' = [ i \in (1..superscal) |-> nxt(i) ]
              ELSE UNCHANGED _ID
              
\* Issue
ProgressRS == IF ~NxtStallID
              THEN _RS' = [ i \in (1..N_FU) |-> (_RS[i] \union FURouting(i))
                        \* Instructions are erased when beginning execution and do not go to RSs if executable at once:
                                                \ { NxtFU(i) } ]
              ELSE _RS' = [ i \in (1..N_FU) |-> _RS[i] \ { NxtFU(i) } ]
                                           
\* OoO execution
ProgressFU == LET FUp(i) == IF ~NxtFUBusy(i)
                            THEN LET latency == IF NxtFU(i) = Empty THEN 1
                                                ELSE IF NxtFU(i).type \in DOMAIN lat THEN lat[NxtFU(i).type] ELSE PrintT(NxtFU(i).type) IN
                                 [ instr : {NxtFU(i)},
                                   baseLat : IF /\ NxtFU(i).ind \in mayDMiss \*/\ NxtFU(i).type \in {"MemRead", "MemWrite"}
                                                \*/\ exec_inst = 2 => NxtFU(i).ind /= Min(mayDMiss) \* symmetry
                                                /\ exec_inst = 2
                                             THEN {latency, missLat}
                                             ELSE {latency},
                                   currLat : {1} ]
                            ELSE {[ _FU[i] EXCEPT !.currLat = @+1 ]} IN
              _FU' \in CartProd(LAMBDA i : FUp(i), N_FU)

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
ProgressCOM == _COM' = [ i \in 1..superscal |-> IF nxtCOM(i) /= {} THEN rob[Min(nxtCOM(i))].instr ELSE Empty ]

\*  For simplification, instructions are stored while fetching and never removed.
\*  Entries indicate whether instructions are executed and whether done (pipeline left after commit)
RECURSIVE AppendRob(_)
AppendRob(i) == LET instr == _ID[i] IN
                LET entry == IF instr.type = "No_OpClass"
                             THEN <<>>
                             ELSE << [ instr |-> instr, executed |-> FALSE, done |-> FALSE ] >> IN
                IF i = superscal
                THEN entry
                ELSE entry \o AppendRob(i+1)  

ProgressRob == /\ rob' = [ i \in 1..robHead-1 |-> rob[i] ]
                         \o [ i \in 1..Len(rob)-robHead+1 |-> [rob[robHead-1+i] EXCEPT !.executed = (robHead-1+i \in Exec), !.done = (robHead-1+i \in Done) ] ]
                         \o IF ~NxtStallID THEN AppendRob(1) ELSE <<>>
               /\ LET max == Max({ i \in 1..superscal : _COM[i] /= Empty }) IN
                  IF max /= 0
                  THEN robHead' = RobSelect(_COM[max])+1
                  ELSE UNCHANGED robHead
-----------------------------------------------------------------------------

RECURSIVE AppendRow(_)
AppendRow(k) == LET evt == IF _IF[k].instr.ind /= 0 /\ _IF[k].currLat = 1
                           THEN << [ i \in {"IFacq", "IFrel", "IDacq", "IDrel", "FUacq", "FUrel", "COM", "ROB", "RS", "FU", "ind", "addr"} |-> 
                                        CASE i = "IFacq" -> currCycle
                                          [] i = "IFrel" -> IF _IF[k].baseLat = _IF[k].currLat THEN currCycle+1 ELSE 0
                                          [] i = "ind" -> _IF[k].instr.ind
                                          [] i = "addr" -> _IF[k].instr.addr
                                          [] OTHER -> 0 ] >>
                           ELSE <<>> IN
                IF k = 1 THEN evt ELSE AppendRow(k-1) \o evt

ProgressGraph == graph' = [ graph EXCEPT
                            !.nodes = [ i \in 1..robHead-1 |-> graph.nodes[i] ]
                                      \o [ j \in 1..Len(graph.nodes)-robHead+1 |->
                                            LET i == robHead-1+j IN
                                            [ IFacq |-> graph.nodes[i].IFacq,
                                              IFrel |-> IF \E k \in (1..superscal): _IF[k].instr = program[i] /\ _IF[k].baseLat = _IF[k].currLat THEN currCycle+1 ELSE graph.nodes[i].IFrel,
                                              IDacq |-> IF \E k \in (1..superscal): _ID[k] = program[i] /\ graph.nodes[i].IDacq = 0 THEN currCycle ELSE graph.nodes[i].IDacq,
                                              IDrel |-> IF \E k \in (1..superscal): _ID[k] = program[i] /\ _ID'[k] /= program[i] THEN currCycle+1 ELSE graph.nodes[i].IDrel,
                                              FUacq |-> IF \E k \in (1..N_FU): _FU[k].instr = program[i] /\ _FU[k].currLat = 1 THEN currCycle ELSE graph.nodes[i].FUacq,
                                              FUrel |-> IF \E k \in (1..N_FU): _FU[k].instr = program[i] /\ _FU'[k].instr /= program[i] THEN currCycle+1 ELSE graph.nodes[i].FUrel,
                                              COM |-> IF \E k \in (1..superscal): _COM[k] = program[i] THEN currCycle ELSE graph.nodes[i].COM,
                                              ROB |-> IF \E k \in (1..superscal): _ID[k] = program[i] /\ ~FullRob THEN currCycle ELSE graph.nodes[i].ROB,
                                              RS |-> IF \E k \in (1..superscal): _ID[k] = program[i] /\ \A l \in 1..N_FU: ~FullRS(l) THEN currCycle ELSE graph.nodes[i].RS,
                                              FU |-> IF \E k \in (1..N_FU): _FU[k].instr = program[i] THEN CHOOSE k \in (1..N_FU): _FU[k].instr = program[i] ELSE graph.nodes[i].FU,
                                              ind |-> graph.nodes[i].ind,
                                              addr |-> graph.nodes[i].addr ] ]
                                      \o AppendRow(superscal),
                            !.edges = LET dep(x) == { entry \in robHead..RobSelect(x)-1 : rob[entry].instr.r0 \in { x.r1, x.r2 } \ {""} } IN
                                      @ \*\union { [ type |-> "D", source |-> _FU[i].instr.ind, dest |-> _FU'[k].instr.ind ] :
                                        \*            i \in { k \in 1..superscal : _FU'[k].instr /= _FU[k].instr /\ _FU'[k].instr.r0 \in { _FU[k].instr.r1, _FU[k].instr.r2 } \ {""} } }
                                        \union UNION({ { [ type |-> "D", source |-> rob[x].instr.ind, dest |-> _FU[k].instr.ind ] : x \in dep(_FU[k].instr) } :
                                                            k \in { j \in 1..N_FU: NotEmpty(_FU[j].instr) /\ _FU[j].currLat = 1 } })
                                        (*\union (UNION ({{[ type |-> "RS", source |-> _FU[i].instr.ind, dest |-> x.ind ] :
                                                            x \in { xx \in _RS[i] \union FURouting(i) : NotEmpty(_FU[i].instr)}} : i \in 1..N_FU}))
                                         \union { [ type |-> "ROB", source |-> _COM'[superscal].ind, dest |-> i ] :
                                                    i \in { rob[j].instr.ind : j \in UNION({ nxtCOM(k) : k \in 1..superscal+1 }) } \ {_COM'[j].ind : j \in 1..superscal} }
                                         \union IF NxtFullRob
                                               THEN LET k == Max({ k \in 1..superscal: NotEmpty(_COM'[k]) }) IN
                                                    LET i == Min({ i \in 1..superscal: NotEmpty(_IF'[i].instr) }) IN
                                                    IF k /= 0 /\ i /= 0 THEN
                                                     { [ type |-> "StallingROB", source |-> _COM'[k].ind, dest |-> _IF'[i].instr.ind ] }
                                                    ELSE {}
                                               ELSE {}*)
                          ]
                                           
Progress == ProgressIF /\ ProgressID /\ ProgressRS /\ ProgressFU /\ ProgressCOM /\ ProgressRob /\ ProgressGraph

TimeProgress == IF \E i \in 1 .. Len(pipe_stages):
                LET x == pipe_stages[i] IN x' /= x
                THEN currCycle' = currCycle + 1 \* /\ PrintT(Done)
                ELSE UNCHANGED << currCycle >> \* /\ PrintT(currCycle)

Next == Progress /\ TimeProgress /\ UNCHANGED exec_inst

-----------------------------------------------------------------------------
Spec == Init /\ [][Next]_<< pipe_stages, pc, currCycle, graph, exec_inst >>
-----------------------------------------------------------------------------

IdealExec == currCycle <= Len(pipe_stages) + Len(program) + 2
TimeBound(n) == currCycle <= n

DependExec == \A i \in 1..N_FU: _FU[i].instr /= Empty => \A j \in _FU[i].instr.dep: j \in Exec
RAWDep == \A i \in 1..ProgLen: \A d \in program[i].dep: d < program[i].addr

=============================================================================
