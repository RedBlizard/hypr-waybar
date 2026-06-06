#!/bin/bash

ICON_DISABLED="<span font='9'>󰾪</span>"
ICON_ENABLED="<span font='9'>󰅶</span>"

if pgrep -x hypridle > /dev/null; then
    echo '{"text":"'"$ICON_ENABLED"'","class":"active","tooltip":"Screen locking active\nLeft: Deactivate\nRight: Lock Screen"}'
else
    echo '{"text":"'"$ICON_DISABLED"'","class":"notactive","tooltip":"Screen locking deactivated\nLeft: Activate\nRight: Lock Screen"}'
fi
