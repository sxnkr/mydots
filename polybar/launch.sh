#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch bar
polybar top &
#external monitor bar
if [[ $(xrandr -q | grep 'HDMI-1-0 connected') ]]; then
	polybar top_external &
fi
