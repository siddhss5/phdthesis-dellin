
.DELETE_ON_ERROR:

all:

# these came from measured experiment
#stats-2d-halton2,3.txt
#stats-2d-uniform0.txt

all: stats-unit2d-halton.txt
all: stats-unit2d-incsukharev.txt
stats-unit2d-%.txt:
	rosrun thesis_experiments dispersion-bounds.py --type=$* --dim=2 --bounds=0:0,1 --bounds=1:0,1 > $@

# $ rosrun or_lemur get-robot-space-bounds.py
#      --urdf=package://herb_description/robots/herb.urdf
#      --srdf=package://herb_description/robots/herb.srdf --manip=right
HERBARGS=--dim=7 --bounds=0:0.54159265359,5.74159265359 --bounds=1:-1.96,1.96 --bounds=2:-2.73,2.73 --bounds=3:-0.86,3.13 --bounds=4:-4.79,1.3 --bounds=5:-1.56,1.56 --bounds=6:-2.99,2.99

all: stats-herb-halton.txt
all: stats-herb-incsukharev.txt
stats-herb-%.txt:
	rosrun thesis_experiments dispersion-bounds.py --type=$* $(HERBARGS) > $@

# $ rosrun or_lemur get-robot-space-bounds.py
#      --robot-xml `catkin_find thesis_experiments ordata/robots/irb4400/irb4400.robot.xml`
IRB4400ARGS=--dim=6 --bounds=0:-2.87979326579,2.87979326579 --bounds=1:-1.2217304764,1.67551608191 --bounds=2:-1.0471975512,1.1344640138 --bounds=3:-3.49065850399,3.49065850399 --bounds=4:-2.09439510239,2.09439510239 --bounds=5:-6.98131700798,6.98131700798

all: stats-irb4400-halton.txt
all: stats-irb4400-incsukharev.txt
stats-irb4400-%.txt:
	rosrun thesis_experiments dispersion-bounds.py --type=$* $(IRB4400ARGS) > $@
