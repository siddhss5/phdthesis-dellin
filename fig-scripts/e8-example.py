#!/usr/bin/env python3

import argparse

# we keep track of total planning cost
total_planning_cost = [0.0]
total_path = [[]]

alpha = 8.0
lambda_ = 0.5
epsilon = 1.0 + (alpha*lambda_)/(1.0-lambda_)

def g_neighbors(v):
   (x,y) = v
   ns = []
   for dx in (-1,0,1):
      for dy in (-1,0,1):
         if dx == dy == 0:
            continue
         nx = x + dx
         ny = y + dy
         if 0 <= nx <= 10 and 0 <= ny <= 10:
            ns.append((nx,ny))
   return ns

# x1,y1,x2,y2
boxes = [
#   (0.3,4.3, 4.7,4.7),
#   (4.3,1.3, 4.7,4.3)
   (0.3,6.3, 6.7,6.7),
   (6.3,2.3, 6.7,6.3)
]

# radar locations
#radars = [(-0.5,0.5),(10.5,1.5),(5.5,10.5)]
#radars = [(5,-0.5),(5,10.5),(-0.5,5)]
radars = [(5,10.5)]

# compute AVERAGE DISTANCE TO CLOSEST RADAR across all edges
mids = []
# horizontal edges
for j in range(11):
   for i in range(10):
      mids.append((0.5+i,j))
# vertical edges
for i in range(11):
   for j in range(10):
      mids.append((i,0.5+j))
# compute distances to closest radar for each
dists = []
for x,y in mids:
   this_dists = []
   for rx,ry in radars:
      this_dists.append(((x-rx)**2+(y-ry)**2)**0.5)
   dists.append(sorted(this_dists)[0])
avg_radar_dist = sum(dists)/len(dists)


def g_exec_actual(va, vb):
   mx = 0.5 * (va[0] + vb[0])
   my = 0.5 * (va[1] + vb[1])
   for x1,y1,x2,y2 in boxes:
      if x1 < mx < x2 and y1 < my < y2:
         return float('inf')
   return ((vb[0]-va[0])**2.0 + (vb[1]-va[1])**2.0)**0.5

def g_exec_predicted(va, vb):
   return ((vb[0]-va[0])**2.0 + (vb[1]-va[1])**2.0)**0.5

def g_plan(va, vb):
   mx = 0.5 * (va[0] + vb[0])
   my = 0.5 * (va[1] + vb[1])
   this_dists = []
   for rx,ry in radars:
      this_dists.append(((mx-rx)**2+(my-ry)**2)**0.5)
   dist = sorted(this_dists)[0]
   return (alpha/avg_radar_dist) * dist * g_exec_predicted(va, vb)

def g_plan_avg(va, vb):
   return alpha * g_exec_predicted(va, vb)

def dijkstras(vs, vg, cost):
   closedset = {} # vertex -> parent
   openset = {} # vertex -> (cost, parent)
   openset[vs] = (0., None)
   
   while True:
      # get cheapest
      openset_list = [(cost_vertex,vertex,parent)
         for vertex,(cost_vertex,parent) in openset.items()]
      openset_list.sort()
      cost_vertex, vertex, parent = openset_list[0]
      
      # move sets
      del openset[vertex]
      closedset[vertex] = parent
      
      if vertex == vg:
         break
      
      for child in g_neighbors(vertex):
         cost_child = cost_vertex + cost(vertex,child)
         if child in closedset:
            continue
         if child in openset and openset[child][0] <= cost_child:
            continue
         openset[child] = (cost_child, vertex)
      
   path = []
   vertex = vg
   while vertex is not None:
      path.insert(0,vertex)
      vertex = closedset[vertex]
   return path

class EvalSaver:
   def __init__(self, costfn_not_evaled):
      self.evaled = {} # edge -> cost
      self.costfn_not_evaled = costfn_not_evaled
   def cost(self, va, vb):
      e1 = (va, vb)
      e2 = (vb, va)
      if e1 in self.evaled:
         return self.evaled[e1]
      if e2 in self.evaled:
         return self.evaled[e2]
      else:
         return self.costfn_not_evaled(va, vb)
   def isevaled(self, va, vb):
      e1 = (va, vb)
      e2 = (vb, va)
      return e1 in self.evaled or e2 in self.evaled
   def listevaled(self):
      return self.evaled.keys()
   def eval(self, va, vb, costfn):
      print('  evaluating:', va, vb)
      e = (va, vb)
      self.evaled[e] = costfn(va, vb)
      total_planning_cost[0] += g_plan(va, vb)

class CostCombined:
   def __init__(self, costfns):
      self.costfns = costfns
   def cost(self, va, vb):
      ret = 0.
      for coef,costfn in self.costfns:
         ret += coef * costfn(va, vb)
      return ret

# returns True if path was already fully done!
def evalpath_fwdedge(path, isevaled, evalfn):
   edge_first = None
   for i in range(len(path)-1):
      va = path[i]
      vb = path[i+1]
      if not isevaled(va, vb):
         edge_first = (va, vb)
         break
   if edge_first is None:
      return True
   evalfn(*edge_first)
   return False

p = argparse.ArgumentParser()
p.add_argument('--fn', required=True)
p.add_argument('--output_tikz', required=True)
p.add_argument('--output_stats', required=True)
args = p.parse_args()

vs = (1,1)
vg = (9,9)

def fn_intro(fp):
   pass

def fn_astar(fp):
   # best-first search, a* version
   s = EvalSaver(g_exec_predicted)
   while True:
      path = dijkstras(vs, vg, s.cost)
      print('opt path:', path)
      isdone = evalpath_fwdedge(path, s.isevaled,
         (lambda va,vb: s.eval(va,vb,g_exec_actual)))
      if isdone:
         break
   for va,vb in s.listevaled():
      fp.write('\draw[black!50] ({},{}) -- ({},{});\n'.format(
         va[0],va[1], vb[0],vb[1]))
   for i in range(len(path)-1):
      va = path[i]
      vb = path[i+1]
      fp.write('\draw[black,thick] ({},{}) -- ({},{});\n'.format(
         va[0],va[1], vb[0],vb[1]))
   total_path[0] = path

def fn_wastar(fp):
   # best-first search, weighted a* version
   # non-evaled edges get cost from both exec and planning!
   c = CostCombined([(epsilon,g_exec_predicted)]) # weighted, epsilon=2!
   # this stores ACTUAL exec cost (planning cost = 0 if evaled!)
   s = EvalSaver(c.cost)
   while True:
      path = dijkstras(vs, vg, s.cost)
      print('opt path:', path)
      isdone = evalpath_fwdedge(path, s.isevaled,
         (lambda va,vb: s.eval(va,vb,g_exec_actual)))
      if isdone:
         break
   for va,vb in s.listevaled():
      fp.write('\draw[black!50] ({},{}) -- ({},{});\n'.format(
         va[0],va[1], vb[0],vb[1]))
   for i in range(len(path)-1):
      va = path[i]
      vb = path[i+1]
      fp.write('\draw[black,thick] ({},{}) -- ({},{});\n'.format(
         va[0],va[1], vb[0],vb[1]))
   total_path[0] = path

def fn_e8(fp):
   # best-first search, weighted a* version
   # non-evaled edges get cost from both exec and planning!
   c = CostCombined([(1.0,g_exec_predicted),(lambda_/(1.0-lambda_),g_plan)]) # e8, lambda=0.5, alpha=2!
   # this stores ACTUAL exec cost (planning cost = 0 if evaled!)
   s = EvalSaver(c.cost)
   while True:
      path = dijkstras(vs, vg, s.cost)
      print('opt path:',  path)
      isdone = evalpath_fwdedge(path, s.isevaled,
         (lambda va,vb: s.eval(va,vb,g_exec_actual)))
      if isdone:
         break
   for va,vb in s.listevaled():
      fp.write('\draw[black!50] ({},{}) -- ({},{});\n'.format(
         va[0],va[1], vb[0],vb[1]))
   for i in range(len(path)-1):
      va = path[i]
      vb = path[i+1]
      fp.write('\draw[black,thick] ({},{}) -- ({},{});\n'.format(
         va[0],va[1], vb[0],vb[1]))
   total_path[0] = path

# output!
fp = open(args.output_tikz,'w')
fp.write(r'''\documentclass{standalone}
\usepackage{tikz}
\begin{document}
\begin{tikzpicture}[scale=0.4]

\draw[black!20] (-0.5,-0.5) rectangle (10.5,10.5);

\draw[step=1cm,black!20,very thin] (0,0) grid (10,10);

% radars
\begin{scope}
   \clip (-0.5,-0.5) rectangle (10.5,10.5);
''')
for rx,ry in radars:
   fp.write('   \\fill[blue] ({},{}) circle (0.3cm);\n'.format(rx,ry))
fp.write(r'''
\end{scope}

% obstacles
''')
for x1,y1,x2,y2 in boxes:
   fp.write('\\fill[black] ({},{}) rectangle ({},{});\n'.format(
      x1,y1,x2,y2))

fp.write(r'''
\fill[gray] (1.0,1.0) circle (0.2cm);
\fill[gray] (9.0,9.0) circle (0.2cm);
''')

local_fn = 'fn_{}'.format(args.fn)
if local_fn in locals():
   locals()[local_fn](fp)
else:
   raise RuntimeError('unknown fn: {}'.format(args.fn))

fp.write(r'''\end{tikzpicture}
\end{document}
''')
fp.close()


fp = open(args.output_stats,'w')
eval_cost = 0.0
for i in range(len(total_path[0])-1):
   va = total_path[0][i]
   vb = total_path[0][i+1]
   eval_cost += g_exec_actual(va, vb)
latexname = 'worldstats{}'.format(args.fn).replace('8','E')
fp.write('\\newcommand{{\\{}exec}}{{{}}}\n'.format(
   latexname, eval_cost))
fp.write('\\newcommand{{\\{}plan}}{{{}}}\n'.format(
   latexname, total_planning_cost[0]))
fp.close()
