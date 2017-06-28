(have it be able to bring up the text for the given page using \C-c\C-t)

(have it be able to toggle view of the workhorse formalization
 results, and compute them as needed)

(have it be able to do a lot more, such as close the pairs of
 windows, or jump to them even when buried.  i.e. act as a unit)

(fix the slight discrepancy in line nos if possible)

(have it have clear results integrated)

(have it be able to sync the formalization buffer to the original
 text, or the actual text)

(clean up the pagenos mechanism)

(make a better metadata standard, maybe in prolog, stored
 somewhere.)

(integrate IAEC)

(never try to formalize something that you are re-reading.
 Always formalize on the first pass.  The brain notices things
 the first times through, which are then made unconscious in
 previous revisions.  For example - An emotional movie is more
 emotional the first time through.  One get's used to it and
 fails to notice things as carefully)

(should have more than just autocomplete, should have an
 equivalent that tried to formalize things.  By queries to cyc.)

(we need to infer things from our assertions, for instance if we
 have an argument to #$titleOfWork that should be a
 #$ConceptualWork, we should ask or assume it as such, explicitly
 somewhere.  Need to make a lot of inferences like that.  Do a
 lot of inference with the possible meanings.)

(resume
 (if nil
  (progn
   (nlu-mf-build-completion-indexes)
   (nlu-mf-constant-complete "the")
   (nlu-mf-predicate-complete "has"))))

(fixme (copy dmiles prolog representation of cycl/subl))

(fixme
 (lookup the predicate arg1Isa etc definitions in Cyc
  (or use the big prolog logicmoo dump), cache them and use to
  determine when to convert to strings))

(fixme
 (Properly handle nested assertions))

(fixme
 (also use cycl NL stuff like mappings, and our own WN
  sense CycSenseMappings etc))

(fixme
 (add features for it to query Cyc and prologmud dump more to
  help in formalization. perhaps query the rcyc-1.0 for the text
  conversion.  Also do some searches to try to guide our
  selection of predicates/constants))
