{ pkgs, ... }:
{
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
 
    # useful for matugen workflows
    imagemagick
    fd
    ripgrep
    jq
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

    wl-clipboard
    cliphist

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

    # fonts
    nerd-fonts.jetbrains-mono

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
