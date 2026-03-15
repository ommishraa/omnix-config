#!/usr/bin/env zsh
# hypr/scripts/theme-switch.sh
# Switch kitty color theme on the fly
# Usage: theme-switch.sh [theme-name]
# Or run without args to use rofi picker

THEMES_DIR="$HOME/.config/kitty/themes"
COLORS_FILE="$HOME/.config/kitty/colors.conf"
CURRENT_FILE="$HOME/.config/kitty/.current_theme"

mkdir -p "$THEMES_DIR"

# ── Define themes inline ───────────────────────────────────
write_themes() {

# Tokyo Night
cat > "$THEMES_DIR/tokyo-night.conf" << 'EOF'
background            #1a1b26
foreground            #a9b1d6
selection_foreground  #c0caf5
selection_background  #7aa2f7
cursor                #c0caf5
cursor_text_color     #1a1b26
color0   #32344a
color1   #f7768e
color2   #9ece6a
color3   #e0af68
color4   #7aa2f7
color5   #ad8ee6
color6   #449dab
color7   #787c99
color8   #444b6a
color9   #ff7a93
color10  #b9f27c
color11  #ff9e64
color12  #7da6ff
color13  #bb9af7
color14  #0db9d7
color15  #acb0d0
EOF

# Catppuccin Mocha
cat > "$THEMES_DIR/catppuccin-mocha.conf" << 'EOF'
background            #1e1e2e
foreground            #cdd6f4
selection_foreground  #1e1e2e
selection_background  #f5c2e7
cursor                #f5e0dc
cursor_text_color     #1e1e2e
color0   #45475a
color1   #f38ba8
color2   #a6e3a1
color3   #f9e2af
color4   #89b4fa
color5   #f5c2e7
color6   #94e2d5
color7   #bac2de
color8   #585b70
color9   #f38ba8
color10  #a6e3a1
color11  #f9e2af
color12  #89b4fa
color13  #f5c2e7
color14  #94e2d5
color15  #a6adc8
EOF

# Catppuccin Latte (light)
cat > "$THEMES_DIR/catppuccin-latte.conf" << 'EOF'
background            #eff1f5
foreground            #4c4f69
selection_foreground  #eff1f5
selection_background  #7287fd
cursor                #dc8a78
cursor_text_color     #eff1f5
color0   #5c5f77
color1   #d20f39
color2   #40a02b
color3   #df8e1d
color4   #1e66f5
color5   #ea76cb
color6   #179299
color7   #acb0be
color8   #6c6f85
color9   #d20f39
color10  #40a02b
color11  #df8e1d
color12  #1e66f5
color13  #ea76cb
color14  #179299
color15  #bcc0cc
EOF

# Dracula
cat > "$THEMES_DIR/dracula.conf" << 'EOF'
background            #282a36
foreground            #f8f8f2
selection_foreground  #ffffff
selection_background  #44475a
cursor                #f8f8f2
cursor_text_color     #282a36
color0   #21222c
color1   #ff5555
color2   #50fa7b
color3   #f1fa8c
color4   #bd93f9
color5   #ff79c6
color6   #8be9fd
color7   #f8f8f2
color8   #6272a4
color9   #ff6e6e
color10  #69ff94
color11  #ffffa5
color12  #d6acff
color13  #ff92df
color14  #a4ffff
color15  #ffffff
EOF

# Nord
cat > "$THEMES_DIR/nord.conf" << 'EOF'
background            #2e3440
foreground            #d8dee9
selection_foreground  #d8dee9
selection_background  #4c566a
cursor                #d8dee9
cursor_text_color     #2e3440
color0   #3b4252
color1   #bf616a
color2   #a3be8c
color3   #ebcb8b
color4   #81a1c1
color5   #b48ead
color6   #88c0d0
color7   #e5e9f0
color8   #4c566a
color9   #bf616a
color10  #a3be8c
color11  #ebcb8b
color12  #81a1c1
color13  #b48ead
color14  #8fbcbb
color15  #eceff4
EOF

# Gruvbox Dark
cat > "$THEMES_DIR/gruvbox-dark.conf" << 'EOF'
background            #282828
foreground            #ebdbb2
selection_foreground  #ebdbb2
selection_background  #d65d0e
cursor                #ebdbb2
cursor_text_color     #282828
color0   #282828
color1   #cc241d
color2   #98971a
color3   #d79921
color4   #458588
color5   #b16286
color6   #689d6a
color7   #a89984
color8   #928374
color9   #fb4934
color10  #b8bb26
color11  #fabd2f
color12  #83a598
color13  #d3869b
color14  #8ec07c
color15  #ebdbb2
EOF

# Rosé Pine
cat > "$THEMES_DIR/rose-pine.conf" << 'EOF'
background            #191724
foreground            #e0def4
selection_foreground  #e0def4
selection_background  #403d52
cursor                #524f67
cursor_text_color     #e0def4
color0   #26233a
color1   #eb6f92
color2   #31748f
color3   #f6c177
color4   #9ccfd8
color5   #c4a7e7
color6   #ebbcba
color7   #e0def4
color8   #6e6a86
color9   #eb6f92
color10  #31748f
color11  #f6c177
color12  #9ccfd8
color13  #c4a7e7
color14  #ebbcba
color15  #e0def4
EOF

# Teal (brother's theme)
cat > "$THEMES_DIR/teal.conf" << 'EOF'
background            #0e1415
foreground            #dde4e3
selection_foreground  #80d4d7
selection_background  #003738
cursor                #80d4d7
cursor_text_color     #0e1415
color0   #0e1415
color1   #ffb4ab
color2   #80d4d7
color3   #b4c8e9
color4   #9cf1f3
color5   #cce8e8
color6   #b0cccc
color7   #dde4e3
color8   #343a3a
color9   #ffb4ab
color10  #80d4d7
color11  #b4c8e9
color12  #9cf1f3
color13  #cce8e8
color14  #b0cccc
color15  #dde4e3
EOF

}

# ── Apply theme ────────────────────────────────────────────
apply_theme() {
    local theme="$1"
    local theme_file="$THEMES_DIR/$theme.conf"

    if [[ ! -f "$theme_file" ]]; then
        echo "Theme not found: $theme"
        echo "Available: $(ls $THEMES_DIR | sed 's/.conf//' | tr '\n' ' ')"
        return 1
    fi

    cp "$theme_file" "$COLORS_FILE"
    echo "$theme" > "$CURRENT_FILE"

    # Reload all kitty instances
    kill -SIGUSR1 $(pgrep -a kitty | awk '{print $1}') 2>/dev/null

    echo "Theme applied: $theme"
}

# ── Rofi picker ────────────────────────────────────────────
pick_theme() {
    local current=$(cat "$CURRENT_FILE" 2>/dev/null || echo "none")
    local theme=$(ls "$THEMES_DIR" | sed 's/.conf//' | \
        rofi -dmenu \
             -p "󰏘 Theme" \
             -mesg "Current: $current" \
             -theme-str 'window {width: 400px;}' \
             -i)

    [[ -n "$theme" ]] && apply_theme "$theme"
}

# ── Main ───────────────────────────────────────────────────
write_themes

if [[ -n "$1" ]]; then
    apply_theme "$1"
else
    pick_theme
fi