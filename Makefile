# makefile for thesis
# requirements: GNU make, latexmk, pdflatex

#DOCS = proposal proptalk thesis lazysptalk
DOCS = thesis
DOCPDFS = $(foreach doc,$(DOCS),$(doc).pdf)

all: $(DOCPDFS)
#all: thesis.pdf lazysptalk.pdf proptalk.pdf

.PHONY: www-upload
www-upload:
	scp thesis.pdf linux.gp.cs.cmu.edu:/afs/cs.cmu.edu/user/cdellin/www/

proposal.pdf: proposal-intro.tex
proposal.pdf: proposal-framework.tex
proposal.pdf: proposal-summary.tex

thesis.pdf: thesis-ch01-intro.tex
thesis.pdf: thesis-ch02-roadmaps.tex
thesis.pdf: thesis-ch03-lazysp.tex
thesis.pdf: thesis-ch04-ibid.tex
thesis.pdf: thesis-ch05-lemur.tex
thesis.pdf: thesis-ch06-family.tex
thesis.pdf: thesis-ch07-conclusion.tex
thesis.pdf: thesis-ch03-lazysp-proofs.tex
thesis.pdf: thesis-ch04-ibid-proofs.tex
thesis.pdf: thesis-ch05-lemur-appendix.tex
thesis.pdf: thesis-ch06-family-appendix.tex

proptalk.pdf: proptalk-intro.tex
proptalk.pdf: proptalk-act1.tex
proptalk.pdf: proptalk-act2.tex
proptalk.pdf: proptalk-act3.tex
proptalk.pdf: proptalk-backup.tex

lazysptalk.pdf: lazysptalk.tex

# latexmk dumps deps
$(DOCPDFS): %.pdf: %.tex
	#latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -dvi- -ps- -recorder -use-make -deps-out=$*.mk -e '@cus_dep_list = ();' -e 'show_cus_dep();' $* \
	#	|| (rm -f $(PAPER).fdb_latexmk; pdflatex -halt-on-error -output-directory /tmp $*)
	pdflatex -halt-on-error $*
	bibtex $*
	pdflatex -halt-on-error $*
	pdflatex -halt-on-error $*

# how to clean after latex
EXTS = aux bbl blg dvi fdb_latexmk fls log mk nav out pdf ps snm toc
.PHONY: clean
clean:
	rm -rf build/
	rm -f $(foreach doc,$(DOCS),$(foreach ext,$(EXTS),$(doc).$(ext)) $(doc)-*.aux)

thesis.pdf: build/broadphase-single.pdf
thesis.pdf: build/broadphase-multi.pdf
thesis.pdf: build/c-space.pdf
thesis.pdf: build/example-2d-a.pdf
thesis.pdf: build/example-2d-b.pdf
thesis.pdf: build/example-2d-c.pdf
thesis.pdf: build/example-2d-d.pdf
thesis.pdf: build/example-2d-e.pdf
thesis.pdf: build/example-2d-f.pdf
thesis.pdf: build/example-2d-g.pdf
thesis.pdf: build/example-2d-h.pdf
thesis.pdf: build/example-2d-i.pdf
thesis.pdf: build/family-belief-graph-example.pdf
thesis.pdf: build/family-belief-graph-example-wrels.pdf
thesis.pdf: build/family-belief-graph-example-wrels-policy.pdf
thesis.pdf: build/family-composite/plot-g-manifold.pdf
thesis.pdf: build/family-composite/plot-pbottom-manifold.pdf
thesis.pdf: build/family-composite/plot-ptop-manifold.pdf
thesis.pdf: build/family-composite/plot-volumes.pdf
thesis.pdf: build/family-composite/plot-volumes-individual.pdf
thesis.pdf: build/family-suction-example-graph.pdf
thesis.pdf: build/figstar-a.pdf
thesis.pdf: build/figstar-b.pdf
thesis.pdf: build/figstar-c.pdf
thesis.pdf: build/filmstrip.pdf
thesis.pdf: build/ibid-dijkstra-trust.pdf
thesis.pdf: build/ibid-intro-focus-bidirectional.pdf
thesis.pdf: build/ibid-intro-focus-heuristic.pdf
thesis.pdf: build/ibid-intro-focus-incremental.pdf
thesis.pdf: build/incbi-lpastar-fig1/incbi-heurnone-original.pdf
thesis.pdf: build/incbi-lpastar-fig1/incbi-heurfull-original.pdf
thesis.pdf: build/incbi-lpastar-fig1/lpastar-heurnone-original.pdf
thesis.pdf: build/incbi-lpastar-fig1/lpastar-heurfull-original.pdf
thesis.pdf: build/incbi-lpastar-fig1/lpastar-heurfull-changed.pdf
thesis.pdf: build/incbi-lpastar-fig1/incbi-heurfull-changed.pdf
thesis.pdf: build/incbi-road-ne/stats2.pdf
thesis.pdf: build/incbi-road-ne/stats2rel.pdf
thesis.pdf: build/lamvu-convex.pdf
thesis.pdf: build/lazysp-example-1/alg-fwdexpand-after5.pdf
thesis.pdf: build/lazysp-example-1/alg-fwdexpand-end.pdf
thesis.pdf: build/lazysp-example-1/alg-fwdexpand-path-bars.pdf
thesis.pdf: build/lazysp-example-1/alg-fwd-after5.pdf
thesis.pdf: build/lazysp-example-1/alg-fwd-end.pdf
thesis.pdf: build/lazysp-example-1/alg-fwd-path-bars.pdf
thesis.pdf: build/lazysp-example-1/alg-rev-after5.pdf
thesis.pdf: build/lazysp-example-1/alg-rev-end.pdf
thesis.pdf: build/lazysp-example-1/alg-rev-path-bars.pdf
thesis.pdf: build/lazysp-example-1/alg-alt-after5.pdf
thesis.pdf: build/lazysp-example-1/alg-alt-end.pdf
thesis.pdf: build/lazysp-example-1/alg-alt-path-bars.pdf
thesis.pdf: build/lazysp-example-1/alg-bisect-after5.pdf
thesis.pdf: build/lazysp-example-1/alg-bisect-end.pdf
thesis.pdf: build/lazysp-example-1/alg-bisect-path-bars.pdf
thesis.pdf: build/lazysp-example-1/alg-worlddist1000-after5.pdf
thesis.pdf: build/lazysp-example-1/alg-worlddist1000-end.pdf
thesis.pdf: build/lazysp-example-1/alg-worlddist1000-path-bars.pdf
thesis.pdf: build/lazysp-example-1/alg-partall-after5.pdf
thesis.pdf: build/lazysp-example-1/alg-partall-end.pdf
thesis.pdf: build/lazysp-example-1/alg-partall-path-bars.pdf
thesis.pdf: build/lazysp-fig-dists/fig-sofar.pdf
thesis.pdf: build/lazysp-fig-dists/fig-path-00.pdf
thesis.pdf: build/lazysp-fig-dists/fig-path-01.pdf
thesis.pdf: build/lazysp-fig-dists/fig-path-02.pdf
thesis.pdf: build/lazysp-fig-dists/fig-path-03.pdf
thesis.pdf: build/lazysp-fig-dists/fig-dist-probs.pdf
thesis.pdf: build/lazysp-fig-dists/fig-world-00.pdf
thesis.pdf: build/lazysp-fig-dists/fig-world-01.pdf
thesis.pdf: build/lazysp-fig-dists/fig-world-02.pdf
thesis.pdf: build/lazysp-fig-dists/fig-wfn-00.pdf
thesis.pdf: build/lazysp-fig-dists/fig-wfn-01.pdf
thesis.pdf: build/lazysp-fig-dists/fig-wfn-02.pdf
thesis.pdf: build/lazysp-selscores/empty-28.pdf
thesis.pdf: build/lazysp-selscores/empty-33.pdf
thesis.pdf: build/lazysp-selscores/empty-50.pdf
thesis.pdf: build/lazysp-selscores/gap-28.pdf
thesis.pdf: build/lazysp-selscores/gap-33.pdf
thesis.pdf: build/lazysp-selscores/gap-50.pdf
thesis.pdf: build/lazysp-partall/partall-figure-0.pdf
thesis.pdf: build/lazysp-partall/partall-figure-5.pdf
thesis.pdf: build/lemur-sq/chimp-valve-drc001-20131221-102450p936-CBRT.pdf
thesis.pdf: build/lemur-sq/herbbin0.pdf
thesis.pdf: build/lemur-sq/herb-master.pdf
thesis.pdf: build/lemur-sq/herb-timing.pdf
thesis.pdf: build/lemur-sq/schedule-bitstar.pdf
thesis.pdf: build/lemur-sq/schedule-rrt.pdf
thesis.pdf: build/lemur-sq/workcellfg.pdf
thesis.pdf: build/lemur-sq/workcell-master.pdf
thesis.pdf: build/lemur-sq/workcell-timing.pdf
thesis.pdf: build/schedule-lemur.pdf
thesis.pdf: build/movers-problem-schwartz-sharir.pdf
thesis.pdf: build/multiple-sets.pdf
thesis.pdf: build/multistep-prescribed/herbbinnom-g1ll.pdf
thesis.pdf: build/multistep-prescribed/workcell-g1ll.pdf
thesis.pdf: build/outline.pdf
thesis.pdf: build/p-estimates.pdf
thesis.pdf: build/pvx-convex.pdf
thesis.pdf: build/pvx-graph.pdf
thesis.pdf: build/pvx-linear-discounting.pdf
thesis.pdf: build/pvx-rrt.pdf
thesis.pdf: build/pvx-sm-firstfeas.pdf
thesis.pdf: build/pvx-sm-pbudget.pdf
thesis.pdf: build/pvx-sm-xbudget.pdf
thesis.pdf: build/pvx-utility.pdf
thesis.pdf: build/pvx-utility-anytime.pdf
thesis.pdf: build/query-to-subset-a.pdf
thesis.pdf: build/query-to-subset-b.pdf
thesis.pdf: build/relations-disjoint.pdf
thesis.pdf: build/relations-inclusion.pdf
thesis.pdf: build/relations-intersection.pdf
thesis.pdf: build/roadmap-stack.pdf
thesis.pdf: build/roadmap-stack-onramps.pdf
thesis.pdf: build/roadmaps/gen/aagrid.pdf
thesis.pdf: build/roadmaps/gen/halton.pdf
thesis.pdf: build/roadmaps/gen/rgg.pdf
thesis.pdf: build/rrt.pdf
thesis.pdf: build/workcell/configs.pdf

# some hierarchical deps we list explicitly
build/lazysp-weightfunc.pdf: build/lazysp-fig-dists/fig-wfn-00.pdf
build/lazysp-weightfunc.pdf: build/lazysp-fig-dists/fig-wfn-01.pdf
build/lazysp-weightfunc.pdf: build/lazysp-fig-dists/fig-wfn-02.pdf
build/lazysp-weightfunc.pdf: build/lazysp-fig-dists/fig-world-00.pdf
build/lazysp-weightfunc.pdf: build/lazysp-fig-dists/fig-world-01.pdf
build/lazysp-weightfunc.pdf: build/lazysp-fig-dists/fig-world-02.pdf

build/outline.pdf: build/c-space-simple.pdf
build/outline.pdf: build/pvx-linear-discounting-simple.pdf
build/outline.pdf: build/roadmap-stack-short.pdf

# compiling standalone tex's to pdfss
#build/%.pdf: figs/%.tex
comma := ,
*1 = $(word 1, $(subst $(comma), ,$*))
*2 = $(word 2, $(subst $(comma), ,$*))
.SECONDEXPANSION:
build/%.pdf: figs/$$(*1).tex
	@echo first is $(*1)
	@echo after is $(*2)
	mkdir -p `dirname $@`
	pdflatex -halt-on-error -output-directory=build --jobname="$*" "\def\arg$(*2){}\input{figs/$(*1)}"

# compiling dot's into pdf's
build/%.pdf: figs/%.dot
	dot2tex -ftikz figs/$*.dot --crop > build/$*.tex
	pdflatex -halt-on-error -output-directory=build --jobname="$*" build/$*.tex
