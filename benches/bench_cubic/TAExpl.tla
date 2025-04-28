---------------------------- MODULE TAExpl ----------------------------
\*LOCAL INSTANCE Sequences
\*LOCAL INSTANCE TLC
  (*************************************************************************)
  (* Imports the definitions from the modules, but doesn't export them.    *)
  (*************************************************************************)

-----------------------------------------------------------------------------

InitOutputFile(bench, _missLat, _superscal, _RSsize, _robSize, _lat, _mayDMiss) == TRUE

HasTA(g1, g2, cycle, onlyCom) == FALSE
=============================================================================

