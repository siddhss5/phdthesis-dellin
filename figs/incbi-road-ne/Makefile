RUNS = pavgnone-baldist pavgfull-balcard pgoalfull-balfwd pavgfull-baldist pgoalhalf-balfwd pavghalf-balcard pgoalnone-balfwd pavghalf-baldist pavgnone-balcard


.PHONY: all
all:

RUN_VEXPANDS = $(foreach RUN,$(RUNS),incbi-$(RUN)-original-vexpanded.txt)
all: $(RUN_VEXPANDS)

incbi-pgoalnone-balfwd-original-vexpanded.txt:
	rosrun thesis_experiments fig-incbi-road-ne --texfilename='incbi-pgoalnone-balfwd-%s.txt' --use-cardinality=false --balance-frac=0.0 --potfn-start=0.00 --potfn-goal=0.00

incbi-pgoalhalf-balfwd-original-vexpanded.txt:
	rosrun thesis_experiments fig-incbi-road-ne --texfilename='incbi-pgoalhalf-balfwd-%s.txt' --use-cardinality=false --balance-frac=0.0 --potfn-start=0.00 --potfn-goal=0.50

incbi-pgoalfull-balfwd-original-vexpanded.txt:
	rosrun thesis_experiments fig-incbi-road-ne --texfilename='incbi-pgoalfull-balfwd-%s.txt' --use-cardinality=false --balance-frac=0.0 --potfn-start=0.00 --potfn-goal=1.00

incbi-pavgnone-baldist-original-vexpanded.txt:
	rosrun thesis_experiments fig-incbi-road-ne --texfilename='incbi-pavgnone-baldist-%s.txt' --use-cardinality=false --balance-frac=0.5 --potfn-start=0.00 --potfn-goal=0.00

incbi-pavghalf-baldist-original-vexpanded.txt:
	rosrun thesis_experiments fig-incbi-road-ne --texfilename='incbi-pavghalf-baldist-%s.txt' --use-cardinality=false --balance-frac=0.5 --potfn-start=0.25 --potfn-goal=0.25

incbi-pavgfull-baldist-original-vexpanded.txt:
	rosrun thesis_experiments fig-incbi-road-ne --texfilename='incbi-pavgfull-baldist-%s.txt' --use-cardinality=false --balance-frac=0.5 --potfn-start=0.50 --potfn-goal=0.50

incbi-pavgnone-balcard-original-vexpanded.txt:
	rosrun thesis_experiments fig-incbi-road-ne --texfilename='incbi-pavgnone-balcard-%s.txt' --use-cardinality=true --balance-frac=0.5 --potfn-start=0.00 --potfn-goal=0.00

incbi-pavghalf-balcard-original-vexpanded.txt:
	rosrun thesis_experiments fig-incbi-road-ne --texfilename='incbi-pavghalf-balcard-%s.txt' --use-cardinality=true --balance-frac=0.5 --potfn-start=0.25 --potfn-goal=0.25

incbi-pavgfull-balcard-original-vexpanded.txt:
	rosrun thesis_experiments fig-incbi-road-ne --texfilename='incbi-pavgfull-balcard-%s.txt' --use-cardinality=true --balance-frac=0.5 --potfn-start=0.50 --potfn-goal=0.50


RUN_PNGS = $(foreach RUN,$(RUNS),$(RUN).png)
all: $(RUN_PNGS)

%.png: incbi-%-original-vexpanded.txt
	rosrun thesis_experiments fig-incbi-road-ne-draw.py --road-d-ne-co=USA-road-d.NE.co --road-t-ne-gr=USA-road-t.NE.gr --in-vexpanded=$< --out-png=$@


.PHONY: clean
clean:
	rm -f $(RUN_VEXPANDS)
	rm -f $(RUN_PNGS)
	rm -f cout.txt
