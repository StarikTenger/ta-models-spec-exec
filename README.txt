### This repository contains a parameterizable standard OoO pipeline model along with properties for assessing the formal definitions of Timing Anomalies (TAs).
### B. Binder, M. Asavoae, B. Ben Hedia, F. Brandner, M. Jan (RTCSA 2021)
### Tested with the TLA+ Toolbox Version 1.7.1 of 31 December 2020 and the TLC Version 2.16 of 31 December 2020.


This repository contains:
	1. the specification of a configurable OoO pipeline based on Tomasulo's algorithm
	2. the implementation of several formal definitions applied on this architecture

Detailed content:
	- README.txt: this file.
	- pipeline_exec_ooo.tla is the specification of the OoO pipeline. (PDF version available in the repository)
	- pipeline_ooo.tla is the extended specification instantiating twice pipeline_exec_ooo for 2-safety properties (duplication of the pipeline for considering 2 execution traces simultaneously). It contains the implementation of the formal definitions. (PDF version available in the repository)
	- instructions_ooo.tla contains helper definitions for manipulating the program. (PDF version available in the repository)
	- pipeline_ooo.toolbox/: contains one folder per execution scenario (background + counterexamples for TAs)
	- latex_trace_generator.py: a script for exporting the traces into the basic latex-table representation used in the paper, from the raw error-trace export of the toolbox.

	
How to run:
	* In command lines (https://github.com/pmer/tla-bin)
		Simply go to the directory of the desired scenario and:
		$ tlc MC.tla
		This will print: "Error: Invariant ... is violated.", as well as the error trace. Above there is additional textual information for helping understand the trace.
		*** NOTE *** The background folder contains a README.txt file with an output example extended with annotations.
		
		The file MC.cfg specifies the properties to be verified. In case it contains several properties (for some scenarios) below the line "\* INVARIANT definition", one may comment them out successively (with \*) and run the tlc command again.
		
	* Within the toolbox
		Import the toolbox project, open the model related to the desired scenario and use the button to run TLC on the model. This will print "1 Error", along with the error-trace.
		The property to be verified are situated in the Invariants zone of the model overview tab. In case there are several formulas, one may uncheck all of them and run TLC again with a single one checked.
		One may use the error-trace-related button to export error-trace to clipboard as sequence of records, then paste the content to a text file, e.g., file.txt, and then use the the visualization script as follows:
		$ python latex_trace_generator.py file.txt ooo
		This will produce a latex representation with horizontal time.
		


More information:
-------------------------------------------------------------
Description of the constants to provide values:
Program					Sequence of instructions representing the input program, with execution constraints:
	Program[i].pc		(Abstract) address of the instruction (should be equal to i)
	Program[i].type		Set of functional units (FUs) operable for this instruction (FU affinities)
	Program[i].lat		Set of possible latencies in FUs
	Program[i].dep		Set of (addresses of) instructions on which this instruction depends (RAW)
	Program[i].imiss	Either {TRUE,FALSE} (aka BOOLEAN) for allowing an instruction cache miss or {TRUE}/{FALSE} for enforcing the cache behavior
locFU					Subset of functional units taken into account for the definition based on component occupation.
modeLen					-1
Architectural parameters:
varIF	  				Boolean allowing instruction cache misses (overwrites individual cache misses if not set)
superscal 				Max. number of instructions fetched/decoded/committed per cycle (number of identical in-order stages)
N_FU	  				Number of Functional Units (FUs)
missLat					Instruction cache miss latency
Lat						{}
