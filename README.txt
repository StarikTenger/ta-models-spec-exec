### This repository contains a parametric standard OoO pipeline model, along with a detection procedure of counter-intuitive Timing Anomalies (TAs).
### B. Binder, M. Asavoae, F. Brandner, B. Ben Hedia, and M. Jan (RTCSA 2022)
### Tested with the TLA+ Toolbox Version 1.7.1 of 31 December 2020 and the TLC Version 2.16 of 31 December 2020.


This repository contains:
	1. the specification of a configurable OoO pipeline based on Tomasulo's algorithm
	2. the implementation of our detection procedure of TAs for this specification

Detailed content:
	- README.txt: this file.
	- pipeline_exec_ooo.tla is the specification of the OoO pipeline.
	- pipeline_ooo.tla is the extended specification instantiating twice pipeline_exec_ooo for 2-safety properties (duplication of the pipeline for considering 2 execution traces simultaneously). It contains the property for verifying the absence of TAs.
	- instructions_ooo.tla contains helper definitions.
	- pipeline_ooo.toolbox/: contains one folder per execution scenario.
	- graph_generator_tlc.py: the implementation of the detection procedure in Python. It takes as inputs arguments supplied by TLC and is intended to be called by TLC.
	- graph_generator_tlc_only_com.py: a variant where only TAs triggered at commit events are reported.
	- graph_generator_bench.py: a standalone version that operates on a trace a posteriori (provided that a counterexample has been found), moreover producing some data visualization.
	- lib/TAExpl.tla: the TLA+ module that defines the operator used in the property for the absence of TAs.
	- lib/TAExpl.java: the Java class that overrides the TLA+ module (WARNING: the paths of the py files need to be adapted and the class compiled again).
	- simu/parse_simu.py: computes the values of the TLA+ specification's parameters from a GEM5 simulation trace (WARNING: the corresponding parameter in the TLA+ specification needs to have the same value as variable BUFF_LEN in this code and variable N_instr may be adapted to fix the number of instructions that are considered in the simulation trace and the input program).
	- simu/gen_trace.sh: the full workflow of the setting-up procedure that prepares the input parameters of the TLA+ specification (relying on the previous, Python file) from a given C code (WARNING: the location of GEM5 needs to be adapted).
	
	
How to run:
	1) Make sure GEM5 is installed.
	2) Make all necessary changes in the sources (see warnings above) and compile the Java class.
	3) Execute the shell script by providing an input C file.
	4) Create a TLA+ model by providing the values of the parameters supplied by the shell script (and the ROB size), as well as values for the other, free parameters (e.g., latencies).
	5) Run TLC to verify the NoTA property.
	6) If TLC finds a counterexample, then run graph_generator_bench.py, providing as an argument the path of the MC_TE.out file produced by TLC (stored in pipeline_ooo.toolbox/themodel/). This will generate visual representations of the graphs.
