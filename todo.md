# omnix-config · TODO
> Ricing roadmap — pick up from here tomorrow

---

## ✅ Done Today
- [x] hyprlock — omarchy pixel style, avatar, OMNIX label, animations
- [x] userconfig.conf — name + avatar customisable for repo cloners
- [x] fonts — moved to `fonts.packages`, JetBrainsMono NF + Font Awesome 7 working
- [x] Waybar icons — fixed font family names
- [x] SDDM — enabled with wayland
- [x] Symlink loop — fixed in home/hypr
- [x] design.md — full design system documented

---

## 🔧 Tomorrow — Shell & Terminal

### 1. oh-my-zsh + plugins
- [ ] Install oh-my-zsh
- [ ] Add to `packages.nix`:
  ```nix
  oh-my-zsh
  zsh-autosuggestions
  zsh-syntax-highlighting
  ```
- [ ] Configure in `.zshrc`:
  - Theme: use starship instead of oh-my-zsh theme
  - Plugins: `git z fzf direnv thefuck zsh-autosuggestions zsh-syntax-highlighting`

### 2. Starship prompt
- [ ] Add `starship` to packages
- [ ] Create `~/.config/starship.toml` with omarchy style
  - Tokyo Night colours
  - Show: directory, git branch, git status, nix shell, language versions
  - Minimal single-line layout

### 3. Shell extras — add all to `packages.nix`
```nix
zoxide        # smart cd — use: z <partial-dir-name>
eza           # better ls — alias ls="eza --icons"
bat           # better cat — alias cat="bat"
fzf           # fuzzy finder — Ctrl+R history, Ctrl+T files
direnv        # auto .env loader
tldr          # simple man pages — use: tldr <command>
thefuck       # auto-fix wrong commands — type: fuck
starship      # prompt
```

### 4. `.zshrc` aliases to add
```zsh
alias ls="eza --icons --group-directories-first"
alias ll="eza -la --icons --group-directories-first --git"
alias lt="eza --tree --icons --level=2"
alias cat="bat --style=auto"
alias cd="z"        # after zoxide init
alias grep="rg"     # ripgrep already installed
alias find="fd"     # fd already installed
alias vim="nvim"
alias v="nvim"
```

---

## 🔧 Tomorrow — Neovim (LazyVim)

### Setup
- [ ] Install LazyVim:
  ```sh
  # Backup existing config first
  mv ~/.config/nvim ~/.config/nvim.bak
  # Clone LazyVim starter
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
  ```
- [ ] Add to `packages.nix`: `neovim` already there ✅
- [ ] Add dependencies:
  ```nix
  # Already have: gcc, nodejs, python3, ripgrep, fd
  # Add:
  lazygit   # already there ✅
  ```

### Plugins to add on top of LazyVim base
- [ ] `catppuccin/nvim` or Tokyo Night theme to match rice
- [ ] `folke/zen-mode.nvim` — distraction free writing
- [ ] `wakatime/vim-wakatime` — coding stats (optional)
- [ ] Configure LSPs: lua, nix, python, typescript, rust

### Neovim colour sync with matugen
- [ ] `home/programs/nvim/lua/matugen/colors.lua` already in repo — wire it up

---

## 🔧 Tomorrow — Yazi (file manager)

- [ ] Create `~/.config/yazi/yazi.toml`
- [ ] Create `~/.config/yazi/theme.toml` — Tokyo Night colours
- [ ] Create `~/.config/yazi/keymap.toml`
- [ ] Add yazi shell integration to `.zshrc`:
  ```zsh
  # Yazi — cd on exit
  function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      cd -- "$cwd"
    fi
    rm -f -- "$tmp"
  }
  ```
- [ ] Add previewer: `ueberzugpp` for image previews in terminal

---

## 🔧 Tomorrow — Fastfetch

- [ ] Redesign `~/.config/fastfetch/config.jsonc`
- [ ] Custom layout: logo left, info right
- [ ] Show: OS, kernel, WM, shell, terminal, CPU, GPU, RAM, uptime, colours
- [ ] Use omarchy/Tokyo Night ASCII art or image logo
- [ ] Add `fastfetch` to `.zshrc` so it runs on terminal open

---

## 🔧 Later — Dotfiles Management

### hjem (your friend's recommendation)
- [ ] Research hjem vs home-manager
  - `hjem` is a newer, simpler alternative to home-manager
  - Less complex, no HM module system overhead
  - Good for managing dotfiles declaratively in Nix
  - GitHub: https://github.com/feel-co/hjem
- [ ] Decide: hjem vs home-manager
- [ ] Migrate dotfiles from symlink.sh to declarative management
- [ ] Remove `symlink.sh` once migration complete

### home-manager (alternative)
- [ ] Already in `flake.nix` inputs ✅
- [ ] Wire up `home-manager` module in flake outputs
- [ ] Move per-user config from `configuration.nix` to `home/home.nix`

---

## 🔧 Later — Waybar Full Restyle

- [ ] Apply glass/omarchy theme from `design.md`
- [ ] Style: floating islands, glass pills, transparent background
- [ ] Colours sourced from matugen `colors.css`
- [ ] Modules to keep: clock, workspaces, audio, network, battery, tray

---

## 🔧 Later — Remaining Rice

- [ ] Rofi — app launcher, glass style
- [ ] Swaync — notification center, glass panels
- [ ] Wlogout — power menu, glass circles
- [ ] Hyprland `looknfeel.conf` — gaps, borders, blur, rounding, animations
- [ ] matugen workflow — test full wallpaper → theme regeneration pipeline
- [ ] SDDM custom QML theme — pixel style matching hyprlock

---

## 📦 Packages to add to packages.nix tomorrow

```nix
# shell
zoxide
eza
bat
thefuck
tldr
direnv
starship
zsh-autosuggestions
zsh-syntax-highlighting

# yazi extras
ueberzugpp    # image previews in terminal

# optional
gh            # already there ✅
lazygit       # already there ✅
```

---

## 🗒 Notes
- Always `git add` new files before `nixos-rebuild` — flakes only see tracked files
- Fonts go in `fonts.packages`, NOT `environment.systemPackages`
- hyprlock image `path` does NOT support `$variables` — hardcode avatar path
- `rounding` in hyprlock image must = `size / 2` for perfect circle
- Press Start 2P font must be TTF not WOFF2 for hyprlock to load it

---