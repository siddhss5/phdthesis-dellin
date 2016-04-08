all: gen/intro.tex
all: gen/astar.tex
all: gen/wastar.tex
all: gen/e8.tex

# this also produces build/%-stats.tex
gen/%.tex: gen e8-example.py
	python3 e8-example.py --fn=$* --output_tikz=gen/$*.tex --output_stats=gen/$*-stats.tex

gen:
	mkdir gen/

.PHONY: clean
clean:
	rm -rf gen/
