all: fast-manip.pdf

# compiling standalone tex's to pdfs
build/%.pdf: figs/%.tex
	mkdir -p build
	pdflatex -halt-on-error -output-directory=build figs/$*

# compiling dots to texs
build/%-dot.tex: figs/%.dot
	mkdir -p build
	dot2tex --figonly figs/$*.dot > build/$*-dot.tex

fast-manip.pdf: ch01-intro.tex
fast-manip.pdf: ch02-subprobs.tex
fast-manip.pdf: ch03-e8.tex
fast-manip.pdf: ch04-continuous.tex
fast-manip.pdf: ch05-multiset.tex
fast-manip.pdf: ch06-multisetprm.tex
fast-manip.pdf: ch07-cmr.tex
fast-manip.pdf: ch08-taskplanning.tex
fast-manip.pdf: ch09-experiments.tex
fast-manip.pdf: ch10-conclusion.tex
fast-manip.pdf: ch11-proposed.tex

fast-manip.pdf: build/pairwise-labels-dot.tex

# How to make a pdf from a tex
fast-manip.pdf: fast-manip.tex pr-refs.bib
	latexmk -pdf -e '$$pdflatex="pdflatex -halt-on-error"' fast-manip

STANDALONES += broadphase-single
STANDALONES += broadphase-multi
STANDALONES += diagram-multi-step
STANDALONES += e8-exgraph-edge-eval
STANDALONES += e8-exgraph-edge-select
STANDALONES += e8-exgraph-implicit-expand
STANDALONES += e8-exgraph-implicit-select
STANDALONES += e8-exgraph-intro
STANDALONES += example-2d-a
STANDALONES += example-2d-b
STANDALONES += example-2d-c
STANDALONES += example-2d-d
STANDALONES += example-2d-e
STANDALONES += example-2d-f
STANDALONES += example-2d-g
STANDALONES += example-2d-h
STANDALONES += example-2d-i
STANDALONES += example-in-expectation
STANDALONES += figstar-a
STANDALONES += figstar-b
STANDALONES += figstar-c
STANDALONES += intro-cost-axis
STANDALONES += intro-cost-chimp
STANDALONES += intro-cost-herb
STANDALONES += intro-subprob-axis
STANDALONES += intro-subprob-cspace
STANDALONES += multiple-sets
STANDALONES += query-to-subset-a
STANDALONES += query-to-subset-b
STANDALONES += relations-inclusion
STANDALONES += relations-intersection
STANDALONES += retroactive-a
STANDALONES += retroactive-b
STANDALONES += self-collision

# CMR stuff
STANDALONES += plot-edges-drill
STANDALONES += plot-edges-w10005
STANDALONES += plot-edges-w13
STANDALONES += queue-batched
STANDALONES += queue-interleaved
STANDALONES += queue-intro
STANDALONES += simpleex-classical
STANDALONES += simpleex-colored
STANDALONES += simpleex-queuestate
STANDALONES += simpleex-pairsvchecks
STANDALONES += w10005-fu4-ec434
STANDALONES += w10005-fs4-ec434
STANDALONES += w10005-fu4-ei3357
STANDALONES += w10005-fs4-ei3357
STANDALONES += w13-fu1-ec86
STANDALONES += w13-fs1-ec86
STANDALONES += w13-fu1-ei344
STANDALONES += w13-fs1-ei344

fast-manip.pdf: $(foreach s,$(STANDALONES),build/$s.pdf)

fast-manip.pdf: figs/chimp-voxels-delta.png
fast-manip.pdf: figs/simple-table-clearing-task.png
fast-manip.pdf: figs/testherb-a.png
fast-manip.pdf: figs/testherb-b.png
fast-manip.pdf: figs/testherb-c.png
fast-manip.pdf: figs/testherb-d.png
fast-manip.pdf: figs/testherb-e.png

# other wacky figures to generate
fast-manip.pdf: build/e8-world-intro.pdf
fast-manip.pdf: build/e8-world-astar.pdf
fast-manip.pdf: build/e8-world-wastar.pdf
fast-manip.pdf: build/e8-world-e8.pdf

build/e8-world-%.pdf build/e8-world-%-stats.tex: fig-scripts/e8-example.py
	mkdir -p build
	python3 fig-scripts/e8-example.py --fn=$* --output_tikz=build/e8-world-$*.tex --output_stats=build/e8-world-$*-stats.tex
	pdflatex -halt-on-error -output-directory=build build/e8-world-$*

# how to clean after latex
EXTS = aux bbl blg dvi fdb_latexmk log out pdf ps toc
.PHONY: clean
clean:
	rm -rf build/
	rm -f ch*.aux
	rm -f $(foreach e,$(EXTS),fast-manip.$e)
