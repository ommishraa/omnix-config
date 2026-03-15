#!/usr/bin/env bash
# hypr/scripts/KeyHints.sh
# Show quick keybind hints via rofi

rofi -dmenu -p "󰌌 Keybinds" -i -no-custom << 'EOF'
super + Enter          → Terminal
super + Q              → Close window
super + E              → File manager (yazi)
super + R              → App launcher (rofi)
super + T              → Theme switcher
super + L              → Lock screen
super + shift + S      → Screenshot
super + 1-9            → Switch workspace
super + shift + 1-9    → Move window to workspace
super + F              → Fullscreen
super + V              → Floating toggle
super + shift + T      → Kitty theme switcher
super + M              → Exit Hyprland
EOF