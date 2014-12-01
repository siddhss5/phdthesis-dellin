PERLINDIR = ~/svn/pr/etc/people/cdellin/code/perlin
OMPL2DTESTERDIR = ~/svn/pr/etc/people/cdellin/code/ompl_2d_tester
MULTIRRTCOMPARE = ~/svn/pr/etc/people/cdellin/code/multi-rrt-compare

PAPERS = fast-manip

all: $(foreach p,$(PAPERS),$p.pdf)

# How to make a pdf from a tex
fast-manip.pdf: fast-manip.tex
	latexmk -pdf fast-manip

# how to clean after latex
EXTS = aux bbl blg dvi fdb_latexmk log out pdf ps toc
.PHONY: clean
clean:
	rm -f $(foreach p,$(PAPERS),$(foreach e,$(EXTS),$p.$e))
