# omnix-config · TODO
> Last updated: 2026-03-16

---

## ✅ Done — Session 1 (2026-03-15 morning)
- [x] design.md — full design system documented
- [x] hyprlock — omarchy pixel style, avatar, OMNIX label, native animations
- [x] userconfig.conf — name + avatar customisable for repo cloners
- [x] fonts — moved to `fonts.packages`, JetBrainsMono NF + Font Awesome 7 working
- [x] Waybar icons — fixed font family names
- [x] SDDM — enabled with wayland
- [x] Symlink loop — fixed in home/hypr

## ✅ Done — Session 2 (2026-03-15 afternoon/evening)

### Shell & Terminal
- [x] oh-my-zsh installed and configured
- [x] Switched to Powerlevel10k prompt (matching brother's setup)
- [x] zoxide — smart cd, replaces cd command
- [x] eza — better ls with icons and git status
- [x] bat — better cat with syntax highlighting
- [x] fzf — fuzzy finder with Tokyo Night colours
- [x] direnv — auto .env loader
- [x] tldr — simple man pages
- [x] pay-respects — thefuck replacement (thefuck removed from nixpkgs)
- [x] starship — configured but switched to p10k
- [x] All aliases set up in .zshrc

### Kitty
- [x] Font fixed to JetBrainsMonoNL Nerd Font Propo
- [x] Font size 9.0 matching brother's setup
- [x] Teal/cyan color scheme from brother's config
- [x] Theme switcher script — 8 themes, super+shift+T keybind
  - tokyo-night, catppuccin-mocha, catppuccin-latte
  - dracula, nord, gruvbox-dark, rose-pine, teal

### Fastfetch
- [x] Improved layout with icons, CPU/GPU/RAM/disk sections
- [x] Runs on terminal open via .zshrc

### Packages added
- [x] walker — better app launcher
- [x] peaclock — terminal clock
- [x] bluetui — bluetooth TUI
- [x] impala — wifi TUI
- [x] pulsemixer — audio TUI
- [x] lazydocker — docker TUI
- [x] nixd — nix LSP
- [x] alejandra — nix formatter
- [x] lua-language-server — lua LSP
- [x] ueberzugpp + ffmpegthumbnailer + poppler — yazi previews
- [x] papirus-icon-theme — GTK icons

### Waybar
- [x] All missing scripts created (WaybarScripts, LockScreen, Hypridle, KeyHints, ChangeBlur)
- [x] UserModules — bluetui, impala, pulsemixer, walker, yazi, lazygit wired up
- [x] Script shebangs fixed (#!/usr/bin/env bash/zsh)
- [x] kb_layout cache file created
- [x] input group added to user — keyboard-state module working
- [x] GTK cursor theme fixed — BreezeX-RosePine-Linux

### Yazi
- [x] Full config — yazi.toml, keymap.toml, theme.toml
- [x] Vim-style navigation (h/j/k/l)
- [x] Teal/Tokyo Night color theme
- [x] Image previews working
- [x] Syntax highlighted file previews working
- [x] Shortcuts: g h (home), g n (omnix-config), t (new tab), w (terminal here)
- [x] Symlinked via symlink.sh

### Neovim (LazyVim)
- [x] Tokyo Night theme
- [x] Custom OMNIX dashboard
- [x] LSP: nixd, lua_ls, pyright, ts_ls, bashls, cssls, html, jsonls
- [x] conform.nvim — format on save (alejandra for nix, stylua for lua)
- [x] Treesitter — nix, lua, python, typescript, bash, json, toml, yaml...
- [x] gitsigns — git diff in gutter
- [x] todo-comments — highlight TODO/FIXME/NOTE
- [x] which-key — keybind popup on leader
- [x] lazygit integration — leader+gg
- [x] Custom keymaps — Ctrl+s save, window navigation, buffer switching
- [x] Plugins symlinked via symlink.sh

### Firefox
- [x] Declarative extensions via programs.firefox
- [x] Vimium C — keyboard shortcuts for browser
- [x] uBlock Origin — ad blocker

---

## 🔧 Next Session — Remaining Rice

### Hyprland
- [ ] `looknfeel.conf` — gaps, borders, rounding, blur settings
- [ ] Animations — bezier curves, window open/close effects
- [ ] Window rules — floating, opacity per app
- [ ] Border colours from matugen

### Rofi
- [ ] Glass style matching design.md
- [ ] Tokyo Night / teal colours
- [ ] Rounded corners, blur background
- [ ] Icon theme

### Wlogout
- [ ] Glass circles style
- [ ] Custom icons
- [ ] Blur backdrop

### Swaync
- [ ] Glass panels
- [ ] Notification card styling
- [ ] Action buttons pill style

### Matugen workflow
- [ ] Test full wallpaper → theme regeneration pipeline
- [ ] Verify all templates regenerate correctly:
  - hyprland-colors.conf
  - kitty-colors.conf (note: conflicts with manual teal theme)
  - waybar/colors.css
  - rofi-colors.rasi
  - gtk-colors.css

### SDDM custom theme
- [ ] QML theme matching hyprlock pixel style
- [ ] Avatar + OMNIX text + password input

---

## 🔧 Later — Dotfiles Management

### hjem (recommended)
- [ ] Research: https://github.com/feel-co/hjem
- [ ] Simpler than home-manager, less overhead
- [ ] Migrate from symlink.sh to declarative nix management

### home-manager (alternative)
- [ ] Already in flake.nix inputs ✅
- [ ] Wire up in flake outputs
- [ ] Move per-user config to home/home.nix

---

## 🗒 Important Notes
- Always `git add` new files before `nixos-rebuild` — flakes only see tracked files
- Fonts go in `fonts.packages` NOT `environment.systemPackages`
- hyprlock `image { path }` does NOT support `$variables` — hardcode avatar path
- `rounding` in hyprlock image must = `size / 2` for perfect circle
- Press Start 2P must be TTF not WOFF2
- NixOS bash/zsh is NOT at `/bin/bash` — always use `#!/usr/bin/env bash`
- `find` alias points to `fd` — use `command find` or fd syntax when needed
- `cat` alias points to `bat` — use `command cat` for raw output
- p10k needs `exec zsh` not `source ~/.zshrc` for full reload
- nvim plugins symlink: only `lua/plugins/` is symlinked, `lua/config/` files are copied