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
    swww          # wallpaper daemon
    hyprlock
    hypridle

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

    # extras
    blueman       # bluetooth applet
    yazi
  ];
}
