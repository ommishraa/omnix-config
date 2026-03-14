# modules/packages.nix
{ pkgs, ... }:
{
  # ── Fonts ───────────────────────────────────────────────
  # fonts.packages is the CORRECT way to install fonts on NixOS
  # environment.systemPackages does NOT register fonts with fontconfig
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto
    font-awesome
    google-fonts
  ];

  fonts.fontDir.enable = true;
  fonts.enableDefaultPackages = true;

  # ── System packages ─────────────────────────────────────
  environment.systemPackages = with pkgs; [
    # dev
    git
    gh
    lazygit
    neovim
    vscode
    tree
    chromium
    firefox
    termius

    # monitoring
    btop

    # hyprland ecosystem
    swww
    hyprlock
    hypridle
    kitty
    waybar
    rofi
    fastfetch
    hyprpaper
    swaynotificationcenter
    libnotify
    wlogout
    cliphist
    wl-clipboard
    waypaper
    python3Packages.pillow

    # useful for matugen workflows
    imagemagick
    fd
    ripgrep
    fzf
    jq
    tree-sitter
    gcc
    unzip
    gnumake
    python3
    nodejs
    rustc
    cargo
    python3Packages.pip
    file
    grim
    slurp
    satty
    brightnessctl
    playerctl
    networkmanagerapplet

    # theming
    matugen

    # audio
    pamixer

    # color picker
    hyprpicker

    # themes
    rose-pine-cursor
    hyprcursor
    glib
    coreutils

    # extras
    blueman
    yazi
    cava
  ];
}
