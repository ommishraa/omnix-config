#!/bin/zsh
# hypr/scripts/hyprlock.sh
# Animated lock — blurs wallpaper via swww before hyprlock, restores on unlock

CURRENT_WALL=$(readlink -f ~/.config/hypr/current_wallpaper)
BLUR_CACHE="/tmp/hyprlock-blur.png"

# ── Pre-generate blurred wallpaper ────────────────────────
if [[ -f "$CURRENT_WALL" ]]; then
    convert "$CURRENT_WALL" \
        -filter Gaussian \
        -blur 0x18 \
        -modulate 70 \
        "$BLUR_CACHE" &
    CONVERT_PID=$!
fi

# ── Fade to blurred wallpaper via swww ────────────────────
if command -v swww &>/dev/null && [[ -f "$CURRENT_WALL" ]]; then
    wait $CONVERT_PID 2>/dev/null
    if [[ -f "$BLUR_CACHE" ]]; then
        swww img "$BLUR_CACHE" \
            --transition-type fade \
            --transition-duration 0.6 \
            --transition-fps 60
        sleep 0.5
    fi
fi

# ── Launch hyprlock ────────────────────────────────────────
hyprlock

# ── Restore original wallpaper on unlock ──────────────────
if [[ -f "$CURRENT_WALL" ]]; then
    swww img "$CURRENT_WALL" \
        --transition-type fade \
        --transition-duration 0.8 \
        --transition-fps 60
fi

rm -f "$BLUR_CACHE"