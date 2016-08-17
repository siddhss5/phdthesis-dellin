# makefile for thesis
# requirements: GNU make, latexmk, pdflatex

#DOCS = proposal proptalk thesis lazysptalk
DOCS = thesis defense
DOCPDFS = $(foreach doc,$(DOCS),$(doc).pdf)

all: $(DOCPDFS)
#all: thesis.pdf lazysptalk.pdf proptalk.pdf

.PHONY: www-upload
www-upload:
	scp thesis.pdf linux.gp.cs.cmu.edu:/afs/cs.cmu.edu/user/cdellin/www/

proposal.pdf: proposal-intro.tex
proposal.pdf: proposal-framework.tex
proposal.pdf: proposal-summary.tex

proptalk.pdf: proptalk-intro.tex
proptalk.pdf: proptalk-act1.tex
proptalk.pdf: proptalk-act2.tex
proptalk.pdf: proptalk-act3.tex
proptalk.pdf: proptalk-backup.tex

lazysptalk.pdf: lazysptalk.tex

# latexmk dumps deps
$(DOCPDFS): %.pdf: %.tex
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -dvi- -ps- -recorder -use-make -deps-out=$*.mk -e '@cus_dep_list = ();' -e 'show_cus_dep();' $* \
		|| (rm -f $(PAPER).fdb_latexmk; pdflatex -halt-on-error -output-directory /tmp $*)

# dummy deps
$(foreach doc,$(DOCS),$(doc).out $(doc).nav):

# how to clean after latex
EXTS = aux bbl blg dvi fdb_latexmk fls log mk nav out pdf ps snm toc
.PHONY: clean
clean:
	rm -rf build/
	rm -f $(foreach doc,$(DOCS),$(foreach ext,$(EXTS),$(doc).$(ext)) $(doc)-*.aux)

# read those deps
$(foreach doc,$(DOCS),$(eval -include $(doc).mk))

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

#build/e8-world-%.pdf build/e8-world-%-stats.tex: fig-scripts/e8-example.py
#	mkdir -p build
#	python3 fig-scripts/e8-example.py --fn=$* --output_tikz=build/e8-world-$*.tex --output_stats=build/e8-world-$*-stats.tex
#	pdflatex -halt-on-error -output-directory=build build/e8-world-$*
