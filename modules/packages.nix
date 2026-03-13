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
    yazi

    # monitoring
    btop
    fastfetch

    # hyprland ecosystem
    waybar
    hyprpaper
    hyprlock
    rofi

    wl-clipboard
    cliphist

    grim
    slurp
    swappy

    brightnessctl
    playerctl
    networkmanagerapplet
  ];
}
