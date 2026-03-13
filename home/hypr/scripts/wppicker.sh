#!/usr/bin/env bash

# === CONFIG ===
WALLPAPER_DIR="$HOME/om-works/omnix-config/home/wallpapers"
SYMLINK_PATH="$HOME/.config/hypr/current_wallpaper"

# 1. === WALLPAPER PICKER ===
SELECTED_WALL=$(
  find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.jpeg" \) -exec basename {} \; |
    while read -r file; do
      echo -en "$file\0icon\x1f$WALLPAPER_DIR/$file\n"
    done | rofi -dmenu -p "󰸉 Wallpaper" -theme ~/.config/rofi/wallpaper.rasi
)

[ -z "$SELECTED_WALL" ] && exit 1
SELECTED_PATH="$WALLPAPER_DIR/$SELECTED_WALL"

# 2. === COLOR MODE PICKER ===
# Ask whether you want a light, dark, or pitch-black (AMOLED) theme
MODE=$(echo -e "dark\nlight\namoled" | rofi -dmenu -p "󰖨 Mode")

[ -z "$MODE" ] && exit 1

# 3. === SCHEME TYPE PICKER ===
# Material You has different algorithms for extracting/mixing colors.
# This lets you choose the "vibe" of the generated colors.
SCHEME=$(echo -e "scheme-tonal-spot\nscheme-expressive\nscheme-fidelity\nscheme-fruit-salad\nscheme-monochrome\nscheme-neutral\nscheme-rainbow" | rofi -dmenu -p " Palette")

[ -z "$SCHEME" ] && exit 1

# === SET WALLPAPER (Instant visual change) ===
swww img "$SELECTED_PATH" --transition-type any --transition-fps 60 &

# === CREATE SYMLINK ===
mkdir -p "$(dirname "$SYMLINK_PATH")"
ln -sf "$SELECTED_PATH" "$SYMLINK_PATH"

# === RUN MATUGEN WITH SELECTED OPTIONS ===
# We pass the selected mode (-m) and scheme (-t) explicitly.
# We keep `yes 1` just in case Matugen still finds multiple seed colors and tries to prompt.
yes 1 | matugen image "$SELECTED_PATH" -m "$MODE" -t "$SCHEME" >/dev/null 2>&1 &
