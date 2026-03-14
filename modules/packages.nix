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
    font-awesome

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

    # icons
    google-fonts
  ];
}
