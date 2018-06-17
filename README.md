A mode for bootstrapping translation of text to logic.  Separates out
documents sentence by sentence, and creates some boilerplate code for
representing the text, allowing you to fill in.  Future versions will
include more parsing and formalization to act as a guide.

https://frdcsa.org/frdcsa/minor/nlu-mf

```%% To hear Mass on all Sundays and on Holydays of obligation.
sentence('catechismOfStPopePiusX_TheBook',sentenceIdFn(1935),'To hear Mass on all Sundays and on Holydays of obligation.').
hasFormalization('catechismOfStPopePiusX_TheBook',sentenceFn(1935),
                 [
		  Precept1 = (bound(christian(Christian)) ->
			      (	  date(Date),
				  (   dow(Date,sunday) ; holydayOfObligation(Date)) ->
				  on(Date,hearMass(Christian)))),
		  equals(Precept1,precept1),
		  isa(precept1,preceptOfTheChurch)
		 ]).```
