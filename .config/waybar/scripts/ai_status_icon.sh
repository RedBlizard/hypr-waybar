#!/bin/bash
STACK_DIR="$HOME/docker-setup"
COMPOSE_FILE="$STACK_DIR/docker-compose.yml"

# Check of er minstens één container 'Up' is
if docker-compose -f "$COMPOSE_FILE" ps --format '{{.Status}}' 2>/dev/null | grep -q "Up"; then
    # 🟢 Running → groen icoon
    COLOR="#d8dee9"
else
    # 🔴 Stopped → rood icoon
    COLOR="#E78284"
fi

# Output: Pango-formatted icon (font-size 9, geen extra tekst)
echo "<span font='9' color='$COLOR'></span>"
