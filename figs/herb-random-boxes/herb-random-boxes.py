#!/usr/bin/env python2
import atexit
import random
import numpy
import openravepy

# create an environment, load the robot (wam)
openravepy.RaveInitialize(True, level=openravepy.DebugLevel.Info)
atexit.register(openravepy.RaveDestroy)
e = openravepy.Environment()
atexit.register(e.Destroy)

e.SetViewer('qtcoin')

r = e.ReadRobotXMLFile('robots/herb2_padded_nosensors.robot.xml')
e.Add(r)

dofvals = [
   5.759, -1.972, -0.20, 1.9, 0., 0., 0., 1.3,1.3,1.3,0., # right
   0.630, -1.900,  0.15, 1.9, 0., 0., 0., 2.3,2.3,2.3,0.  # left
]
r.SetDOFValues(dofvals,range(len(dofvals)))

for i in range(50):
   x = -0.5  + 1.5 * random.random()
   y = -0.75 + 1.5 * random.random()
   z = -0.5  + 2.0 * random.random()
   ex = 0.2 * random.random()
   ey = 0.2 * random.random()
   ez = 0.2 * random.random()

   b = openravepy.RaveCreateKinBody(e,'')
   b.InitFromBoxes(numpy.array([[ x, y, z, ex, ey, ez]]), True)
   b.SetName('divider_{}'.format(i))
   e.AddKinBody(b)
   
   if e.CheckCollision(r):
      e.Remove(b)

raw_input('enter to quit')
