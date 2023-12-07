#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch mybar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mybar &
  done
else
  polybar --reload mybar &
fi
