> forked from https://bitbucket.org/benjaminbinder/ta-models/src/master/

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
	- lib/TAExpl.java: the Java class that overrides the TLA+ module (WARNING: the DETECTPATH constant needs to be adapted with the absolute path to the current repository, and the class compiled again).
	- lib/TAExpl.class: the Java library for TLC (compile TAExpl.java as described below).
	- simu/parse_simu.py: computes the values of the TLA+ models' parameters from a GEM5 simulation trace (WARNING: some variables may be changed in accordance with the values of the parameters of the TLA+ models, see below).
	- simu/gen_trace.sh: the full workflow of the setting-up procedure that prepares the input parameters of the TLA+ specification (relying on the previous, Python file) from a given C code (WARNING: the location of GEM5 and the PATH environment variable with riscv64 need to be adapted).
	
	
How to run with the Toolbox:
	1) Make sure the riscv compiler and GEM5 are installed.
	2) Make the necessary changes in the Java source TAExpl.java (see WARNING above). Locate the file tla2tools.jar in the directory of your Toolbox installation and compile your Java file with this dependency (e.g., javac -cp /usr/local/lib/tla2tools.jar TAExpl.java).
	3) Add the library into the TLA+ toolbox (Menu > Preferences > TLA+ Preferences and add the "lib" directory into the TLA+ library path locations).
	4) Be prepared to add the spec into the toolbox (File menu > Open spec > Add new spec). Then supply the root-module file, i.e, "pipeline_ooo.tla" in the current repository; ignore the warning about an overwriting of the file and confirm.
	5) In parse_simu.py, N_INSTR fixes the number of instructions that will be considered in the simulation trace and the input program, and BUFF_LEN should be assigned the ROB size. Feel free to modify these variables.
	6) After adapting the shell script (see WARNING above), execute it by providing an (or several) input C file(s).
	7) Create a TLA+ model by providing the values of the parameters supplied by the shell script and the set value of BUFF_LEN for the ROB size, as well as values for the other, free parameters (e.g., latencies).
	8) Run TLC to verify the NoTA property.
	9) If TLC finds a counterexample, then run graph_generator_bench.py, providing as an argument the path of the MC_TE.out file produced by TLC (stored in pipeline_ooo.toolbox/themodel/). This will generate visual representations of the graphs.
