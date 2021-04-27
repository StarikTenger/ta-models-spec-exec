### pipeline_ooo ###

Contains:
	1. the specification of a configurable OoO pipeline based on Tomasulo's algorithm
	2. the implementation of several formal definitions suitable with this architecture
	
- pipeline_exec_ooo.tla is the specification of such one OoO pipeline.
- pipeline_ooo.tla is the extended specification instantiating pipeline_exec_ooo for 2-safety properties (duplication of the pipeline for considering 2 traces simultaneously). It contains the implementation of the formal definitions.
- instructions_ooo.tla contains helper definitions for manipulating the program.

The verification allows two modes:
	1. Code-specific: the input program is entirely specified, including RAW data dependencies.
	2. Code-independent: only the program's length is specified, along with the set of possible latencies in Functional Units (FUs). In this case, each instruction can execute on any FU, with any latency of the input set Lat, assuming that all RAW dependencies may exist in the program. This mode particularly requires guiding the verification by additional constraints.


Description of the constants to provide values:

modeLen		-1 for mode 1, program's length for mode 2.
Program		Only in mode 1 (ignored otherwise): sequence of instructions representing the input program, with execution constraints:
	Program[i].pc		(Abstract) address of the instruction (i)
	Program[i].type		Set of functional units (FUs) operable for this instruction
	Program[i].lat		Set of possible latencies in FUs
	Program[i].dep		Set of (addresses of) instructions on which this instruction depends (RAW)
	Program[i].imiss	Either {TRUE,FALSE} (aka BOOLEAN) for allowing an instruction cache miss or {TRUE}/{FALSE} for enforcing the cache behavior
locFU		Subset of functional units taken into account for the definition based on component usage.

Architectural parameters:
	varIF	  	Boolean allowing instruction cache misses (overwrites individual cache misses if not set)
	superscal 	Max. number of instructions fetched/decoded/committed per cycle (number of in-order stages)
	N_FU	  	Number of Functional Units (FUs)
	missLat		Instruction cache miss latency
	Lat		Only in mode 2 (ignored otherwise): set of possible latencies in FUs
