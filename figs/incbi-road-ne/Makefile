RUNS = pavgnone-baldist pavgfull-balcard pgoalfull-balfwd pavgfull-baldist pgoalhalf-balfwd pavghalf-balcard pgoalnone-balfwd pavghalf-baldist pavgnone-balcard

.PHONY: all
all:
	#rosrun e8_experiments fig-incbi-road-ne > cout.txt
	for run in $(RUNS); do rosrun e8_experiments fig-incbi-road-ne-draw.py --road-d-ne-co=USA-road-d.NE.co --road-t-ne-gr=USA-road-t.NE.gr --in-vexpanded=incbi-$${run}-original-vexpanded.txt --out-png=$${run}.png; done

.PHONY: clean
clean:
	for run in $(RUNS); do rm -f incbi-$${run}-original-vexpanded.txt $${run}.png; done
	rm -f cout.txt
