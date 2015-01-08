PAPERS = fast-manip

all: $(foreach p,$(PAPERS),$p.pdf)

# How to make a pdf from a tex
fast-manip.pdf: fast-manip.tex pr-refs.bib
	latexmk -pdf -e '$$pdflatex="pdflatex -halt-on-error"'

# how to clean after latex
EXTS = aux bbl blg dvi fdb_latexmk log out pdf ps toc
.PHONY: clean
clean:
	rm -f $(foreach p,$(PAPERS),$(foreach e,$(EXTS),$p.$e))
