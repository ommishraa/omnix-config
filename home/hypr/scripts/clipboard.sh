#!/usr/bin/env bash

# Fetch the list from cliphist and show it in rofi
# We use -dmenu to make rofi act as a picker
selection=$(cliphist list | rofi -dmenu -p "Clipboard")

# If something was selected (length of string > 0), decode and copy it
if [ -n "$selection" ]; then
  echo "$selection" | cliphist decode | wl-copy
fi
