all: gen/aagrid.tex
all: gen/halton.tex
all: gen/rgg.tex

gen/aagrid.graphml:
	mkdir -p gen/
	rosrun ompl_lemur generate-roadmap --dim=2 --out-format=graphml --out-file=$@ \
	   --roadmap-type=AAGrid --roadmap-param=res=0.25 --num-batches=1

gen/halton.graphml:
	mkdir -p gen/
	rosrun ompl_lemur generate-roadmap --dim=2 --out-format=graphml --out-file=$@ \
	   --roadmap-type=Halton --roadmap-param=num=30 --roadmap-param=radius=0.3 --num-batches=1

gen/rgg.graphml:
	mkdir -p gen/
	rosrun ompl_lemur generate-roadmap --dim=2 --out-format=graphml --out-file=$@ \
	   --roadmap-type=RGG --roadmap-param=num=30 --roadmap-param=radius=0.3 --roadmap-param=seed=1 --num-batches=1

gen/%.tex: gen/%.graphml
	rosrun thesis_experiments render-unit2d.py --graph=$^ --graph-type=graphml \
		--draw-vertices --tikz-scale=3.0 --out-tikz=$@

.PHONY: clean
clean:
	rm -rf gen/
