------------------------------ MODULE pipeline_ooo ------------------------------
EXTENDS Sequences, instructions_ooo, Integers, TLC, FiniteSets, TAExpl
VARIABLES currCycle, pc, _IF, _ID, _RS, _FU, _COM, rob, robHead, graph, exec_inst
VARIABLES currCycle2, pc2, _IF2, _ID2, _RS2, _FU2, _COM2, rob2, robHead2, graph2, exec_inst2
VARIABLE lastBound\*, cpt

ASSUME InitOutputFile(name, missLat, superscal, RSsize, robSize, lat)
-----------------------------------------------------------------------------

vars == << currCycle, pc, _IF, _ID, _RS, _FU, _COM, rob, robHead, graph, exec_inst >>
vars2 == << currCycle2, pc2, _IF2, _ID2, _RS2, _FU2, _COM2, rob2, robHead2, graph2, exec_inst2 >>
IFs == << _IF, _IF2 >>
FUs == << _FU, _FU2 >>
robs == << rob, rob2 >>
-----------------------------------------------------------------------------

GraphBound == Min({robHead, robHead2}) - 1

Variation == [ i \in lastBound..GraphBound |-> graph.nodes[i] ] /= [ i \in lastBound..GraphBound |-> graph2.nodes[i] ]
\*Variation == [ i \in 1..GraphBound |-> graph.nodes[i] ] /= [ i \in 1..GraphBound |-> graph2.nodes[i] ]

SubGraph(g) == [ nodes |-> [ i \in lastBound..GraphBound |-> g.nodes[i] ], edges |-> g.edges ]
-----------------------------------------------------------------------------

\* 1st instance of the pipeline for one execution trace
Exec1 == INSTANCE pipeline_exec_ooo
\* 2nd instance of the pipeline with the same input instructions for another execution trace
Exec2 == INSTANCE pipeline_exec_ooo
         WITH currCycle <- currCycle2,
              pc <- pc2,
              _IF <- _IF2,
              _ID <- _ID2,
              _RS <- _RS2,
              _FU <- _FU2,
              _COM <- _COM2,
              rob <- rob2,
              robHead <- robHead2,
              graph <- graph2,
              exec_inst <- exec_inst2
              
-----------------------------------------------------------------------------

CheckTA == /\ Exec1!Exec \ Exec1!Done = {}
           /\ Exec2!Exec \ Exec2!Done = {}
           /\ Variation
           \*/\ GraphBound > 0
           
NoTA(onlyCom) == CheckTA => ~HasTA(SubGraph(graph), SubGraph(graph2), currCycle, onlyCom)
-----------------------------------------------------------------------------
              
Init == /\ Exec1!Init
        /\ Exec2!Init
        /\ exec_inst = 1
        /\ exec_inst2 = 2
        /\ lastBound = 1
        \*/\ cpt = 0

Next == /\ Exec1!Next
        /\ Exec2!Next
        /\ IF /\ CheckTA 
              /\ vars' /= vars \/ vars2' /= vars2
           THEN lastBound' = GraphBound \*/\ cpt' = cpt+1 /\ PrintT(cpt')
           ELSE UNCHANGED <<lastBound>>\*, cpt>>

Spec == Init /\ [][Next]_<< vars, vars2, lastBound >>\*, cpt >>
=============================================================================
