------------------------------ MODULE pipeline_ooo ------------------------------
EXTENDS Sequences, instructions_ooo, Integers, TLC, FiniteSets
CONSTANTS varIF, missLat, superscal, N_FU, locFU
VARIABLES currCycle, prog, _IF, _ID, _RS, _FU, _COM, iMiss, iMissTmp, FU, FUTmp, FULat, FUTmpLat
VARIABLES currCycle2, prog2, _IF2, _ID2, _RS2, _FU2, _COM2, iMiss2, iMissTmp2, FU2, FUTmp2, FULat2, FUTmpLat2
VARIABLES loct, globt

-----------------------------------------------------------------------------
vars == << currCycle, prog, _IF, _ID, _RS, _FU, _COM, iMiss, iMissTmp, FU, FUTmp, FULat, FUTmpLat >>
vars2 == << currCycle2, prog2, _IF2, _ID2, _RS2, _FU2, _COM2, iMiss2, iMissTmp2, FU2, FUTmp2, FULat2, FUTmpLat2 >>
FUs == << _FU, _FU2 >>
currCycles == << currCycle, currCycle2 >>
progs == << prog, prog2 >>

ASSUME varIF \in BOOLEAN
ASSUME locFU \subseteq {1,2,3}

RECURSIVE SUM(_,_)
SUM(seq, n) == IF n = 0 THEN 0 ELSE seq[n] + SUM(seq, n-1)

-----------------------------------------------------------------------------
DomI(i) == IF varIF THEN Program[i].imiss ELSE { FALSE }
DomFU(i) == Program[i].type
DomFULat(i) == Program[i].lat

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
              iMissTmp <- iMissTmp2,
              FU <- FU2,
              FUTmp <- FUTmp2,
              FULat <- FULat2,
              FUTmpLat <- FUTmpLat2

Init == /\ iMissTmp \in CartProd(DomI, Len(Program))
        /\ iMiss = Flatten(iMissTmp, Len(Program)-1)
        /\ FUTmp \in CartProd(DomFU, Len(Program))
        /\ FU = Flatten(FUTmp, Len(Program)-1)
        /\ FUTmpLat \in CartProd(DomFULat, Len(Program))
        /\ FULat = Flatten(FUTmpLat, Len(Program)-1)
        /\ iMissTmp2 \in CartProd(DomI, Len(Program))
        /\ iMiss2 = Flatten(iMissTmp2, Len(Program)-1)
        /\ FUTmp2 \in CartProd(DomFU, Len(Program))
        /\ FU2 = Flatten(FUTmp2, Len(Program)-1)
        /\ FUTmpLat2 \in CartProd(DomFULat, Len(Program))
        /\ FULat2 = Flatten(FUTmpLat2, Len(Program)-1)
        /\ Exec1!Init
        /\ Exec2!Init
        /\ loct = [ i \in 1..2 |-> [ j \in 1..Len(Program) |-> 0 ] ]
        /\ globt = [ i \in 1..2 |-> [ j \in 1..Len(Program) |-> 0 ] ]

Next == /\ Exec1!Next
        /\ Exec2!Next                                           
        /\ loct' = [ i \in 1..2 |->
                      [ j \in 1..Len(Program) |-> loct[i][j] +
                                                  Cardinality({ f \in locFU: FUs[i][f].PC /= empty /\ FUs[i][f].PC.pc = Program[j].pc })
                      ]
                   ]
        /\ globt' = [ i \in 1..2 |->
                        [ j \in 1..Len(Program) |-> IF /\ \E k \in 1..Len(progs[i]'.exec): progs[i]'.exec[k].PC.pc = Program[j].pc /\ progs[i]'.exec[k].done
                                                       /\ \A k \in 1..Len(progs[i].exec): progs[i].exec[k].PC.pc /= Program[j].pc \/ ~progs[i].exec[k].done
                                                   THEN currCycles[i]
                                                   ELSE globt[i][j]
                        ]
                    ]

Spec == Init /\ [][Next]_<< vars, vars2, loct, globt >>

-----------------------------------------------------------------------------
NotCompleted == \E i \in 1..2: Len(progs[i].rest) > 0 \/ Cardinality(Exec1!Done) < Len(Program) \/ Cardinality(Exec2!Done) < Len(Program)
         
-----------------------------------------------------------------------------      
\* Based on Reineke but allowing different prefixes before comparisons
NoCI == \A n \in 1..Len(Program): \A k \in 1..n:
            IF /\ \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
               /\ loct[1][k] < loct[2][k]
               => globt[1][n] <= globt[2][n]
            THEN TRUE
            ELSE PrintT(<< k, n, loct[2][k]-loct[1][k], globt[2][n]-globt[1][n] >>) /\ FALSE
            
\* Same formalism for amplifications
NoAmpli == \A n \in 1..Len(Program): \A k \in 1..n:
            IF /\ \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
               /\ loct[1][k] < loct[2][k]
               => globt[2][n]-globt[1][n] <= loct[2][k]-loct[1][k]
            THEN TRUE
            ELSE PrintT(<< k, n, loct[2][k]-loct[1][k], globt[2][n]-globt[1][n] >>) /\ FALSE

-----------------------------------------------------------------------------   
\* Gebhard: heights of steps
\* (Problems with more behaviors (why the shortest local variation?) and ~strong anomalies (but why the longest global one?))
LocGeb(ex, k) == IF k = 1 THEN globt[ex][1] ELSE globt[ex][k]-globt[ex][k-1]
NoTAGeb == \A n \in 2..Len(Program): \A k \in 1..n-1:
           IF /\ \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
              /\ LocGeb(1, k) < LocGeb(2,k)
              => globt[1][n] < globt[2][n] \* Non strict inequality in def of anomalies
           THEN TRUE
           ELSE PrintT(<< k, n, LocGeb(2, k)-LocGeb(1, k), globt[2][n]-globt[1][n] >>) /\ FALSE
            
\* Modified to evict bordeline cases
NoTAGebStrict == \A n \in 2..Len(Program): \A k \in 1..n-1:
                  IF /\ \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
                     /\ LocGeb(1, k) < LocGeb(2,k)
                     => globt[1][n] <= globt[2][n] \* As if strict inequality in def
                  THEN TRUE
                  ELSE PrintT(<< k, n, LocGeb(2, k)-LocGeb(1, k), globt[2][n]-globt[1][n] >>) /\ FALSE
 
\* Intersection of lines
\* ~ Automatic identification (axes inversion). (Actually more than strong, sound WCET in an abstract context...)
\* Kirner: series inversion (not strong)
NoTAGlob == \A n \in 2..Len(Program): \A k \in 1..n-1:
            IF /\ \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
               /\ globt[1][k] < globt[2][k]
               => globt[1][n] <= globt[2][n] \* Non-strict inequality
            THEN TRUE
            ELSE PrintT(<< k, n, globt[2][k]-globt[1][k], globt[2][n]-globt[1][n] >>) /\ FALSE

\* Cassez: similar but all prefixes must be comparable (~Reineke)
\* (Actually only strong anomalies. Besides, different inputs not comparable.)
NoTACass == \E ex \in 1..2: \A n \in 1..Len(Program):
            IF (\A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done)
               => globt[3-ex][n] <= globt[ex][n]
            THEN TRUE
            ELSE PrintT(<< n >>) /\ FALSE

\* Reineke: locality (pipeline stages)
\* Prefixes must be the same (=> single variation)
\* (Actually only strong anomalies)
NoTARei == \A n \in 1..Len(Program): \A k \in 1..n:
            IF /\ \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
               /\ \A kk \in 1..k-1: loct[1][kk] = loct[2][kk]
               /\ loct[1][k] < loct[2][k]
               => globt[1][n] <= globt[2][n]
            THEN TRUE
            ELSE PrintT(<< k, n, loct[2][k]-loct[1][k], globt[2][n]-globt[1][n] >>) /\ FALSE

\* Kirner: parallel inversion
\* Similar to Reineke but component contributions (~locality) are spread over the whole sequence.
\* (Moreover a relevant decomposition is assumed to be found. Intrinsically not strong, then refinement.)
\* Contrary to series, sequence in whole.
LocKir(ex) == SUM(loct[ex], Len(loct[ex]))
NoCIKir == LET n == Len(Program) IN
           IF /\ \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
              /\ LocKir(1) < LocKir(2)
              => globt[1][n] <= globt[2][n]
           THEN TRUE
           ELSE PrintT(<< LocKir(2), LocKir(1), globt[2][n]-globt[1][n] >>) /\ FALSE

-----------------------------------------------------------------------------
\* Kirner: parallel and series amplifications
NoAmpliKir == LET n == Len(Program) IN
              /\ \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
              /\ LocKir(1) < LocKir(2)
              => globt[2][n]-globt[1][n] <= LocKir(2)-LocKir(1)
              
NoSeriesAmpliKir == \A n \in 2..Len(Program): \A k \in 1..n-1:
                    IF /\ \A l \in 1..2: \E i \in 1..Len(progs[l].exec): progs[l].exec[i].PC.pc = Program[n].pc /\ progs[l].exec[i].done
                       /\ globt[1][k] < globt[2][k]
                       => globt[2][n]-globt[1][n] <= globt[2][k]-globt[1][k]
                    THEN TRUE
                    ELSE PrintT(<< k, n, globt[2][k]-globt[1][k], globt[2][n]-globt[1][n] >>) /\ FALSE

=============================================================================