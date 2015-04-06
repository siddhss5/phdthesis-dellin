all: proposal.pdf proposal-talk.pdf
#all: fast-manip.pdf proposal.pdf

fast-manip.pdf: ch01-intro.tex
fast-manip.pdf: chxx-proposed-framework.tex
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

proposal.pdf: ch01-intro.tex
proposal.pdf: chxx-proposed-framework.tex
proposal.pdf: ch11-proposed.tex

# hardcoded stuff fast-manip.pdf: figs/chimp-voxels-delta.png
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
# other
fast-manip.pdf: build/pairwise-labels-dot.tex

# hardcoded stuff fast-manip.pdf: figs/chimp-voxels-delta.png
proposal.pdf: figs/simple-table-clearing-task.png
proposal.pdf: figs/testherb-a.png
proposal.pdf: figs/testherb-b.png
proposal.pdf: figs/testherb-c.png
proposal.pdf: figs/testherb-d.png
proposal.pdf: figs/testherb-e.png
# other wacky figures to generate
proposal.pdf: build/e8-world-intro.pdf
proposal.pdf: build/e8-world-astar.pdf
proposal.pdf: build/e8-world-wastar.pdf
proposal.pdf: build/e8-world-e8.pdf
# other
proposal.pdf: build/pairwise-labels-dot.tex

STANDALONES += broadphase-single
STANDALONES += broadphase-multi
STANDALONES += diagram-multi-step
STANDALONES += diagram-mutlistep-intro
STANDALONES += e8-exgraph-edge-eval
STANDALONES += e8-exgraph-edge-select
STANDALONES += e8-exgraph-implicit-expand
STANDALONES += e8-exgraph-implicit-select
STANDALONES += e8-exgraph-intro
STANDALONES += ensemble-effort-plot-1
STANDALONES += example-2d-a
STANDALONES += example-2d-b
STANDALONES += example-2d-c
STANDALONES += example-2d-d
STANDALONES += example-2d-e
STANDALONES += example-2d-f
STANDALONES += example-2d-g
STANDALONES += example-2d-h
STANDALONES += example-2d-i
STANDALONES += example-2d-q1
STANDALONES += example-2d-q3
STANDALONES += example-2d-s12
STANDALONES += example-2d-s12-wtraj
STANDALONES += example-2d-s23
STANDALONES += example-2d-s23-wtraj
STANDALONES += example-2d-sa
STANDALONES += example-2d-sb
STANDALONES += example-2d-sc
STANDALONES += example-in-expectation
STANDALONES += figstar-a-qlabeled
STANDALONES += figstar-a
STANDALONES += figstar-b
STANDALONES += figstar-c
STANDALONES += figstar-traj1
STANDALONES += figstar-traj1-inc
STANDALONES += figstar-w-abc
STANDALONES += figstar-wo-abc
STANDALONES += intro-cost-axis
STANDALONES += intro-cost-chimp
STANDALONES += intro-cost-herb
STANDALONES += intro-cost-proving
STANDALONES += intro-cost-rover
STANDALONES += intro-subprob-axis
STANDALONES += intro-subprob-cspace
STANDALONES += maze-plot-ensemble
STANDALONES += multiple-sets
STANDALONES += multiset-roadmap-example,start
STANDALONES += multiset-roadmap-example,roadmap
STANDALONES += multiset-roadmap-example,straightsol
STANDALONES += multiset-roadmap-example,basesets
STANDALONES += multiset-roadmap-example,blackgraph
STANDALONES += multiset-roadmap-example,rightsol
STANDALONES += multiset-roadmap-example,leftspec
STANDALONES += multiset-roadmap-example,leftsol
STANDALONES += multiset-manip-instances,dyna
STANDALONES += multiset-manip-instances,dynb
STANDALONES += multiset-manip-instances,dync
STANDALONES += multiset-manip-instances,selfa
STANDALONES += multiset-manip-instances,selfb
STANDALONES += multiset-manip-instances,selfc
STANDALONES += multiset-manip-instances-blob,outside
STANDALONES += multiset-manip-instances-blob,inside
STANDALONES += multiset-manip-instances-blob,routside
STANDALONES += multiset-manip-instances-blob,rinside
STANDALONES += query-to-subset-a
STANDALONES += query-to-subset-b
STANDALONES += relations-inclusion
STANDALONES += relations-intersection
STANDALONES += retroactive-a
STANDALONES += retroactive-b
STANDALONES += roadmap-2d-densified
STANDALONES += roadmap-2d-simple
STANDALONES += self-collision
STANDALONES += talk-act1-2d,rootsonly
STANDALONES += talk-act1-2d,cfree
STANDALONES += talk-act1-2d,paths
STANDALONES += talk-act1-2d,traja
STANDALONES += talk-act1-2d,trajb
STANDALONES += talk-act1-2d,trajc
STANDALONES += talk-act1-2d,trajd
STANDALONES += talk-act1-2d,firstfail
STANDALONES += talk-act1-2d,firstfailnext
STANDALONES += talk-act1-2d,rrtstart
STANDALONES += talk-act1-2d,rrtsample
STANDALONES += talk-act1-2d,rrtcandidates
STANDALONES += talk-act1-2d,rrtchosen
STANDALONES += talk-act1-2d,graph
STANDALONES += talk-act1-2d,graphfirst
STANDALONES += talk-act1-2d,graphfirstevaled
STANDALONES += talk-act1-2d,graphfirstnext
STANDALONES += talk-act1-2d,astara
STANDALONES += talk-act1-2d,astarb
STANDALONES += talk-act1-2d,astarc
STANDALONES += talk-act1-2d,astard
STANDALONES += talk-act1-2d,astare
STANDALONES += talk-act1-2d,astarf
STANDALONES += talk-act1-2d,astarg
STANDALONES += talk-act1-2d,astarh
STANDALONES += talk-act1-2d,astari
STANDALONES += talk-act1-2d,astarj
STANDALONES += talk-act1-2d,astark
STANDALONES += talk-act1-2d,astarl
STANDALONES += talk-act1-2d,astarm
STANDALONES += talk-act1-2d,astarn
STANDALONES += talk-act1-2d,astaro
STANDALONES += talk-act1-2d,astarp
STANDALONES += talk-act1-2d,astarq
STANDALONES += talk-act1-2d,astarr
STANDALONES += talk-act1-2d,astars
STANDALONES += talk-challenge1-tradeoff

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
proposal.pdf: $(foreach s,$(STANDALONES),build/$s.pdf)
proposal-talk.pdf: $(foreach s,$(STANDALONES),build/$s.pdf)

figs/roadmap-2d-densified.tex:
	@echo instructions to make:
	@echo rosrun test_multiset roadmaps-2d 0.6 100 3
	@echo rosrun test_multiset roadmaps-2d-totex.py --roadmap-file=roadmap-3ab10de0d8eef49de93149a9510707253edf3391.txt --output-tex=$@
	false

build/e8-world-%.pdf build/e8-world-%-stats.tex: fig-scripts/e8-example.py
	mkdir -p build
	python3 fig-scripts/e8-example.py --fn=$* --output_tikz=build/e8-world-$*.tex --output_stats=build/e8-world-$*-stats.tex
	pdflatex -halt-on-error -output-directory=build build/e8-world-$*




# compiling standalone tex's to pdfs
#build/%.pdf: figs/%.tex
comma := ,
*1 = $(word 1, $(subst $(comma), ,$*))
*2 = $(word 2, $(subst $(comma), ,$*))
.SECONDEXPANSION:
build/%.pdf: figs/$$(*1).tex
	@echo first is $(*1)
	@echo after is $(*2)
	mkdir -p build
	#pdflatex -halt-on-error -output-directory=build --jobname=$* figs/$(*1)
	pdflatex -halt-on-error -output-directory=build --jobname="$*" "\def\arg$(*2){}\input{figs/$(*1)}"




# compiling dots to texs
build/%-dot.tex: figs/%.dot
	mkdir -p build
	dot2tex --figonly figs/$*.dot > build/$*-dot.tex

# how to make a pdf from a tex
fast-manip.pdf: fast-manip.tex pr-refs.bib
	latexmk -pdf -e '$$pdflatex="pdflatex -halt-on-error"' fast-manip
proposal.pdf: proposal.tex pr-refs.bib
	latexmk -pdf -e '$$pdflatex="pdflatex -halt-on-error"' proposal
proposal-talk.pdf: proposal-talk.tex
	latexmk -pdf -e '$$pdflatex="pdflatex -halt-on-error"' proposal-talk

# how to clean after latex
EXTS = aux bbl blg dvi fdb_latexmk log out pdf ps toc
.PHONY: clean
clean:
	rm -rf build/
	rm -f ch*.aux
	rm -f $(foreach p,fast-manip proposal,$(foreach e,$(EXTS),$p.$e))
