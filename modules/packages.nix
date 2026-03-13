{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # terminal
    kitty
    tmux

    # dev
    git
    gh
    lazygit
    neovim
    vscode
    tree

    # monitoring
    btop
    fastfetch

    # hyprland ecosystem
    waybar
    hyprpaper
    swww          # wallpaper daemon
    hyprlock
    hypridle
    rofi

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

    # notifications
    swaynotificationcenter

    # audio
    pamixer

    # fonts
    nerd-fonts.jetbrains-mono

    # power menu
    wlogout

    # color picker
    hyprpicker

    # extras
    blueman       # bluetooth applet
    yazi
  ];
}
