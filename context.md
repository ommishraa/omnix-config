# Project Context: Om NixOS Configuration (omnix-config)

This document serves as a persistent record of the changes, architectural decisions, and current state of the `omnix-config` repository.

## Overview
The goal of this project is to maintain a modular and clean NixOS configuration using Flakes and Home Manager, inspired by a reference configuration (`nix-hyprland`) but with a custom directory structure.

## Changes Implemented

### 1. System-Level Configuration (`nixos/`)
- **Default Shell**: Enabled `zsh` system-wide and set it as the default shell for user `om` in `configuration.nix`.
- **Package Management**: Cleaned up `modules/packages.nix` by removing packages that are now managed via Home Manager (e.g., `kitty`, `tmux`, `waybar`, `rofi`, etc.).
- **New Packages**: Added `cava` to the system-wide package list.
- **Redundancy Cleanup**: Removed `hyprpaper` as `swww` is the primary wallpaper daemon.

### 2. Home Manager Configuration (`home/`)
- **Modularization**: 
    - Updated `waybar`, `rofi`, and `fastfetch` to use `programs.<name>.enable = true`.
    - Integrated `swaynotificationcenter` and `wlogout` into their respective home modules.
- **Zsh Setup**:
    - Created `home/programs/zsh/zsh.nix`.
    - Integrated `zsh-autosuggestions`, `zsh-syntax-highlighting`, and the `powerlevel10k` theme.
    - Added `fastfetch` to the shell startup.
- **Wallpapers**: Added a symlink for the `wallpapers` directory to `~/wallpapers` in `home.nix` to ensure compatibility with existing scripts.
- **Cleanup**: Deleted redundant `home/swaync` and `home/wlogout` directories that were outside the `programs/` structure.

### 3. Theming & Matugen
- **Dynamic Theming**: Confirmed that `matugen` correctly writes generated colors to `~/.config/` paths (like `hypr/colors.conf`, `kitty/colors.conf`, etc.).
- **Symlink Strategy**: Files managed by Home Manager are symlinked to the Nix store (read-only), while `matugen`-generated files remain writable by the user/scripts to allow dynamic theme switching.

## Current Project Structure
- `flake.nix`: Main entry point.
- `nixos/`: System-wide configuration (hardware, users, system packages).
- `modules/`: Shared system modules (NVIDIA, Hyprland, Packages).
- `home/`: User-specific configuration (Home Manager).
    - `programs/`: Individual application configurations.
    - `hypr/`: Hyprland-specific configs and scripts.
    - `wallpapers/`: Collection of wallpaper images.

## Next Steps
- Apply the configuration using `sudo nixos-rebuild switch --flake .#nixos`.
- Configure `p10k` manually if the wizard doesn't trigger.
- Verify hardware-specific modules in `waybar` (battery/network names).
- Explore Neovim configuration using the `matugen` Lua template.

---
*Last updated: Friday, 13 March 2026*
