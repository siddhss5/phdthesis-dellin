
SHELL=/bin/bash

all: bean-typenopadding-lambda0p0000.png
all: bean-typenopadding-lambda0p9999.png
all: bean-typepaddedblackbox-lambda0p0000.png
all: bean-typepaddedblackbox-lambda0p9999.png
all: bean-typepaddedutility-lambda0p0000.png
all: bean-typepaddedutility-lambda0p9999.png

bean-typenopadding-%.png: dumps/updated
	rosrun thesis_experiments bean-plot2dimg-allpaths.py \
	   --input-img=input-bean-nopadding.png \
	   --input-dumps-glob="dumps/dump-typenopadding-$*-seed*.txt" \
	   --output-png=$@ > $@-out.txt
bean-typepaddedblackbox-%.png: dumps/updated
	rosrun thesis_experiments bean-plot2dimg-allpaths.py \
	   --input-img=input-bean-wpadding.png \
	   --input-dumps-glob="dumps/dump-typepaddedblackbox-$*-seed*.txt" \
	   --output-png=$@ > $@-out.txt
bean-typepaddedutility-%.png: dumps/updated
	rosrun thesis_experiments bean-plot2dimg-allpaths.py \
	   --input-img=input-bean-wpadding.png \
	   --input-dumps-glob="dumps/dump-typepaddedutility-$*-seed*.txt" \
	   --output-png=$@ > $@-out.txt

dumps/updated:
	mkdir -p dumps
	for type in nopadding paddedblackbox paddedutility; do \
		for i in {0..99}; do \
			dumpfile=`printf "dumps/dump-type$$type-lambda0p0000-seed%02d.txt" $$i`; \
			echo rosrun test_lemur test2dimg input-bean-wpadding.png $$type $$i $$dumpfile 0.0000; \
			rosrun thesis_experiments bean-test2dimg input-bean-wpadding.png $$type $$i $$dumpfile 0.0000; \
			dumpfile=`printf "dumps/dump-type$$type-lambda0p9999-seed%02d.txt" $$i`; \
			echo rosrun test_lemur test2dimg input-bean-wpadding.png $$type $$i $$dumpfile 0.9999; \
			rosrun thesis_experiments bean-test2dimg input-bean-wpadding.png $$type $$i $$dumpfile 0.9999; \
	done; done
	touch $@

.PHONY: stats
stats:
	for f in *-out.txt; do echo $$f; grep 'average ' $$f; echo; done

.PHONY: clean
clean:
	rm -f bean-typenopadding-lambda0p0000.png bean-typenopadding-lambda0p0000.png-out.txt
	rm -f bean-typenopadding-lambda0p9999.png bean-typenopadding-lambda0p9999.png-out.txt
	rm -f bean-typepaddedblackbox-lambda0p0000.png bean-typepaddedblackbox-lambda0p0000.png-out.txt
	rm -f bean-typepaddedblackbox-lambda0p9999.png bean-typepaddedblackbox-lambda0p9999.png-out.txt
	rm -f bean-typepaddedutility-lambda0p0000.png bean-typepaddedutility-lambda0p0000.png-out.txt
	rm -f bean-typepaddedutility-lambda0p9999.png bean-typepaddedutility-lambda0p9999.png-out.txt
	rm -rf dumps/
