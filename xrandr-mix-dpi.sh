#!/bin/bash
# This script scales down the lower DPI monitor after Gnome scales up the entire
# screen for the high DPI monitor.
# See more about xrandr and high DPI settings on arch wiki.

xrandr --output DP-0 --auto --primary --scale 1x1 --output HDMI-0 --auto --scale 1x1 --right-of DP-0
xrandr --output DP-0 --auto --primary --output HDMI-0 --auto --scale 1.5x1.5 --right-of DP-0
