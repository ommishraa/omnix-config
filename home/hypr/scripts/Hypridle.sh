#!/usr/bin/env bash
# hypr/scripts/Hypridle.sh
# Toggle hypridle on/off and report status for waybar

STATUS_FILE="/tmp/hypridle_inhibit"

case "$1" in
    status)
        if pgrep -x hypridle > /dev/null; then
            if [[ -f "$STATUS_FILE" ]]; then
                echo '{"text": "󱫗", "tooltip": "Idle inhibited", "class": "notactive"}'
            else
                echo '{"text": "󱫖", "tooltip": "Idle active", "class": "active"}'
            fi
        else
            echo '{"text": "󱫗", "tooltip": "Hypridle not running", "class": "notactive"}'
        fi
        ;;
    toggle)
        if [[ -f "$STATUS_FILE" ]]; then
            rm "$STATUS_FILE"
            systemctl --user start hypridle
            notify-send -u low "Hypridle" "Idle enabled"
        else
            touch "$STATUS_FILE"
            systemctl --user stop hypridle
            notify-send -u low "Hypridle" "Idle inhibited"
        fi
        ;;
esac