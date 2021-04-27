------------------------------ MODULE pipeline_ooo ------------------------------
EXTENDS Sequences, instructions_ooo, Integers, TLC, FiniteSets
CONSTANTS locFU
VARIABLES currCycle, prog, _IF, _ID, _RS, _FU, _COM, iMiss, FU, FULat, iMissTmp, FUTmp, FUTmpLat, graph
VARIABLES currCycle2, prog2, _IF2, _ID2, _RS2, _FU2, _COM2, iMiss2, FU2, FULat2, iMissTmp2, FUTmp2, FUTmpLat2, graph2
VARIABLES depProg, depProgTmp, commonPre, locWorst \*, loct, globt

-----------------------------------------------------------------------------
vars == << currCycle, prog, _IF, _ID, _RS, _FU, _COM, iMiss, FU, FULat, iMissTmp, FUTmp, FUTmpLat, graph >>
vars2 == << currCycle2, prog2, _IF2, _ID2, _RS2, _FU2, _COM2, iMiss2, FU2, FULat2, iMissTmp2, FUTmp2, FUTmpLat2, graph2 >>
IFs == << _IF, _IF2 >>
FUs == << _FU, _FU2 >>
progs == << prog, prog2 >>
\*currCycles == << currCycle, currCycle2 >>

ASSUME varIF \in BOOLEAN
ASSUME locFU \subseteq 1..N_FU

\*RECURSIVE SUM(_,_)
\*SUM(seq, n) == IF n = 0 THEN 0 ELSE seq[n] + SUM(seq, n-1)

\* records to deal with potentially equal values that must be distinguishable within the set (<=> multiset)
RECURSIVE SetReduce(_, _, _)
SetReduce(Op(_, _), S, value) == IF S = {}
                                 THEN value.val
                                 ELSE LET s == CHOOSE s \in S: TRUE IN
                                 SetReduce(Op, S \ {s}, [ val |-> Op(s, value) ])
Sum(S) == LET op(a, b) == a.val + b.val
          IN SetReduce(op, S, [ val |-> 0 ])

-----------------------------------------------------------------------------
DomI(i) == IF varIF THEN Program[i].imiss ELSE { FALSE }
DomFU(i) == prog.rest[i].type
DomFULat(i) == prog.rest[i].lat
DomDep(i) == SUBSET(1..i-1)

RECURSIVE CartProd(_,_)
RECURSIVE Flatten(_,_)
CartProd(dom(_), i) == IF i = 1 THEN dom(1) ELSE CartProd(dom, i-1) \X dom(i)
Flatten(seq,i) == IF i = 1 THEN <<seq[1], seq[2]>> ELSE Append(Flatten(seq[1], i-1), seq[2])

Exec1 == INSTANCE pipeline_exec_ooo
Exec2 == INSTANCE pipeline_exec_ooo
         WITH currCycle <- currCycle2,
              prog <- prog2,
              _IF <- _IF2,
              _ID <- _ID2,
              _RS <- _RS2,
              _FU <- _FU2,
              _COM <- _COM2,
              iMiss <- iMiss2,
              FU <- FU2,
              FULat <- FULat2,
              graph <- graph2

\* TODO (optim): withdraw symmetry between both executions
Init == /\ IF modeLen /= -1 THEN /\ depProgTmp \in CartProd(DomDep, ProgLen)
                                 /\ depProg = Flatten(depProgTmp, ProgLen-1)
           ELSE depProgTmp = << >> /\ depProg = << >>
        /\ LET p == IF modeLen /= -1 THEN [ i \in 1..ProgLen |-> [ pc |-> i, type |-> 1..N_FU, lat |-> Lat, dep |-> depProg[i], imiss |-> IF varIF THEN BOOLEAN ELSE {FALSE} ] ]
                    ELSE Program
           IN prog = [ rest |-> p, exec |-> << >> ]
        /\ prog2 = prog
        /\ Exec1!Init
        /\ Exec2!Init
        /\ commonPre = TRUE
        /\ locWorst = [ i \in 1..2 |-> FALSE ]
        (*/\ loct = [ i \in 1..2 |-> [ j \in 1..ProgLen |-> 0 ] ]
        /\ globt = [ i \in 1..2 |-> [ j \in 1..ProgLen |-> 0 ] ]*)
        /\ iMissTmp \in CartProd(DomI, ProgLen)
        /\ iMiss = Flatten(iMissTmp, ProgLen-1)
        /\ FUTmp \in CartProd(DomFU, ProgLen)
        /\ FU = Flatten(FUTmp, ProgLen-1)
        /\ FUTmpLat \in CartProd(DomFULat, ProgLen)
        /\ FULat = Flatten(FUTmpLat, ProgLen-1)
        /\ iMissTmp2 \in CartProd(DomI, ProgLen)
        /\ iMiss2 = Flatten(iMissTmp2, ProgLen-1)
        /\ FUTmp2 \in CartProd(DomFU, ProgLen)
        /\ FU2 = Flatten(FUTmp2, ProgLen-1)
        /\ FUTmpLat2 \in CartProd(DomFULat, ProgLen)
        /\ FULat2 = Flatten(FUTmpLat2, ProgLen-1)

Next == /\ Exec1!Next
        /\ Exec2!Next
        /\ commonPre' = /\ commonPre
                           \* Superscalar IFs are actually interchangeable
                        /\ \A ex \in 1..2: \A k \in 1..superscal: \E kk \in 1..superscal:
                            /\ IFs[ex][k].PC = IFs[3-ex][kk].PC
                               \* Do not split locality constraints (discriminate paths at the soonest)
                            /\ IFs[ex][k]'.PC = IFs[ex][k].PC => IFs[3-ex][kk]'.PC = IFs[3-ex][kk].PC
                           \* Similar treatment for FUs since they are gathered in an EX stage...
                        /\ \A ex \in 1..2: \A k \in 1..N_FU: \E kk \in 1..N_FU:
                            /\ FUs[ex][k].PC = FUs[3-ex][kk].PC
                            /\ FUs[ex][k]'.PC = FUs[ex][k].PC => FUs[3-ex][kk]'.PC = FUs[3-ex][kk].PC
        /\ locWorst' = [ i \in 1..2 |-> \/ \* Paths not still comparable and this one already stated as local worst-case => remains local worst-case
                                            /\ ~commonPre
                                            /\ locWorst[i]
                                        \/ \* Still comparable (common prefix)
                                            /\ commonPre
                                            /\ \A k \in 1..superscal: \A kk \in 1..superscal:
                                                IF IFs[i][k].PC = IFs[3-i][kk].PC => IFs[i][k]'.currLat >= IFs[3-i][kk]'.currLat
                                                THEN TRUE
                                                ELSE PrintT(<< "IF", currCycle >>) /\ FALSE
                                            /\ \A k \in 1..N_FU: \A kk \in 1..N_FU:
                                                IF FUs[i][k].PC = FUs[3-i][kk].PC => FUs[i][k]'.currLat >= FUs[3-i][kk]'.currLat
                                                THEN TRUE
                                                ELSE PrintT(<< "FU", currCycle >>) /\ FALSE
                     ]
        /\ UNCHANGED << iMissTmp, FUTmp, FUTmpLat, iMissTmp2, FUTmp2, FUTmpLat2, depProg, depProgTmp >>
        (*/\ loct' = [ i \in 1..2 |->
                      [ j \in 1..ProgLen |-> loct[i][j] +
                                                  Cardinality({ f \in locFU: FUs[i][f].PC /= empty /\ FUs[i][f].PC.pc = Program[j].pc })
                      ]
                   ]
        /\ globt' = [ i \in 1..2 |->
                        [ j \in 1..ProgLen |-> IF /\ \E k \in 1..Len(progs[i]'.exec): progs[i]'.exec[k].PC.pc = Program[j].pc /\ progs[i]'.exec[k].done
                                                       /\ \A k \in 1..Len(progs[i].exec): progs[i].exec[k].PC.pc /= Program[j].pc \/ ~progs[i].exec[k].done
                                                   THEN currCycles[i]
                                                   ELSE globt[i][j]
                        ]
                    ]*)

Spec == Init /\ [][Next]_<< vars, vars2, depProg, depProgTmp, commonPre, locWorst >>

-----------------------------------------------------------------------------
NotCompleted == \E i \in 1..2: Len(progs[i].rest) > 0 \/ Cardinality(Exec1!Done) < ProgLen \/ Cardinality(Exec2!Done) < ProgLen

-----------------------------------------------------------------------------
ProgDone(n) == \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = ProgLen /\ progs[l].exec[i].done

ComTime(ex,n) == progs[ex].exec[n].comTime

\* Gebhard: heights of steps
\* (~ Strong anomalies but why the shortest local variations?)
StepHeight(ex,k) == IF k = 1 THEN ComTime(ex,1) ELSE ComTime(ex,k)-ComTime(ex,k-1)
NoTAGeb == \A k \in 1..ProgLen-1: \A n \in k+1..ProgLen:
            IF /\ ProgDone(n)
               /\ StepHeight(1,k) < StepHeight(2,k)
               => ComTime(1,n) < ComTime(2,n) \* Non strict inequality in def of anomalies
            THEN TRUE
            ELSE PrintT(<< k, n, StepHeight(1,k), StepHeight(2,k), ComTime(2,n)-ComTime(1,n) >>) /\ FALSE

\* Modified to evict bordeline cases
NoTASteps == \A k \in 1..ProgLen-1: \A n \in k+1..ProgLen:
             IF /\ ProgDone(n)
                /\ StepHeight(1,k) < StepHeight(2,k)
                => ComTime(1,n) <= ComTime(2,n) \* As if strict inequality in def
             THEN TRUE
             ELSE PrintT(<< k, n, StepHeight(1,k), StepHeight(2,k), ComTime(2,n)-ComTime(1,n) >>) /\ FALSE

\* Intersection in plots
\* Cassez (actually only strong anomalies and different inputs are not comparable).
\* ~ Automatic identification (axis inversion). (Actually less than strong...)
NoTAInter == \A k \in 1..ProgLen-1: \A n \in k+1..ProgLen:
            IF /\ ProgDone(n)
               /\ ComTime(1,k) < ComTime(2,k)
               => ComTime(1,n) <= ComTime(2,n)
            THEN TRUE
            ELSE PrintT(<< k, n, ComTime(2,k)-ComTime(1,k), ComTime(2,n)-ComTime(1,n) >>) /\ FALSE
            
\* Kirner: series inversion (not strong)
\* Similar but the last intruction is the fixed reference (less intersections if several)
NoSerKir == \A k \in 1..ProgLen-1: LET n == ProgLen IN
               IF /\ ProgDone(n)
                  /\ ComTime(1,k) < ComTime(2,k)
                  => ComTime(1,n) <= ComTime(2,n)
               THEN TRUE
               ELSE PrintT(<< k, n, ComTime(2,k)-ComTime(1,k), ComTime(2,n)-ComTime(1,n) >>) /\ FALSE

\* Reineke: locality (pipeline stages)
\* Prefixes must be the same for comparisons (=> single variation)
\* (Actually only strong anomalies with another meaning)
NoTALoc == \* \A n \in 1..ProgLen: \A k \in 1..n: \* It should actually be the execution of *some* sequence in the program...
           LET n == ProgLen IN
           /\ ProgDone(n)
           /\ ~locWorst[1]
           => locWorst[2] /\ ComTime(2,n) >= ComTime(1,n)

\* Kirner: parallel inversion
\* Similar to Reineke but component contributions (~locality) are spread over the whole sequence.
\* More likely to target only some components (e.g., FUs), i.e., specific decomposition.
\* (Intrinsically not strong (then refinement))
NoTAComp == LET n == ProgLen IN
            LET FUusage(ex,fu) == FUs[ex][fu].usage IN
            LET usage(ex) == Sum({ [ fu |-> fu, val |-> FUusage(ex,fu) ]: fu \in locFU }) IN
            IF /\ ProgDone(n)
               /\ usage(1) < usage(2)
               => ComTime(1,n) <= ComTime(2,n)
            THEN TRUE
            ELSE PrintT(<< usage(1), usage(2), ComTime(1,n), ComTime(2,n) >>) /\ FALSE


\* Other formulations
(*
LocGeb(ex, k) == IF k = 1 THEN globt[ex][1] ELSE globt[ex][k]-globt[ex][k-1]
NoTAGeb == \A k \in 1..ProgLen-1: \A n \in k+1..ProgLen:
            \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
            =>
            IF LocGeb(1,k) < LocGeb(2,k) => globt[1][n] < globt[2][n] \* Non strict inequality in def of anomalies
            THEN TRUE
            ELSE PrintT(<< k, n, LocGeb(2,k)-LocGeb(1,k), globt[2][n]-globt[1][n] >>) /\ FALSE

NoTAGebStrict == \A k \in 1..ProgLen-1: \A n \in k+1..ProgLen:
                   \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
                   =>
                   IF LocGeb(1,k) < LocGeb(2,k) => globt[1][n] <= globt[2][n] \* As if strict inequality in def
                   THEN TRUE
                   ELSE PrintT(<< k, n, LocGeb(2,k)-LocGeb(1,k), globt[2][n]-globt[1][n] >>) /\ FALSE

NoTACass == \A k \in 1..ProgLen-1: \A n \in k+1..ProgLen:
                \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
                =>
                IF globt[1][k] < globt[2][k] => globt[1][n] <= globt[2][n]
                THEN TRUE
                ELSE PrintT(<< k, n, globt[2][k]-globt[1][k], globt[2][n]-globt[1][n] >>) /\ FALSE

NoTACass == \E ex \in 1..2: \A n \in 1..ProgLen:
            IF (\A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done)
               => globt[3-ex][n] <= globt[ex][n]
            THEN TRUE
            ELSE PrintT(<< n >>) /\ FALSE
            
NoSeriesKir == \A k \in 1..ProgLen-1: LET n == ProgLen IN
                \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
                =>
                IF globt[1][k] < globt[2][k] => globt[1][n] <= globt[2][n] \* As if strict inequality in def
                THEN TRUE
                ELSE PrintT(<< k, n, globt[2][k]-globt[1][k], globt[2][n]-globt[1][n] >>) /\ FALSE

NoTARei == \* \A n \in 1..ProgLen: \A k \in 1..n: \* It should actually be the execution of *some* sequence in the program...
           LET n == ProgLen IN
           \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
           =>
           \A ex \in 1..2: ~reiLoc[ex] => (reiLoc[3-ex] /\ progs[3-ex].exec[n].comTime >= progs[ex].exec[n].comTime)

LocKir(ex) == SUM(loct[ex], Len(loct[ex]))
NoCIKir == LET n == ProgLen IN
           \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
           =>
           IF LocKir(1) < LocKir(2) => globt[1][n] <= globt[2][n]
           THEN TRUE
           ELSE PrintT(<< LocKir(2), LocKir(1), globt[2][n]-globt[1][n] >>) /\ FALSE
*)

-----------------------------------------------------------------------------
\* Kirner: parallel and series amplifications
(*
NoAmpliKir == LET n == ProgLen IN
              /\ \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
              /\ LocKir(1) < LocKir(2)
              => globt[2][n]-globt[1][n] <= LocKir(2)-LocKir(1)
              
NoSeriesAmpliKir == \A n \in 2..ProgLen: \A k \in 1..n-1:
                    IF /\ \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
                       /\ globt[1][k] < globt[2][k]
                       => globt[2][n]-globt[1][n] <= globt[2][k]-globt[1][k]
                    THEN TRUE
                    ELSE PrintT(<< k, n, globt[2][k]-globt[1][k], globt[2][n]-globt[1][n] >>) /\ FALSE
*)

-----------------------------------------------------------------------------
(* 
\* Based on Reineke but allowing different prefixes before comparisons
NoCI == \A k \in 1..ProgLen-1: \A n \in k+1..ProgLen:
            IF /\ \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
               /\ loct[1][k] < loct[2][k]
               => ComTime(1,n) <= ComTime(2,n)
            THEN TRUE
            ELSE PrintT(<< k, n, loct[2][k]-loct[1][k], ComTime(2,n)-ComTime(1,n) >>) /\ FALSE     
\* Same formalism for amplifications
NoAmpli == \A n \in 1..ProgLen: \A k \in 1..n:
            IF /\ \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
               /\ loct[1][k] < loct[2][k]
               => globt[2][n]-globt[1][n] <= loct[2][k]-loct[1][k]
            THEN TRUE
            ELSE PrintT(<< k, n, loct[2][k]-loct[1][k], globt[2][n]-globt[1][n] >>) /\ FALSE
*)

=============================================================================