RUNS = pavgnone-baldist pavgfull-balcard pgoalfull-balfwd pavgfull-baldist pgoalhalf-balfwd pavghalf-balcard pgoalnone-balfwd pavghalf-baldist pavgnone-balcard


.PHONY: all
all:

RUN_VEXPANDS = $(foreach RUN,$(RUNS),incbi-$(RUN)-0-vexpanded.txt)
RUN_COUTS = $(foreach RUN,$(RUNS),incbi-$(RUN)-cout.txt)
all: $(RUN_VEXPANDS)

incbi-pgoalnone-balfwd-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-formatstr='incbi-pgoalnone-balfwd-%d-%s.txt' --use-cardinality=false --balance-frac=0.0 --potfn-start=0.00 --potfn-goal=0.00 > incbi-pgoalnone-balfwd-cout.txt

incbi-pgoalhalf-balfwd-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-formatstr='incbi-pgoalhalf-balfwd-%d-%s.txt' --use-cardinality=false --balance-frac=0.0 --potfn-start=0.00 --potfn-goal=0.50 > incbi-pgoalhalf-balfwd-cout.txt

incbi-pgoalfull-balfwd-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-formatstr='incbi-pgoalfull-balfwd-%d-%s.txt' --use-cardinality=false --balance-frac=0.0 --potfn-start=0.00 --potfn-goal=1.00 > incbi-pgoalfull-balfwd-cout.txt

incbi-pavgnone-baldist-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-formatstr='incbi-pavgnone-baldist-%d-%s.txt' --use-cardinality=false --balance-frac=0.5 --potfn-start=0.00 --potfn-goal=0.00 > incbi-pavgnone-baldist-cout.txt

incbi-pavghalf-baldist-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-formatstr='incbi-pavghalf-baldist-%d-%s.txt' --use-cardinality=false --balance-frac=0.5 --potfn-start=0.25 --potfn-goal=0.25 > incbi-pavghalf-baldist-cout.txt

incbi-pavgfull-baldist-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-formatstr='incbi-pavgfull-baldist-%d-%s.txt' --use-cardinality=false --balance-frac=0.5 --potfn-start=0.50 --potfn-goal=0.50 > incbi-pavgfull-baldist-cout.txt

incbi-pavgnone-balcard-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-formatstr='incbi-pavgnone-balcard-%d-%s.txt' --use-cardinality=true --balance-frac=0.5 --potfn-start=0.00 --potfn-goal=0.00 > incbi-pavgnone-balcard-cout.txt

incbi-pavghalf-balcard-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-formatstr='incbi-pavghalf-balcard-%d-%s.txt' --use-cardinality=true --balance-frac=0.5 --potfn-start=0.25 --potfn-goal=0.25 > incbi-pavghalf-balcard-cout.txt

incbi-pavgfull-balcard-0-vexpanded.txt:
	rosrun thesis_experiments incbi-road-ne --out-formatstr='incbi-pavgfull-balcard-%d-%s.txt' --use-cardinality=true --balance-frac=0.5 --potfn-start=0.50 --potfn-goal=0.50 > incbi-pavgfull-balcard-cout.txt


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
