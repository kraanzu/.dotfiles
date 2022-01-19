#!/usr/bin/env bash

#turns of Laptop's screen if connected to an external monitor
if xrandr | grep -q 'HDMI1 connected' ; then
    xrandr --output eDP1 --off
fi
