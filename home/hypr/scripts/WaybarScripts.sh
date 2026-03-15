#!/usr/bin/env bash
# hypr/scripts/WaybarScripts.sh
# Launches various apps from waybar clicks

case "$1" in
    --term)
        kitty &
        ;;
    --btop)
        kitty --class floating-term -e btop &
        ;;
    --nvtop)
        kitty --class floating-term -e btop &
        ;;
    --nmtui)
        kitty --class floating-term -e impala &
        ;;
    --bluetooth)
        kitty --class floating-term -e bluetui &
        ;;
    --audio)
        kitty --class floating-term -e pulsemixer &
        ;;
    --files)
        kitty --class floating-term -e yazi &
        ;;
    *)
        kitty &
        ;;
esac