#!/usr/bin/env bash

# Setup dual monitors
if xrandr | grep -q 'HDMI-A-0 connected' ; then
    xrandr --output DisplayPort-0 --off --output DisplayPort-1 --mode 1920x1080 --pos 1080x420 --rotate normal --output HDMI-A-0 --off --output HDMI-A-1 --off
fi
