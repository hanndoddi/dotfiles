#!/bin/bash

# List available sinks
sinks=$(pactl list short sinks | awk '{print $2}')

# Get current default sink
default_sink=$(pactl info | grep 'Default Sink' | awk '{print $3}')

# Use Rofi to select a sink
chosen_sink=$(echo "$sinks" | rofi -dmenu -p "Select Audio Output (Current: $default_sink)")

# Set the chosen sink as default
if [ -n "$chosen_sink" ]; then
    pactl set-default-sink "$chosen_sink"
    notify-send "Audio Output Switched" "Now using: $chosen_sink"
fi
