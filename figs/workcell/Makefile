# generate screenshots from qtcoin

.DELETE_ON_EXIT:

all: cropped-config-a.png
all: cropped-config-b.png
all: cropped-config-c.png
all: cropped-config-d.png
all: cropped-config-e.png
all: cropped-config-f.png
all: cropped-config-g.png
all: cropped-config-h.png
all: cropped-config-i.png
all: cropped-config-j.png
all: config-b.png
all: config-c.png
all: config-d.png
all: config-e.png
all: config-f.png
all: config-g.png
all: config-h.png
all: config-i.png
all: config-j.png

config-a.png:
	rosrun thesis_experiments fig-workcell-configs.py --problem=ab --start-png=$@ || true
	if [ ! -e $@ ]; then false; fi

config-b.png:
	rosrun thesis_experiments fig-workcell-configs.py --problem=bc --start-png=$@ || true
	if [ ! -e $@ ]; then false; fi

config-c.png:
	rosrun thesis_experiments fig-workcell-configs.py --problem=cd --start-png=$@ || true
	if [ ! -e $@ ]; then false; fi

config-d.png:
	rosrun thesis_experiments fig-workcell-configs.py --problem=cd --goal-png=$@ || true
	if [ ! -e $@ ]; then false; fi

config-e.png:
	rosrun thesis_experiments fig-workcell-configs.py --problem=ef --start-png=$@ || true
	if [ ! -e $@ ]; then false; fi

config-f.png:
	rosrun thesis_experiments fig-workcell-configs.py --problem=fg --start-png=$@ || true
	if [ ! -e $@ ]; then false; fi

config-g.png:
	rosrun thesis_experiments fig-workcell-configs.py --problem=gh --start-png=$@ || true
	if [ ! -e $@ ]; then false; fi

config-h.png:
	rosrun thesis_experiments fig-workcell-configs.py --problem=gh --goal-png=$@ || true
	if [ ! -e $@ ]; then false; fi

config-i.png:
	rosrun thesis_experiments fig-workcell-configs.py --problem=ij --start-png=$@ || true
	if [ ! -e $@ ]; then false; fi
	
config-j.png:
	rosrun thesis_experiments fig-workcell-configs.py --problem=ja --start-png=$@ || true
	if [ ! -e $@ ]; then false; fi

cropped-config-a.png: config-a.png
	convert +repage $^ -crop '568x405+0+0' $@
cropped-config-b.png: config-b.png
	convert +repage $^ -crop '230x200+90+90' $@
cropped-config-c.png: config-c.png
	convert +repage $^ -crop '230x200+100+80' $@
cropped-config-d.png: config-d.png
	convert +repage $^ -crop '230x200+180+55' $@
cropped-config-e.png: config-e.png
	convert +repage $^ -crop '230x200+180+55' $@
cropped-config-f.png: config-f.png
	convert +repage $^ -crop '230x200+180+90' $@
cropped-config-g.png: config-g.png
	convert +repage $^ -crop '230x200+180+90' $@
cropped-config-h.png: config-h.png
	convert +repage $^ -crop '230x200+180+55' $@
cropped-config-i.png: config-i.png
	convert +repage $^ -crop '230x200+180+55' $@
cropped-config-j.png: config-j.png
	convert +repage $^ -crop '230x200+140+150' $@

.PHONY: clean
clean:
	rm -f config-a.png
	rm -f config-b.png
	rm -f config-c.png
	rm -f config-d.png
	rm -f config-e.png
	rm -f config-f.png
	rm -f config-g.png
	rm -f config-h.png
	rm -f config-i.png
	rm -f config-j.png
