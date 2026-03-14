# omnix-config · Design System
> **Theme:** Omarchy OS — Frosted Glass · Dark Matter · Liquid Depth

---

## Philosophy

The omnix rice is built around one idea: **depth through translucency**.
Everything should feel like it's floating above a dark, softly blurred world.
No harsh edges. No opaque boxes. Light refracts through panels, colour breathes
through blur, and motion is fluid — never abrupt.

Think: a rain-wet window at night with neon city lights bleeding through.

---

## Colour Palette

All colours are driven by **matugen** at runtime from the current wallpaper.
The values below are the *static fallbacks* and design intent — not hardcoded finals.

| Role              | Variable              | Fallback Hex  | Notes                              |
|-------------------|-----------------------|---------------|------------------------------------|
| Background        | `@background`         | `#0d0d12`     | Near-black, slight blue tint       |
| Surface / Glass   | `@surface`            | `#ffffff0d`   | 5% white — the "glass" base        |
| Surface High      | `@surface-high`       | `#ffffff1a`   | 10% white — hovered panels         |
| Primary Accent    | `@primary`            | `#c9b4f5`     | Soft lilac — matugen primary       |
| Secondary Accent  | `@secondary`          | `#89b4fa`     | Cool blue — matugen secondary      |
| Text Primary      | `@on-background`      | `#e4e0ef`     | Warm off-white                     |
| Text Muted        | `@on-surface`         | `#9e99b0`     | Dimmed for labels / hints          |
| Border            | `@outline`            | `#ffffff26`   | 15% white border on glass elements |
| Danger            | `--red`               | `#f38ba8`     | Catppuccin-compatible red          |
| Warning           | `--yellow`            | `#f9e2af`     | Catppuccin-compatible yellow       |

> **Rule:** Never use a fully opaque surface unless it is a fullscreen blur backdrop.

---

## Typography

| Use Case          | Font                    | Weight   | Size      |
|-------------------|-------------------------|----------|-----------|
| Display / Clock   | `Geist Mono` / `JetBrains Mono NF` | 100–200  | 72–96px   |
| UI Labels         | `JetBrains Mono NF`     | 400      | 11–13px   |
| Body / Desc       | `JetBrains Mono NF`     | 300      | 12px      |
| Accent / Pill     | `JetBrains Mono NF`     | 600      | 10px uppercase |

- **Letter-spacing** on display text: `−0.02em` (tight, refined)
- **Letter-spacing** on labels: `0.08em` (airy, readable)
- All text renders with `font-feature-settings: 'liga' 1, 'calt' 1`

---

## Glass Effect System

The signature look. Applied consistently across all UI surfaces.

```css
/* Base Glass Panel */
.glass {
  background: rgba(255, 255, 255, 0.05);
  backdrop-filter: blur(20px) saturate(180%);
  -webkit-backdrop-filter: blur(20px) saturate(180%);
  border: 1px solid rgba(255, 255, 255, 0.10);
  border-radius: 16px;
  box-shadow:
    0 8px 32px rgba(0, 0, 0, 0.4),
    inset 0 1px 0 rgba(255, 255, 255, 0.12);
}

/* Elevated Glass — modals, focused elements */
.glass-elevated {
  background: rgba(255, 255, 255, 0.08);
  backdrop-filter: blur(40px) saturate(200%);
  border: 1px solid rgba(255, 255, 255, 0.18);
  box-shadow:
    0 16px 64px rgba(0, 0, 0, 0.6),
    inset 0 1px 0 rgba(255, 255, 255, 0.20),
    0 0 0 1px rgba(255, 255, 255, 0.04);
}

/* Subtle Glass — waybar, tooltips */
.glass-subtle {
  background: rgba(255, 255, 255, 0.03);
  backdrop-filter: blur(12px) saturate(140%);
  border: 1px solid rgba(255, 255, 255, 0.07);
  border-radius: 12px;
}
```

### Hyprland / Hyprlock Equivalent (RGBA)
```conf
# Hyprlock col.* values use ARGB hex: AARRGGBB
# Glass white tint:   0x0dffffff  (5%)
# Glass border:       0x26ffffff  (15%)
# Elevated tint:      0x14ffffff  (8%)
```

---

## Blur Levels

| Context              | Blur Radius | Saturation | Use                          |
|----------------------|-------------|------------|------------------------------|
| Fullscreen backdrop  | 48px        | 120%       | Hyprlock background          |
| Primary panels       | 20–24px     | 180%       | Waybar, swaync, rofi         |
| Secondary / tooltips | 10–14px     | 150%       | Dropdowns, small widgets     |
| Wallpaper dim        | —           | —          | `rgba(0,0,0,0.45)` overlay   |

---

## Border & Radius System

| Element          | Radius  | Border                          |
|------------------|---------|---------------------------------|
| Full panels      | `16px`  | `1px solid rgba(fff,fff,fff,10%)` |
| Pills / tags     | `999px` | `1px solid rgba(fff,fff,fff,12%)` |
| Input fields     | `10px`  | `1px solid rgba(fff,fff,fff,15%)` |
| Buttons          | `10px`  | `1px solid rgba(fff,fff,fff,12%)` |
| Notifications    | `14px`  | `1px solid rgba(fff,fff,fff,8%)`  |
| Hyprland windows | `10px`  | via `col.active_border` gradient |

---

## Motion & Animation

> **Principle:** Everything eases in. Nothing snaps.

| Transition Type    | Duration | Easing                        |
|--------------------|----------|-------------------------------|
| Panel appear       | 300ms    | `cubic-bezier(0.16,1,0.3,1)` |
| Hover state        | 150ms    | `ease-out`                    |
| Fade in/out        | 200ms    | `ease`                        |
| Slide in (rofi)    | 250ms    | `cubic-bezier(0.34,1.56,0.64,1)` — slight spring |
| Lock screen reveal | 500ms    | `ease-in-out`                 |

Hyprland animations follow this:
```conf
animations {
  enabled = true
  bezier = glass, 0.16, 1, 0.3, 1
  bezier = spring, 0.34, 1.56, 0.64, 1
  animation = windows, 1, 4, spring, popin 85%
  animation = fade, 1, 3, glass
  animation = workspaces, 1, 4, glass, slidevert
  animation = layers, 1, 3, glass, fade
}
```

---

## Screen-by-Screen Design Specs

### 1. Hyprlock (Login / Lock Screen)

**Layout:** Centered card, vertically stacked, fullscreen blurred wallpaper

```
┌──────────────────────────────────────┐
│           [blurred wallpaper]        │
│         + dark overlay (45%)         │
│                                      │
│         ┌──────────────────┐         │
│         │  [avatar circle] │         │
│         │   username       │         │
│         │  [password field]│         │
│         │  [submit hint]   │         │
│         └──────────────────┘         │
│                                      │
│  [time: 09:41]        [date]         │
└──────────────────────────────────────┘
```

- Card: `glass-elevated`, width `360px`, padding `48px 40px`
- Clock: top-left or bottom-left, `96px`, `font-weight: 100`, primary accent colour
- Date: below clock, `14px`, muted text
- Password input: glass-subtle, `border-radius: 10px`, accent border on focus
- Avatar: `80px` circle, `border: 2px solid rgba(255,255,255,0.2)`

---

### 2. Waybar

**Style:** Floating islands, `glass-subtle`, centered on top/bottom edge

- Bar background: fully transparent
- Modules rendered as individual glass pill islands
- Workspace buttons: active = `glass-elevated` + accent border
- System tray, clock, volume: grouped in one glass pill right side

---

### 3. Rofi

**Style:** Centered launcher, `glass-elevated`, tight spacing

- Window: `border-radius: 16px`, blur behind via `backdrop-filter`
- Input row: flat inside panel, bottom-border only on focus
- Results: `glass-subtle` on hover, accent left-bar on selected
- Icons: monochrome, accent colour

---

### 4. Swaync (Notification Center)

**Style:** Right-side slide-in panel, `glass`, gap between notifications

- Panel: `width: 400px`, full-height, `border-left: 1px solid rgba(fff,10%)`
- Notification cards: `glass-subtle`, `border-radius: 14px`, subtle drop shadow
- Action buttons: pill-shaped, `glass` bg, accent on hover

---

### 5. Wlogout

**Style:** Fullscreen blur + centered grid of icon buttons

- Backdrop: blurred wallpaper + `rgba(0,0,0,0.6)` overlay
- Buttons: `glass-elevated` circles, `120px × 120px`
- Hover: `border-color` shifts to primary accent, icon glows

---

## Matugen Integration

Matugen regenerates all colour tokens on wallpaper change via:
```toml
# matugen/config.toml
[config]
reload_apps = true
```

Templates to maintain:
- `hyprland-colors.conf` → Hyprland col.* values
- `hyprlock` colours → inline in `hyprlock.conf`  
- `waybar/colors.css` → CSS variables
- `rofi-colors.rasi` → rasi variables
- `kitty-colors.conf` → terminal palette
- `nvim-colors.lua` → Neovim highlights
- `gtk-colors.css` → GTK3/4 theming

**Workflow:**
```sh
matugen image ~/path/to/wallpaper.png
# → regenerates all templates
# → reloads waybar, swaync, kitty, hyprland
```

---

## File Naming Conventions

```
home/
  hypr/
    hyprlock.conf         ← lock screen
    hyprland.conf         ← main WM config
    config/
      looknfeel.conf      ← gaps, borders, blur, rounding
      keybinds.conf
      input.conf
      windowrules.conf
  programs/
    waybar/
      style.css           ← active style (symlinked or overwritten)
      styles/             ← named style variants
    rofi/
      config.rasi
      colors.rasi         ← matugen-generated
    swaync/
      style.css
      config.json
    wlogout/
      style.css
      layout
```

---

## Guiding Aesthetic Rules (TL;DR)

1. **No fully opaque surfaces** (except fullscreen backdrops)
2. **Always blur behind panels** — `backdrop-filter` everywhere
3. **Borders are whispers** — 8–15% white, never solid
4. **Radius is consistent** — 10px inputs, 16px panels, 999px pills
5. **Colour comes from matugen** — never hardcode a palette
6. **Motion is fluid** — cubic-bezier, no linear transitions
7. **Text is sparse** — only what the user needs, nothing decorative
8. **Depth through layers** — wallpaper → dim overlay → glass panel → content

---