# this makefile produces figures for the thesis document!
# other files:
# - thesis-papers/thesis_experiments/scripts/Makefile.incbi-road-ne
#   - this is for the experiment which randomly selects roots
# - thesis-papers/thesis_experiments/scripts/Makefile.incbi-roadne-video



# part 1: colorful examples that test different potential functions and balancers.

# the resulting png files are checked in:
# - pavgfull-balcard.png
# - pavgfull-baldist.png
# - pavghalf-balcard.png
# - pavghalf-baldist.png
# - pavgnone-balcard.png
# - pavgnone-baldist.png
# - pgoalfull-balfwd.png
# - pgoalhalf-balfwd.png
# - pgoalnone-balfwd.png

RUNS = pavgnone-baldist pavgfull-balcard pgoalfull-balfwd \
       pavgfull-baldist pgoalhalf-balfwd pavghalf-balcard \
       pgoalnone-balfwd pavghalf-baldist pavgnone-balcard


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

# this file produces the incbi-road-ne illustration figures used in chapter 4.
# examples from the nj-bos route

# the resulting png files are checked in:
# - example-intro.png          # just shows the graph, with no d function
# - example-dijkstraall.png    # the entire start distance function
# - example-dijkstra.png       # dijkstra (with termination)
# - example-bidijkstra.png     # bidirectional
# - example-incuni-0.png       # lpa* (basically) initial episode
# - example-incuni-1.png       # lpa* (basically) subsequent episode
# - example-incbi-0.png        # incbi initial episode
# - example-incbi-1.png        # incbi subsequent episode
# - example-astar.png          # heuristic unidir
# - example-heurbidijkstra.png # heuristic bidir




# home is vertex 458584
# olin is vertex 249500

# intro
all: example-intro.png
example-intro.png:
	rosrun thesis_experiments fig-incbi-road-ne-draw.py \
		--road-d-ne-co=USA-road-d.NE.co --road-t-ne-gr=USA-road-t.NE.gr \
		--v-start=458584 --v-goal=249500 --draw-roots \
		--out-png=$@


all: example-dijkstraall.png

example-dijkstraall-dstart-0-%.txt:
	rosrun thesis_experiments incbi-road-ne --v-start=458584 --v-goal=249500 \
		--use-cardinality=false --balance-frac=0.00001 --potfn-start=0 --potfn-goal=0 \
		--dijkstra-only=true \
		--out-distancestart-fmt='example-dijkstraall-dstart-%d-stem.txt' \

example-dijkstraall.png: example-dijkstraall-dstart-0-stem.txt
	rosrun thesis_experiments fig-incbi-road-ne-draw.py \
		--road-d-ne-co=USA-road-d.NE.co --road-t-ne-gr=USA-road-t.NE.gr \
		--in-distancestart=$^ --out-png=$@


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


# incremental examples
all: example-incuni-0.png
all: example-incuni-1.png
example-incuni-dstart-0-%.txt example-incuni-dstart-1-%.txt example-incuni-vexpanded-0-%.txt example-incuni-vexpanded-1-%.txt example-incuni-stats-%.txt:
	rosrun thesis_experiments incbi-road-ne --v-start=458584 --v-goal=249500 \
		--use-cardinality=false --balance-frac=0.00001 --potfn-start=0 --potfn-goal=0 \
		--block-seed=6 --prob-block=0.0002 --prob-unblock=0.0998 --num-episodes=2 \
		--out-distancestart-fmt='example-incuni-dstart-%d-stem.txt' \
		--out-vexpanded-fmt='example-incuni-vexpanded-%d-stem.txt' \
		--out-stats='example-incuni-stats-stem.txt'
example-incuni-0.png: example-incuni-vexpanded-0-stem.txt example-incuni-dstart-0-stem.txt
	rosrun thesis_experiments fig-incbi-road-ne-draw.py \
		--road-d-ne-co=USA-road-d.NE.co --road-t-ne-gr=USA-road-t.NE.gr \
		--in-distancestart=example-incuni-dstart-0-stem.txt \
		--in-vexpanded=example-incuni-vexpanded-0-stem.txt \
		--out-png=$@
example-incuni-1.png: example-incuni-vexpanded-1-stem.txt example-incuni-dstart-1-stem.txt
	rosrun thesis_experiments fig-incbi-road-ne-draw.py \
		--road-d-ne-co=USA-road-d.NE.co --road-t-ne-gr=USA-road-t.NE.gr \
		--in-distancestart=example-incuni-dstart-1-stem.txt \
		--in-vexpanded=example-incuni-vexpanded-1-stem.txt \
		--out-png=$@

all: example-incbi-0.png
all: example-incbi-1.png
example-incbi-dstart-0-%.txt example-incbi-dstart-1-%.txt example-incbi-dgoal-0-%.txt example-incbi-dgoal-1-%.txt example-incbi-vexpanded-0-%.txt example-incbi-vexpanded-1-%.txt example-incbi-stats-%.txt:
	rosrun thesis_experiments incbi-road-ne --v-start=458584 --v-goal=249500 \
		--use-cardinality=false --balance-frac=0.5 --potfn-start=0 --potfn-goal=0 \
		--block-seed=6 --prob-block=0.0002 --prob-unblock=0.0998 --num-episodes=2 \
		--out-distancestart-fmt='example-incbi-dstart-%d-stem.txt' \
		--out-distancegoal-fmt='example-incbi-dgoal-%d-stem.txt' \
		--out-vexpanded-fmt='example-incbi-vexpanded-%d-stem.txt' \
		--out-stats='example-incbi-stats-stem.txt'
example-incbi-0.png: example-incbi-vexpanded-0-stem.txt example-incbi-dstart-0-stem.txt
	rosrun thesis_experiments fig-incbi-road-ne-draw.py \
		--road-d-ne-co=USA-road-d.NE.co --road-t-ne-gr=USA-road-t.NE.gr \
		--in-distancestart=example-incbi-dstart-0-stem.txt \
		--in-distancegoal=example-incbi-dgoal-0-stem.txt \
		--in-vexpanded=example-incbi-vexpanded-0-stem.txt \
		--out-png=$@
example-incbi-1.png: example-incbi-vexpanded-1-stem.txt example-incbi-dstart-1-stem.txt
	rosrun thesis_experiments fig-incbi-road-ne-draw.py \
		--road-d-ne-co=USA-road-d.NE.co --road-t-ne-gr=USA-road-t.NE.gr \
		--in-distancestart=example-incbi-dstart-1-stem.txt \
		--in-distancegoal=example-incbi-dgoal-1-stem.txt \
		--in-vexpanded=example-incbi-vexpanded-1-stem.txt \
		--out-png=$@

# non-incremetal astar examples

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
