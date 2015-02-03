PAPERS = fast-manip

all: $(foreach p,$(PAPERS),$p.pdf)

# How to make a pdf from a tex
fast-manip.pdf: fast-manip.tex pr-refs.bib
	latexmk -pdf -e '$$pdflatex="pdflatex -halt-on-error"' fast-manip

fast-manip.pdf: figs/broadphase-single.tex
fast-manip.pdf: figs/broadphase-multi.tex
fast-manip.pdf: figs/chimp-voxels-delta.png
fast-manip.pdf: figs/figstar-a.tex
fast-manip.pdf: figs/figstar-b.tex
fast-manip.pdf: figs/figstar-c.tex
fast-manip.pdf: figs/example-2d-a.tex
fast-manip.pdf: figs/example-2d-b.tex
fast-manip.pdf: figs/example-2d-c.tex
fast-manip.pdf: figs/example-2d-d.tex
fast-manip.pdf: figs/example-2d-e.tex
fast-manip.pdf: figs/example-2d-f.tex
fast-manip.pdf: figs/example-2d-g.tex
fast-manip.pdf: figs/example-2d-h.tex
fast-manip.pdf: figs/example-2d-i.tex
fast-manip.pdf: figs/multiple-sets.tex
fast-manip.pdf: figs/query-to-subset-a.tex
fast-manip.pdf: figs/query-to-subset-b.tex
fast-manip.pdf: figs/relations-inclusion.tex
fast-manip.pdf: figs/relations-intersection.tex
fast-manip.pdf: figs/retroactive-a.tex
fast-manip.pdf: figs/retroactive-b.tex
fast-manip.pdf: figs/simple-table-clearing-task.png
fast-manip.pdf: figs/self-collision.tex
fast-manip.pdf: figs/testherb-a.png
fast-manip.pdf: figs/testherb-b.png
fast-manip.pdf: figs/testherb-c.png
fast-manip.pdf: figs/testherb-d.png
fast-manip.pdf: figs/testherb-e.png

# how to clean after latex
EXTS = aux bbl blg dvi fdb_latexmk log out pdf ps toc
.PHONY: clean
clean:
	rm -f $(foreach p,$(PAPERS),$(foreach e,$(EXTS),$p.$e))
