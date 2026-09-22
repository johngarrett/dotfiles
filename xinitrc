#!/bin/sh

# Xorg does not need a hand-written xorg.conf for a typical single-monitor setup.
# Start i3 as the X session; startx exits when i3 exits.
exec i3
