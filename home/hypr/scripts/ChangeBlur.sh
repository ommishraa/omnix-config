#!/usr/bin/env bash
# hypr/scripts/ChangeBlur.sh
# Toggle Hyprland blur on/off

BLUR=$(hyprctl getoption decoration:blur:enabled | grep "int:" | awk '{print $2}')

if [[ "$BLUR" == "1" ]]; then
    hyprctl keyword decoration:blur:enabled false
    notify-send -u low "Blur" "Disabled"
else
    hyprctl keyword decoration:blur:enabled true
    notify-send -u low "Blur" "Enabled"
fi