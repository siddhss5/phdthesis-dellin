RUNS = pavgnone-baldist pavgfull-balcard pgoalfull-balfwd pavgfull-baldist pgoalhalf-balfwd pavghalf-balcard pgoalnone-balfwd pavghalf-baldist pavgnone-balcard


.PHONY: all
all:

RUN_VEXPANDS = $(foreach RUN,$(RUNS),incbi-$(RUN)-0-vexpanded.txt)
RUN_COUTS = $(foreach RUN,$(RUNS),incbi-$(RUN)-cout.txt)
all: $(RUN_VEXPANDS)

incbi-pgoalnone-balfwd-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-vexpanded-fmt='incbi-pgoalnone-balfwd-%d-vexpanded.txt' --use-cardinality=false --balance-frac=0.0 --potfn-start=0.00 --potfn-goal=0.00 > incbi-pgoalnone-balfwd-cout.txt

incbi-pgoalhalf-balfwd-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-vexpanded-fmt='incbi-pgoalhalf-balfwd-%d-vexpanded.txt' --use-cardinality=false --balance-frac=0.0 --potfn-start=0.00 --potfn-goal=0.50 > incbi-pgoalhalf-balfwd-cout.txt

incbi-pgoalfull-balfwd-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-vexpanded-fmt='incbi-pgoalfull-balfwd-%d-vexpanded.txt' --use-cardinality=false --balance-frac=0.0 --potfn-start=0.00 --potfn-goal=1.00 > incbi-pgoalfull-balfwd-cout.txt

incbi-pavgnone-baldist-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-vexpanded-fmt='incbi-pavgnone-baldist-%d-vexpanded.txt' --use-cardinality=false --balance-frac=0.5 --potfn-start=0.00 --potfn-goal=0.00 > incbi-pavgnone-baldist-cout.txt

incbi-pavghalf-baldist-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-vexpanded-fmt='incbi-pavghalf-baldist-%d-vexpanded.txt' --use-cardinality=false --balance-frac=0.5 --potfn-start=0.25 --potfn-goal=0.25 > incbi-pavghalf-baldist-cout.txt

incbi-pavgfull-baldist-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-vexpanded-fmt='incbi-pavgfull-baldist-%d-vexpanded.txt' --use-cardinality=false --balance-frac=0.5 --potfn-start=0.50 --potfn-goal=0.50 > incbi-pavgfull-baldist-cout.txt

incbi-pavgnone-balcard-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-vexpanded-fmt='incbi-pavgnone-balcard-%d-vexpanded.txt' --use-cardinality=true --balance-frac=0.5 --potfn-start=0.00 --potfn-goal=0.00 > incbi-pavgnone-balcard-cout.txt

incbi-pavghalf-balcard-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-vexpanded-fmt='incbi-pavghalf-balcard-%d-vexpanded.txt' --use-cardinality=true --balance-frac=0.5 --potfn-start=0.25 --potfn-goal=0.25 > incbi-pavghalf-balcard-cout.txt

incbi-pavgfull-balcard-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-vexpanded-fmt='incbi-pavgfull-balcard-%d-vexpanded.txt' --use-cardinality=true --balance-frac=0.5 --potfn-start=0.50 --potfn-goal=0.50 > incbi-pavgfull-balcard-cout.txt


RUN_PNGS = $(foreach RUN,$(RUNS),$(RUN).png)
all: $(RUN_PNGS)

%.png: incbi-%-0-vexpanded.txt
	rosrun thesis_experiments fig-incbi-road-ne-draw.py --road-d-ne-co=USA-road-d.NE.co --road-t-ne-gr=USA-road-t.NE.gr --in-vexpanded=$< --out-png=$@
	

.PHONY: clean
clean:
	rm -f $(RUN_VEXPANDS)
	rm -f $(RUN_COUTS)
	rm -f $(RUN_PNGS)
	rm -f cout.txt




# part 2: example figures for chapter 4

# home is vertex 458584
# olin is vertex 249500

all: example-dijkstra.png

example-dijkstra-dstart-0-%.txt example-dijkstra-stats-%.txt:
	rosrun thesis_experiments incbi-road-ne --v-start=458584 --v-goal=249500 \
		--use-cardinality=false --balance-frac=0.00001 --potfn-start=0 --potfn-goal=0 \
		--out-distancestart-fmt='example-dijkstra-dstart-%d-stem.txt' \
		--out-stats='example-dijkstra-stats-stem.txt'
	
example-dijkstra.png: example-dijkstra-dstart-0-stem.txt
	rosrun thesis_experiments fig-incbi-road-ne-draw.py \
		--road-d-ne-co=USA-road-d.NE.co --road-t-ne-gr=USA-road-t.NE.gr \
		--in-distancestart=$^ --out-png=$@

all: example-bidijkstra.png

example-bidijkstra-dstart-0-%.txt example-bidijkstra-dgoal-0-%.txt example-bidijkstra-stats-%.txt:
	rosrun thesis_experiments incbi-road-ne --v-start=458584 --v-goal=249500 \
		--use-cardinality=false --balance-frac=0.5 --potfn-start=0 --potfn-goal=0 \
		--out-distancestart-fmt='example-bidijkstra-dstart-%d-stem.txt' \
		--out-distancegoal-fmt='example-bidijkstra-dgoal-%d-stem.txt' \
		--out-stats='example-bidijkstra-stats-stem.txt'

example-bidijkstra.png: example-bidijkstra-dstart-0-stem.txt example-bidijkstra-dgoal-0-stem.txt
	rosrun thesis_experiments fig-incbi-road-ne-draw.py \
		--road-d-ne-co=USA-road-d.NE.co --road-t-ne-gr=USA-road-t.NE.gr \
		--in-distancestart=example-bidijkstra-dstart-0-stem.txt \
		--in-distancegoal=example-bidijkstra-dgoal-0-stem.txt \
		--out-png=$@

all: example-astar.png

example-astar-dstart-0-%.txt example-astar-stats-%.txt:
	rosrun thesis_experiments incbi-road-ne --v-start=458584 --v-goal=249500 \
		--use-cardinality=false --balance-frac=0.00001 --potfn-start=0 --potfn-goal=1 \
		--out-distancestart-fmt='example-astar-dstart-%d-stem.txt' \
		--out-stats='example-astar-stats-stem.txt'
	
example-astar.png: example-astar-dstart-0-stem.txt
	rosrun thesis_experiments fig-incbi-road-ne-draw.py \
		--road-d-ne-co=USA-road-d.NE.co --road-t-ne-gr=USA-road-t.NE.gr \
		--in-distancestart=$^ --out-png=$@

all: example-heurbidijkstra.png

example-heurbidijkstra-dstart-0-%.txt example-heurbidijkstra-dgoal-0-%.txt example-heurbidijkstra-stats-%.txt:
	rosrun thesis_experiments incbi-road-ne --v-start=458584 --v-goal=249500 \
		--use-cardinality=false --balance-frac=0.5 --potfn-start=0.5 --potfn-goal=0.5 \
		--out-distancestart-fmt='example-heurbidijkstra-dstart-%d-stem.txt' \
		--out-distancegoal-fmt='example-heurbidijkstra-dgoal-%d-stem.txt' \
		--out-stats='example-heurbidijkstra-stats-stem.txt'
	
example-heurbidijkstra.png: example-heurbidijkstra-dstart-0-stem.txt example-heurbidijkstra-dgoal-0-stem.txt
	rosrun thesis_experiments fig-incbi-road-ne-draw.py \
		--road-d-ne-co=USA-road-d.NE.co --road-t-ne-gr=USA-road-t.NE.gr \
		--in-distancestart=example-heurbidijkstra-dstart-0-stem.txt \
		--in-distancegoal=example-heurbidijkstra-dgoal-0-stem.txt \
		--out-png=$@
