all: fast-manip.pdf

# compiling standalone tex's to pdfs
build/%.pdf: figs/%.tex
	mkdir -p build
	pdflatex -halt-on-error -output-directory=build figs/$*

# compiling dots to texs
build/%-dot.tex: figs/%.dot
	mkdir -p build
	dot2tex --figonly figs/$*.dot > build/$*-dot.tex

fast-manip.pdf: build/pairwise-labels-dot.tex

# How to make a pdf from a tex
fast-manip.pdf: fast-manip.tex pr-refs.bib
	latexmk -pdf -e '$$pdflatex="pdflatex -halt-on-error"' fast-manip

STANDALONES += broadphase-single
STANDALONES += broadphase-multi
STANDALONES += figstar-a
STANDALONES += figstar-b
STANDALONES += figstar-c
STANDALONES += example-2d-a
STANDALONES += example-2d-b
STANDALONES += example-2d-c
STANDALONES += example-2d-d
STANDALONES += example-2d-e
STANDALONES += example-2d-f
STANDALONES += example-2d-g
STANDALONES += example-2d-h
STANDALONES += example-2d-i
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

# how to clean after latex
EXTS = aux bbl blg dvi fdb_latexmk log out pdf ps toc
.PHONY: clean
clean:
	rm -rf build/
	rm -f $(foreach e,$(EXTS),fast-manip.$e)
