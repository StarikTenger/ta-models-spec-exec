------------------------------ MODULE pipeline_ooo ------------------------------
EXTENDS Sequences, instructions_ooo, Integers, TLC, FiniteSets
CONSTANTS locFU
VARIABLES currCycle, prog, _IF, _ID, _RS, _FU, _COM, iMiss, FU, FULat, iMissTmp, FUTmp, FUTmpLat
VARIABLES currCycle2, prog2, _IF2, _ID2, _RS2, _FU2, _COM2, iMiss2, FU2, FULat2, iMissTmp2, FUTmp2, FUTmpLat2
VARIABLES depProg, depProgTmp, commonPre, locWorst

-----------------------------------------------------------------------------
vars == << currCycle, prog, _IF, _ID, _RS, _FU, _COM, iMiss, FU, FULat, iMissTmp, FUTmp, FUTmpLat >>
vars2 == << currCycle2, prog2, _IF2, _ID2, _RS2, _FU2, _COM2, iMiss2, FU2, FULat2, iMissTmp2, FUTmp2, FUTmpLat2 >>
IFs == << _IF, _IF2 >>
FUs == << _FU, _FU2 >>
progs == << prog, prog2 >>

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
DomDep(i) == {{}} \union {{j} : j \in 1..3} \*SUBSET(1..i-1)

RECURSIVE CartProd(_,_)
RECURSIVE Flatten(_,_)


CartProd(dom(_), i) == IF i = 1 THEN dom(1) ELSE CartProd(dom, i-1) \X dom(i)

\* Flatten(<<<<<<1, 2>>,3>>, 4>>, 3) -> <<1, 2, 3, 4>>
Flatten(seq,i) == IF i = 1 THEN <<seq[1], seq[2]>> ELSE Append(Flatten(seq[1], i-1), seq[2])

\* 1st instance of the pipeline for one execution trace
Exec1 == INSTANCE pipeline_exec_ooo
\* 2nd instance of the pipeline with the same input instructions for another execution trace
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
              FULat <- FULat2
              
Init == /\ IF modeLen /= -1 THEN /\ depProgTmp \in CartProd(DomDep, ProgLen)
                                 /\ depProg = Flatten(depProgTmp, ProgLen-1)
           ELSE depProgTmp = << >> /\ depProg = << >>
        /\ LET p == IF modeLen /= -1 
                    THEN 
                        [ i \in 1..ProgLen |-> [ 
                            pc |-> i, 
                            type |-> 1..N_FU,
                            lat |-> Lat, 
                            dep |-> depProg[i], 
                            imiss |-> IF varIF THEN BOOLEAN ELSE {FALSE} ] 
                        ]
                    ELSE 
                        Program
           IN prog = [ rest |-> p, exec |-> << >> ]
        /\ prog2 = prog
        /\ Exec1!Init
        /\ Exec2!Init
        /\ commonPre = TRUE
        /\ locWorst = [ i \in 1..2 |-> FALSE ]
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
        \* Update of the additional state variables for TALoc
        /\ commonPre' =
            /\ commonPre
               \* Superscalar IFs are actually interchangeable
            /\ \A ex \in 1..2: \A k \in 1..superscal: \E kk \in 1..superscal:
                /\ IFs[ex][k].PC = IFs[3-ex][kk].PC
                   \* Do not split locality constraints (discriminate paths at the soonest)
                /\ IFs[ex][k]'.PC = IFs[ex][k].PC => IFs[3-ex][kk]'.PC = IFs[3-ex][kk].PC
               \* Similar treatment for FUs since they are gathered in an EX stage...
            /\ \A ex \in 1..2: \A k \in 1..N_FU: \E kk \in 1..N_FU:
                /\ FUs[ex][k].PC = FUs[3-ex][kk].PC
                /\ FUs[ex][k]'.PC = FUs[ex][k].PC => FUs[3-ex][kk]'.PC = FUs[3-ex][kk].PC
        /\ locWorst' = [ i \in 1..2 |->
                \/ \* Paths not still comparable and this one already stated as local worst-case => remains local worst-case
                    /\ ~commonPre
                    /\ locWorst[i]
                \/ \* Still comparable (common prefix)
                    /\ commonPre
                    /\ \A k \in 1..superscal: \A kk \in 1..superscal:
                        IFs[i][k].PC = IFs[3-i][kk].PC => IFs[i][k]'.currLat >= IFs[3-i][kk]'.currLat
                    /\ \A k \in 1..N_FU: \A kk \in 1..N_FU:
                        FUs[i][k].PC = FUs[3-i][kk].PC => FUs[i][k]'.currLat >= FUs[3-i][kk]'.currLat
                       ]
        /\ UNCHANGED << iMissTmp, FUTmp, FUTmpLat, iMissTmp2, FUTmp2, FUTmpLat2, depProg, depProgTmp >>

Spec == Init /\ [][Next]_<< vars, vars2, depProg, depProgTmp, commonPre, locWorst >>

-----------------------------------------------------------------------------
NotCompleted == \E i \in 1..2: Len(progs[i].rest) > 0 \/ Cardinality(Exec1!Done) < ProgLen \/ Cardinality(Exec2!Done) < ProgLen

-----------------------------------------------------------------------------
ProgDone(n) == \A l \in 1..2: \E i \in 1..Len(progs[l].exec):
                progs[l].exec[i].PC.pc = ProgLen /\ progs[l].exec[i].done

ComTime(ex,n) == progs[ex].exec[n].comTime

\* Heights of steps
StepHeight(ex,k) == IF k = 1 THEN ComTime(ex,1) ELSE ComTime(ex,k)-ComTime(ex,k-1)
NoTASteps == \A k \in 1..ProgLen-1: \A n \in k+1..ProgLen:
             IF /\ ProgDone(n)
                /\ StepHeight(1,k) < StepHeight(2,k)
                => ComTime(1,n) <= ComTime(2,n) \* As if strict inequality in def
             THEN TRUE
             ELSE PrintT(<< "TASteps encountered (<<First (loc) instr., Second (glob) instr., Delta_alpha, Delta_beta, Global end diff>>):",
                        k, n, StepHeight(1,k), StepHeight(2,k), ComTime(2,n)-ComTime(1,n) >>) /\ FALSE

\* Intersection in plota
NoTAInter == \A k \in 1..ProgLen-1: \A n \in k+1..ProgLen:
            IF /\ ProgDone(n)
               /\ ComTime(1,k) < ComTime(2,k)
               => ComTime(1,n) <= ComTime(2,n)
            THEN TRUE
            ELSE PrintT(<< "TAInter encountered (<<First (loc) instr., Second (glob) instr., Local diff, Global end diff>>):",
                        k, n, ComTime(2,k)-ComTime(1,k), ComTime(2,n)-ComTime(1,n) >>) /\ FALSE
NoTAInterPart(m) == \A k \in 1..m-1: \A n \in k+1..m:
                    /\ ProgDone(n)
                    /\ ComTime(1,k) < ComTime(2,k)
                    => ComTime(1,n) <= ComTime(2,n)

\* Locality (pipeline stages)
\* Prefixes must be the same for comparisons
NoTALoc == LET n == ProgLen IN
           IF /\ ProgDone(n)
              /\ ~locWorst[1]
              => locWorst[2] /\ ComTime(2,n) >= ComTime(1,n)
           THEN TRUE
           ELSE PrintT(<< "TALoc encountered (beta local worst case) <<Alpha global time, Beta global time>>):",
                        ComTime(1,n), ComTime(2,n) >>) /\ FALSE
NoTALocPart(m) == /\ ProgDone(m)
                  /\ ~locWorst[1]
                  => locWorst[2] /\ ComTime(2,m) >= ComTime(1,m)
              
\* Componenet occupation (parallel inversion)
NoTAComp == LET n == ProgLen IN
            LET FUusage(ex,fu) == FUs[ex][fu].usage IN
            LET usage(ex) == Sum({ [ fu |-> fu, val |-> FUusage(ex,fu) ]: fu \in locFU }) IN
            IF /\ ProgDone(n)
               /\ usage(1) < usage(2)
               => ComTime(1,n) <= ComTime(2,n)
            THEN TRUE
            ELSE PrintT(<< "TAComp encountered (<<alpha occupation, beta occ, alpha global time, beta global time>>):",
                        usage(1), usage(2), ComTime(1,n), ComTime(2,n) >>) /\ FALSE
            
=============================================================================