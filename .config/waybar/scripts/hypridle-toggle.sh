#!/bin/bash

if pgrep -x hypridle > /dev/null; then
    killall hypridle
else
    hypridle -w ~/.config/hypr/hypridle.conf &
    disown
fi

pkill -RTMIN+8 waybar
