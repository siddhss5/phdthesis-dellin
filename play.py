
import argparse
import math
import os
import re
import subprocess
import string
import sys

parser = argparse.ArgumentParser(description='play a video from beamer')
parser.add_argument('--video', required=True)
parser.add_argument('--ne-x', type=int, required=True)
parser.add_argument('--ne-y', type=int, required=True)
parser.add_argument('--sw-x', type=int, required=True)
parser.add_argument('--sw-y', type=int, required=True)
#args = parser.parse_args()
args, unknown = parser.parse_known_args()

# get size/offset of movie on slide
# cm -> in -> pt -> base points
slide_width_cm  = 12.80
slide_height_cm =  9.60
slide_width_bp  = slide_width_cm  / 2.54 * 72.27 * 65536
slide_height_bp = slide_height_cm / 2.54 * 72.27 * 65536
video_width_frac  = 1.0 * (args.ne_x - args.sw_x) / slide_width_bp
video_height_frac = 1.0 * (args.ne_y - args.sw_y) / slide_height_bp
video_left_frac = 1.0 * args.sw_x / slide_width_bp
video_top_frac = 1.0 - 1.0 * args.ne_y / slide_height_bp

# get size of screen
d = {}
for line in subprocess.check_output(['xwininfo','-root']).split('\n'):
   m = re.match('([^:]+): ([^:]+)$', line)
   if m is not None:
      k,v = map(string.strip, m.groups())
      d[k] = v
screen_width_px  = int(d['Width'])
screen_height_px = int(d['Height'])

# get size/offset of window (assume window is centered)
window_width_px = screen_width_px
window_height_px = screen_height_px
window_left_px = 0
window_top_px = 0
if screen_width_px * slide_height_cm > screen_height_px * slide_width_cm:
   window_width_px = int(round(screen_height_px * slide_width_cm / slide_height_cm))
   window_left_px = int(round(0.5 * (screen_width_px - window_width_px)))
else:
   window_height_px = int(round(screen_width_px * slide_height_cm / slide_height_cm))
   window_left_px = int(round(0.5 * (screen_height_px - window_height_px)))

# get video location
video_width_px = int(round(window_width_px * video_width_frac))
video_height_px = int(round(window_height_px * video_height_frac))
video_left_px = int(round(window_left_px + window_width_px * video_left_frac))
video_top_px = int(round(window_top_px + window_height_px * video_top_frac))

cwd = os.path.abspath(os.path.dirname(__file__))

subprocess.check_call(['mplayer','-noborder','--ontop',
   '-geometry','{}x{}+{}+{}'.format(video_width_px,video_height_px,video_left_px,video_top_px),
   '-screenw','{}'.format(video_width_px),
   '-screenh','{}'.format(video_height_px),
   '{}/{}'.format(cwd,args.video)] + unknown)
