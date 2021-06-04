***
*** This file shows TLC's output for the basic "$ tlc MC.tla" and explains how to read it, with comments indicated in the same format as this text.
***


TLC2 Version 2.16 of 31 December 2020 (rev: cdddf55)
Running breadth-first search Model-Checking with fp 75 and seed 1296240582972364067 with 1 worker on 4 cores with 3481MB heap and 64MB offheap memory [pid: 22620] (Linux 5.4.0-73-generic amd64, Oracle Corporation 14.0.2 x86_64, MSBDiskFPSet, DiskStateQueue).
Parsing file /home/benjaminbinder/Documents/timing-anomalies/tla/OoO/pipeline_ooo.toolbox/background/MC.tla
Parsing file /home/benjaminbinder/Documents/timing-anomalies/tla/OoO/pipeline_ooo.toolbox/background/pipeline_ooo.tla
Parsing file /tmp/TLC.tla
Parsing file /tmp/Sequences.tla
Parsing file /home/benjaminbinder/Documents/timing-anomalies/tla/OoO/pipeline_ooo.toolbox/background/instructions_ooo.tla
Parsing file /tmp/Integers.tla
Parsing file /tmp/FiniteSets.tla
Parsing file /tmp/Naturals.tla
Parsing file /home/benjaminbinder/Documents/timing-anomalies/tla/OoO/pipeline_ooo.toolbox/background/pipeline_exec_ooo.tla
Semantic processing of module Naturals
Semantic processing of module Sequences
Semantic processing of module Integers
Semantic processing of module instructions_ooo
Semantic processing of module FiniteSets
Semantic processing of module TLC
Semantic processing of module pipeline_exec_ooo
Semantic processing of module pipeline_ooo
Semantic processing of module MC
Starting...
Computing initial states...
Computed 2 initial states...
Finished computing initial states: 4 distinct states generated at 2021-06-04 12:44:09.


***
*** TLC indication (from our specification of the property) helping understand the CEX (counterexample).
*** Here it indicates that a TA was encountered according to TAInter. The related inversion is characterized by two arrows from the commit of two given ("first" and "second") instructions in one trace to the commit of the same instructions in the other trace. TLC reports which are those instructions: the first (1) instruction of the program and the fourth (4) (i.e., last) one. 
*** Moreover, it reports the horizontal shift of both arrows, i.e., the (positive or negative) delay of the commit events of the instructions in the second trace wrt. the first one. 
*** Here, the first arrow is inclined towards the right with 2 cycles, while the second arrow is inclined towards the left with 2 cycles, which explains the actual TA.
***

<< "TAInter encountered (<<First (loc) instr., Second (glob) instr., Local diff, Global end diff>>):",
   1,
   4,
   2,
   -2 >>
   
   
***
*** TLC reported these program executions because they are a CEX for the absence of TAs according to TAInter (in particular), i.e., TAInter states the presence of a TA.
***

Error: Invariant NoTAInter is violated.


***
*** Then, there is the very CEX with the successive reached states. One can mainly see that in trace 2, all actual FU latencies (FULat2) are 3, whereas the actual FU latency of the 1st instruction is 1 in the first trace (FULat). FU and FU2 show the actual FUs used by the instructions: in both traces, FU1 for the 1st and the 4th instructions, FU2 for the 2nd and the 3rd instructions (in both traces).
***

Error: The behavior up to this point is:
State 1: <Initial predicate>
/\ FULat2 = <<3, 3, 3, 3>>
/\ iMiss2 = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS2 = <<{}, {}>>
/\ locWorst = <<FALSE, FALSE>>
/\ _COM2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _IF = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ FUTmpLat = <<<<<<1, 3>>, 3>>, 3>>
/\ _FU2 = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 0,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 0,
     baseLat |-> 1 ] >>
/\ FUTmp = <<<<<<1, 2>>, 2>>, 1>>
/\ _COM = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ currCycle2 = 0
/\ FU2 = <<1, 2, 2, 1>>
/\ _IF2 = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ iMissTmp2 = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ iMiss = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS = <<{}, {}>>
/\ commonPre = TRUE
/\ currCycle = 0
/\ iMissTmp = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ FULat = <<1, 3, 3, 3>>
/\ FUTmp2 = <<<<<<1, 2>>, 2>>, 1>>
/\ prog = [ rest |->
      << [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
         [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
         [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
         [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}] >>,
  exec |-> <<>> ]
/\ depProg = <<>>
/\ FUTmpLat2 = <<<<<<3, 3>>, 3>>, 3>>
/\ depProgTmp = <<>>
/\ prog2 = [ rest |->
      << [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
         [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
         [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
         [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}] >>,
  exec |-> <<>> ]
/\ FU = <<1, 2, 2, 1>>
/\ _FU = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 0,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 0,
     baseLat |-> 1 ] >>

     
***
*** Next, one can see the full advancement of each instruction through the pipeline until the CEX is found (violation of a property).
***

State 2: <Next line 78, col 9 to line 100, col 103 of module pipeline_ooo>
/\ FULat2 = <<3, 3, 3, 3>>
/\ iMiss2 = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS2 = <<{}, {}>>
/\ locWorst = <<TRUE, TRUE>>
/\ _COM2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _IF = << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
     currLat |-> 1,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
     currLat |-> 1,
     baseLat |-> 1 ] >>
/\ FUTmpLat = <<<<<<1, 3>>, 3>>, 3>>
/\ _FU2 = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 0,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 0,
     baseLat |-> 1 ] >>
/\ FUTmp = <<<<<<1, 2>>, 2>>, 1>>
/\ _COM = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ currCycle2 = 1
/\ FU2 = <<1, 2, 2, 1>>
/\ _IF2 = << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
     currLat |-> 1,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
     currLat |-> 1,
     baseLat |-> 1 ] >>
/\ iMissTmp2 = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ iMiss = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS = <<{}, {}>>
/\ commonPre = TRUE
/\ currCycle = 1
/\ iMissTmp = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ FULat = <<1, 3, 3, 3>>
/\ FUTmp2 = <<<<<<1, 2>>, 2>>, 1>>
/\ prog = [ rest |->
      << [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
         [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}] >>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ] >> ]
/\ depProg = <<>>
/\ FUTmpLat2 = <<<<<<3, 3>>, 3>>, 3>>
/\ depProgTmp = <<>>
/\ prog2 = [ rest |->
      << [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
         [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}] >>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ] >> ]
/\ FU = <<1, 2, 2, 1>>
/\ _FU = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 0,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 0,
     baseLat |-> 1 ] >>

State 3: <Next line 78, col 9 to line 100, col 103 of module pipeline_ooo>
/\ FULat2 = <<3, 3, 3, 3>>
/\ iMiss2 = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS2 = <<{}, {}>>
/\ locWorst = <<TRUE, TRUE>>
/\ _COM2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID = << [PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}]],
   [PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}]] >>
/\ _IF = << [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
     currLat |-> 1,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
     currLat |-> 1,
     baseLat |-> 1 ] >>
/\ FUTmpLat = <<<<<<1, 3>>, 3>>, 3>>
/\ _FU2 = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 0,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 0,
     baseLat |-> 1 ] >>
/\ FUTmp = <<<<<<1, 2>>, 2>>, 1>>
/\ _COM = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID2 = << [PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}]],
   [PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}]] >>
/\ currCycle2 = 2
/\ FU2 = <<1, 2, 2, 1>>
/\ _IF2 = << [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
     currLat |-> 1,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
     currLat |-> 1,
     baseLat |-> 1 ] >>
/\ iMissTmp2 = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ iMiss = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS = <<{}, {}>>
/\ commonPre = TRUE
/\ currCycle = 2
/\ iMissTmp = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ FULat = <<1, 3, 3, 3>>
/\ FUTmp2 = <<<<<<1, 2>>, 2>>, 1>>
/\ prog = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ] >> ]
/\ depProg = <<>>
/\ FUTmpLat2 = <<<<<<3, 3>>, 3>>, 3>>
/\ depProgTmp = <<>>
/\ prog2 = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ] >> ]
/\ FU = <<1, 2, 2, 1>>
/\ _FU = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 0,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 0,
     baseLat |-> 1 ] >>

State 4: <Next line 78, col 9 to line 100, col 103 of module pipeline_ooo>
/\ FULat2 = <<3, 3, 3, 3>>
/\ iMiss2 = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS2 = <<{}, {[pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}]}>>
/\ locWorst = <<TRUE, TRUE>>
/\ _COM2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID = << [PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}]],
   [PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}]] >>
/\ _IF = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ FUTmpLat = <<<<<<1, 3>>, 3>>, 3>>
/\ _FU2 = << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
     currLat |-> 1,
     usage |-> 1,
     baseLat |-> 3 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 0,
     baseLat |-> 1 ] >>
/\ FUTmp = <<<<<<1, 2>>, 2>>, 1>>
/\ _COM = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID2 = << [PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}]],
   [PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}]] >>
/\ currCycle2 = 3
/\ FU2 = <<1, 2, 2, 1>>
/\ _IF2 = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ iMissTmp2 = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ iMiss = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS = <<{}, {[pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}]}>>
/\ commonPre = TRUE
/\ currCycle = 3
/\ iMissTmp = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ FULat = <<1, 3, 3, 3>>
/\ FUTmp2 = <<<<<<1, 2>>, 2>>, 1>>
/\ prog = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ] >> ]
/\ depProg = <<>>
/\ FUTmpLat2 = <<<<<<3, 3>>, 3>>, 3>>
/\ depProgTmp = <<>>
/\ prog2 = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ] >> ]
/\ FU = <<1, 2, 2, 1>>
/\ _FU = << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
     currLat |-> 1,
     usage |-> 1,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 0,
     baseLat |-> 1 ] >>

State 5: <Next line 78, col 9 to line 100, col 103 of module pipeline_ooo>
/\ FULat2 = <<3, 3, 3, 3>>
/\ iMiss2 = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS2 = << {[pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}]},
   {[pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}]} >>
/\ locWorst = <<FALSE, TRUE>>
/\ _COM2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _IF = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ FUTmpLat = <<<<<<1, 3>>, 3>>, 3>>
/\ _FU2 = << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
     currLat |-> 2,
     usage |-> 2,
     baseLat |-> 3 ],
   [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
     currLat |-> 1,
     usage |-> 1,
     baseLat |-> 3 ] >>
/\ FUTmp = <<<<<<1, 2>>, 2>>, 1>>
/\ _COM = << [PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}]],
   [PC |-> [pc |-> 0, type |-> "empty"]] >>
/\ _ID2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ currCycle2 = 4
/\ FU2 = <<1, 2, 2, 1>>
/\ _IF2 = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ iMissTmp2 = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ iMiss = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS = << {[pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}]},
   {[pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}]} >>
/\ commonPre = FALSE
/\ currCycle = 4
/\ iMissTmp = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ FULat = <<1, 3, 3, 3>>
/\ FUTmp2 = <<<<<<1, 2>>, 2>>, 1>>
/\ prog = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ] >> ]
/\ depProg = <<>>
/\ FUTmpLat2 = <<<<<<3, 3>>, 3>>, 3>>
/\ depProgTmp = <<>>
/\ prog2 = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ] >> ]
/\ FU = <<1, 2, 2, 1>>
/\ _FU = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 1,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
     currLat |-> 1,
     usage |-> 1,
     baseLat |-> 3 ] >>

State 6: <Next line 78, col 9 to line 100, col 103 of module pipeline_ooo>
/\ FULat2 = <<3, 3, 3, 3>>
/\ iMiss2 = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS2 = << {[pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}]},
   {[pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}]} >>
/\ locWorst = <<FALSE, TRUE>>
/\ _COM2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _IF = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ FUTmpLat = <<<<<<1, 3>>, 3>>, 3>>
/\ _FU2 = << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
     currLat |-> 3,
     usage |-> 3,
     baseLat |-> 3 ],
   [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
     currLat |-> 2,
     usage |-> 2,
     baseLat |-> 3 ] >>
/\ FUTmp = <<<<<<1, 2>>, 2>>, 1>>
/\ _COM = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ currCycle2 = 5
/\ FU2 = <<1, 2, 2, 1>>
/\ _IF2 = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ iMissTmp2 = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ iMiss = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS = << {[pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}]},
   {[pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}]} >>
/\ commonPre = FALSE
/\ currCycle = 5
/\ iMissTmp = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ FULat = <<1, 3, 3, 3>>
/\ FUTmp2 = <<<<<<1, 2>>, 2>>, 1>>
/\ prog = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 4,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ] >> ]
/\ depProg = <<>>
/\ FUTmpLat2 = <<<<<<3, 3>>, 3>>, 3>>
/\ depProgTmp = <<>>
/\ prog2 = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ] >> ]
/\ FU = <<1, 2, 2, 1>>
/\ _FU = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 1,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
     currLat |-> 2,
     usage |-> 2,
     baseLat |-> 3 ] >>

State 7: <Next line 78, col 9 to line 100, col 103 of module pipeline_ooo>
/\ FULat2 = <<3, 3, 3, 3>>
/\ iMiss2 = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS2 = << {[pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}]},
   {[pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}]} >>
/\ locWorst = <<FALSE, TRUE>>
/\ _COM2 = << [PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}]],
   [PC |-> [pc |-> 0, type |-> "empty"]] >>
/\ _ID = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _IF = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ FUTmpLat = <<<<<<1, 3>>, 3>>, 3>>
/\ _FU2 = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 3,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
     currLat |-> 3,
     usage |-> 3,
     baseLat |-> 3 ] >>
/\ FUTmp = <<<<<<1, 2>>, 2>>, 1>>
/\ _COM = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ currCycle2 = 6
/\ FU2 = <<1, 2, 2, 1>>
/\ _IF2 = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ iMissTmp2 = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ iMiss = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS = << {[pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}]},
   {[pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}]} >>
/\ commonPre = FALSE
/\ currCycle = 6
/\ iMissTmp = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ FULat = <<1, 3, 3, 3>>
/\ FUTmp2 = <<<<<<1, 2>>, 2>>, 1>>
/\ prog = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 4,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ] >> ]
/\ depProg = <<>>
/\ FUTmpLat2 = <<<<<<3, 3>>, 3>>, 3>>
/\ depProgTmp = <<>>
/\ prog2 = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ] >> ]
/\ FU = <<1, 2, 2, 1>>
/\ _FU = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 1,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
     currLat |-> 3,
     usage |-> 3,
     baseLat |-> 3 ] >>

State 8: <Next line 78, col 9 to line 100, col 103 of module pipeline_ooo>
/\ FULat2 = <<3, 3, 3, 3>>
/\ iMiss2 = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS2 = <<{}, {}>>
/\ locWorst = <<FALSE, TRUE>>
/\ _COM2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _IF = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ FUTmpLat = <<<<<<1, 3>>, 3>>, 3>>
/\ _FU2 = << [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
     currLat |-> 1,
     usage |-> 4,
     baseLat |-> 3 ],
   [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
     currLat |-> 1,
     usage |-> 4,
     baseLat |-> 3 ] >>
/\ FUTmp = <<<<<<1, 2>>, 2>>, 1>>
/\ _COM = << [PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}]],
   [PC |-> [pc |-> 0, type |-> "empty"]] >>
/\ _ID2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ currCycle2 = 7
/\ FU2 = <<1, 2, 2, 1>>
/\ _IF2 = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ iMissTmp2 = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ iMiss = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS = <<{[pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}]}, {}>>
/\ commonPre = FALSE
/\ currCycle = 7
/\ iMissTmp = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ FULat = <<1, 3, 3, 3>>
/\ FUTmp2 = <<<<<<1, 2>>, 2>>, 1>>
/\ prog = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 4,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ] >> ]
/\ depProg = <<>>
/\ FUTmpLat2 = <<<<<<3, 3>>, 3>>, 3>>
/\ depProgTmp = <<>>
/\ prog2 = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 6,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 6 ] >> ]
/\ FU = <<1, 2, 2, 1>>
/\ _FU = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 1,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
     currLat |-> 1,
     usage |-> 4,
     baseLat |-> 3 ] >>

State 9: <Next line 78, col 9 to line 100, col 103 of module pipeline_ooo>
/\ FULat2 = <<3, 3, 3, 3>>
/\ iMiss2 = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS2 = <<{}, {}>>
/\ locWorst = <<FALSE, TRUE>>
/\ _COM2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _IF = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ FUTmpLat = <<<<<<1, 3>>, 3>>, 3>>
/\ _FU2 = << [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
     currLat |-> 2,
     usage |-> 5,
     baseLat |-> 3 ],
   [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
     currLat |-> 2,
     usage |-> 5,
     baseLat |-> 3 ] >>
/\ FUTmp = <<<<<<1, 2>>, 2>>, 1>>
/\ _COM = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ currCycle2 = 8
/\ FU2 = <<1, 2, 2, 1>>
/\ _IF2 = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ iMissTmp2 = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ iMiss = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS = <<{[pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}]}, {}>>
/\ commonPre = FALSE
/\ currCycle = 8
/\ iMissTmp = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ FULat = <<1, 3, 3, 3>>
/\ FUTmp2 = <<<<<<1, 2>>, 2>>, 1>>
/\ prog = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 4,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> TRUE,
           comTime |-> 7,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ] >> ]
/\ depProg = <<>>
/\ FUTmpLat2 = <<<<<<3, 3>>, 3>>, 3>>
/\ depProgTmp = <<>>
/\ prog2 = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 6,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 6 ] >> ]
/\ FU = <<1, 2, 2, 1>>
/\ _FU = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 1,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
     currLat |-> 2,
     usage |-> 5,
     baseLat |-> 3 ] >>

State 10: <Next line 78, col 9 to line 100, col 103 of module pipeline_ooo>
/\ FULat2 = <<3, 3, 3, 3>>
/\ iMiss2 = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS2 = <<{}, {}>>
/\ locWorst = <<FALSE, TRUE>>
/\ _COM2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _IF = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ FUTmpLat = <<<<<<1, 3>>, 3>>, 3>>
/\ _FU2 = << [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
     currLat |-> 3,
     usage |-> 6,
     baseLat |-> 3 ],
   [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
     currLat |-> 3,
     usage |-> 6,
     baseLat |-> 3 ] >>
/\ FUTmp = <<<<<<1, 2>>, 2>>, 1>>
/\ _COM = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ currCycle2 = 9
/\ FU2 = <<1, 2, 2, 1>>
/\ _IF2 = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ iMissTmp2 = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ iMiss = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS = <<{[pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}]}, {}>>
/\ commonPre = FALSE
/\ currCycle = 9
/\ iMissTmp = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ FULat = <<1, 3, 3, 3>>
/\ FUTmp2 = <<<<<<1, 2>>, 2>>, 1>>
/\ prog = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 4,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> TRUE,
           comTime |-> 7,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 0 ] >> ]
/\ depProg = <<>>
/\ FUTmpLat2 = <<<<<<3, 3>>, 3>>, 3>>
/\ depProgTmp = <<>>
/\ prog2 = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 6,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 6 ] >> ]
/\ FU = <<1, 2, 2, 1>>
/\ _FU = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 1,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
     currLat |-> 3,
     usage |-> 6,
     baseLat |-> 3 ] >>

State 11: <Next line 78, col 9 to line 100, col 103 of module pipeline_ooo>
/\ FULat2 = <<3, 3, 3, 3>>
/\ iMiss2 = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS2 = <<{}, {}>>
/\ locWorst = <<FALSE, TRUE>>
/\ _COM2 = << [PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}]],
   [PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}]] >>
/\ _ID = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _IF = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ FUTmpLat = <<<<<<1, 3>>, 3>>, 3>>
/\ _FU2 = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 6,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 6,
     baseLat |-> 1 ] >>
/\ FUTmp = <<<<<<1, 2>>, 2>>, 1>>
/\ _COM = << [PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}]],
   [PC |-> [pc |-> 0, type |-> "empty"]] >>
/\ _ID2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ currCycle2 = 10
/\ FU2 = <<1, 2, 2, 1>>
/\ _IF2 = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ iMissTmp2 = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ iMiss = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS = <<{}, {}>>
/\ commonPre = FALSE
/\ currCycle = 10
/\ iMissTmp = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ FULat = <<1, 3, 3, 3>>
/\ FUTmp2 = <<<<<<1, 2>>, 2>>, 1>>
/\ prog = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 4,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> TRUE,
           comTime |-> 7,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> TRUE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 9 ] >> ]
/\ depProg = <<>>
/\ FUTmpLat2 = <<<<<<3, 3>>, 3>>, 3>>
/\ depProgTmp = <<>>
/\ prog2 = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 6,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> TRUE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> TRUE,
           exStartTime |-> 6 ] >> ]
/\ FU = <<1, 2, 2, 1>>
/\ _FU = << [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
     currLat |-> 1,
     usage |-> 2,
     baseLat |-> 3 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 6,
     baseLat |-> 1 ] >>

State 12: <Next line 78, col 9 to line 100, col 103 of module pipeline_ooo>
/\ FULat2 = <<3, 3, 3, 3>>
/\ iMiss2 = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS2 = <<{}, {}>>
/\ locWorst = <<FALSE, TRUE>>
/\ _COM2 = << [PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}]],
   [PC |-> [pc |-> 0, type |-> "empty"]] >>
/\ _ID = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _IF = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ FUTmpLat = <<<<<<1, 3>>, 3>>, 3>>
/\ _FU2 = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 6,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 6,
     baseLat |-> 1 ] >>
/\ FUTmp = <<<<<<1, 2>>, 2>>, 1>>
/\ _COM = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ currCycle2 = 11
/\ FU2 = <<1, 2, 2, 1>>
/\ _IF2 = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ iMissTmp2 = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ iMiss = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS = <<{}, {}>>
/\ commonPre = FALSE
/\ currCycle = 11
/\ iMissTmp = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ FULat = <<1, 3, 3, 3>>
/\ FUTmp2 = <<<<<<1, 2>>, 2>>, 1>>
/\ prog = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 4,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> TRUE,
           comTime |-> 7,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 10,
           executed |-> TRUE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 9 ] >> ]
/\ depProg = <<>>
/\ FUTmpLat2 = <<<<<<3, 3>>, 3>>, 3>>
/\ depProgTmp = <<>>
/\ prog2 = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 6,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> TRUE,
           comTime |-> 10,
           executed |-> TRUE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 10,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> TRUE,
           exStartTime |-> 6 ] >> ]
/\ FU = <<1, 2, 2, 1>>
/\ _FU = << [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
     currLat |-> 2,
     usage |-> 3,
     baseLat |-> 3 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 6,
     baseLat |-> 1 ] >>

State 13: <Next line 78, col 9 to line 100, col 103 of module pipeline_ooo>
/\ FULat2 = <<3, 3, 3, 3>>
/\ iMiss2 = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS2 = <<{}, {}>>
/\ locWorst = <<FALSE, TRUE>>
/\ _COM2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _IF = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ FUTmpLat = <<<<<<1, 3>>, 3>>, 3>>
/\ _FU2 = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 6,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 6,
     baseLat |-> 1 ] >>
/\ FUTmp = <<<<<<1, 2>>, 2>>, 1>>
/\ _COM = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ currCycle2 = 12
/\ FU2 = <<1, 2, 2, 1>>
/\ _IF2 = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ iMissTmp2 = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ iMiss = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS = <<{}, {}>>
/\ commonPre = FALSE
/\ currCycle = 12
/\ iMissTmp = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ FULat = <<1, 3, 3, 3>>
/\ FUTmp2 = <<<<<<1, 2>>, 2>>, 1>>
/\ prog = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 4,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> TRUE,
           comTime |-> 7,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 10,
           executed |-> TRUE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> FALSE,
           exStartTime |-> 9 ] >> ]
/\ depProg = <<>>
/\ FUTmpLat2 = <<<<<<3, 3>>, 3>>, 3>>
/\ depProgTmp = <<>>
/\ prog2 = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 6,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> TRUE,
           comTime |-> 10,
           executed |-> TRUE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 10,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> TRUE,
           comTime |-> 11,
           executed |-> TRUE,
           exStartTime |-> 6 ] >> ]
/\ FU = <<1, 2, 2, 1>>
/\ _FU = << [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
     currLat |-> 3,
     usage |-> 4,
     baseLat |-> 3 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 6,
     baseLat |-> 1 ] >>

State 14: <Next line 78, col 9 to line 100, col 103 of module pipeline_ooo>
/\ FULat2 = <<3, 3, 3, 3>>
/\ iMiss2 = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS2 = <<{}, {}>>
/\ locWorst = <<FALSE, TRUE>>
/\ _COM2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _IF = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ FUTmpLat = <<<<<<1, 3>>, 3>>, 3>>
/\ _FU2 = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 6,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 6,
     baseLat |-> 1 ] >>
/\ FUTmp = <<<<<<1, 2>>, 2>>, 1>>
/\ _COM = << [PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}]],
   [PC |-> [pc |-> 0, type |-> "empty"]] >>
/\ _ID2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ currCycle2 = 12
/\ FU2 = <<1, 2, 2, 1>>
/\ _IF2 = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ iMissTmp2 = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ iMiss = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS = <<{}, {}>>
/\ commonPre = FALSE
/\ currCycle = 13
/\ iMissTmp = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ FULat = <<1, 3, 3, 3>>
/\ FUTmp2 = <<<<<<1, 2>>, 2>>, 1>>
/\ prog = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 4,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> TRUE,
           comTime |-> 7,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 10,
           executed |-> TRUE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> FALSE,
           comTime |-> 0,
           executed |-> TRUE,
           exStartTime |-> 9 ] >> ]
/\ depProg = <<>>
/\ FUTmpLat2 = <<<<<<3, 3>>, 3>>, 3>>
/\ depProgTmp = <<>>
/\ prog2 = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 6,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> TRUE,
           comTime |-> 10,
           executed |-> TRUE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 10,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> TRUE,
           comTime |-> 11,
           executed |-> TRUE,
           exStartTime |-> 6 ] >> ]
/\ FU = <<1, 2, 2, 1>>
/\ _FU = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 4,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 6,
     baseLat |-> 1 ] >>

State 15: <Next line 78, col 9 to line 100, col 103 of module pipeline_ooo>
/\ FULat2 = <<3, 3, 3, 3>>
/\ iMiss2 = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS2 = <<{}, {}>>
/\ locWorst = <<FALSE, TRUE>>
/\ _COM2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _IF = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ FUTmpLat = <<<<<<1, 3>>, 3>>, 3>>
/\ _FU2 = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 6,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 6,
     baseLat |-> 1 ] >>
/\ FUTmp = <<<<<<1, 2>>, 2>>, 1>>
/\ _COM = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ _ID2 = <<[PC |-> [pc |-> 0, type |-> "empty"]], [PC |-> [pc |-> 0, type |-> "empty"]]>>
/\ currCycle2 = 12
/\ FU2 = <<1, 2, 2, 1>>
/\ _IF2 = << [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1],
   [PC |-> [pc |-> 0, type |-> "empty"], currLat |-> 1, baseLat |-> 1] >>
/\ iMissTmp2 = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ iMiss = <<FALSE, FALSE, FALSE, FALSE>>
/\ _RS = <<{}, {}>>
/\ commonPre = FALSE
/\ currCycle = 14
/\ iMissTmp = <<<<<<FALSE, FALSE>>, FALSE>>, FALSE>>
/\ FULat = <<1, 3, 3, 3>>
/\ FUTmp2 = <<<<<<1, 2>>, 2>>, 1>>
/\ prog = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 4,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> TRUE,
           comTime |-> 7,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 10,
           executed |-> TRUE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> TRUE,
           comTime |-> 13,
           executed |-> TRUE,
           exStartTime |-> 9 ] >> ]
/\ depProg = <<>>
/\ FUTmpLat2 = <<<<<<3, 3>>, 3>>, 3>>
/\ depProgTmp = <<>>
/\ prog2 = [ rest |-> <<>>,
  exec |->
      << [ PC |-> [pc |-> 1, type |-> {1}, lat |-> {1, 3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 6,
           executed |-> TRUE,
           exStartTime |-> 2 ],
         [ PC |-> [pc |-> 2, type |-> {2}, lat |-> {3}, dep |-> {1}],
           done |-> TRUE,
           comTime |-> 10,
           executed |-> TRUE,
           exStartTime |-> 6 ],
         [ PC |-> [pc |-> 3, type |-> {2}, lat |-> {3}, dep |-> {}],
           done |-> TRUE,
           comTime |-> 10,
           executed |-> TRUE,
           exStartTime |-> 3 ],
         [ PC |-> [pc |-> 4, type |-> {1}, lat |-> {3}, dep |-> {3}],
           done |-> TRUE,
           comTime |-> 11,
           executed |-> TRUE,
           exStartTime |-> 6 ] >> ]
/\ FU = <<1, 2, 2, 1>>
/\ _FU = << [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 4,
     baseLat |-> 1 ],
   [ PC |-> [pc |-> 0, type |-> "empty"],
     currLat |-> 1,
     usage |-> 6,
     baseLat |-> 1 ] >>


***
*** Here, TLC reports statistics on the state space.
***

58 states generated, 57 distinct states found, 2 states left on queue.
The depth of the complete state graph search is 15.
The average outdegree of the complete state graph is 1 (minimum is 0, the maximum 1 and the 95th percentile is 1).
