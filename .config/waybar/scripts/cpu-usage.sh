#!/bin/bash

ICON=$'\uF201'

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1 | cut -d',' -f1 | awk '{printf "%d", $1}')

if [ "$CPU" -ge 80 ]; then
    echo "<span color='#E78284'><b>${ICON} $(printf '%3d' $CPU)%</b></span>"
elif [ "$CPU" -ge 50 ]; then
    echo "<span color='#EA999C'>${ICON} $(printf '%3d' $CPU)%</span>"
else
    echo "<span color='#d8dee9'>${ICON} $(printf '%3d' $CPU)%</span>"
fi
