{ config, pkgs, ... }:

{
  home.stateVersion = "25.11"; 

  xdg.configFile = {
    "cava".source = ./programs/cava;
    "fastfetch".source = ./programs/fastfetch;
    "kitty".source = ./programs/kitty;
    "rofi".source = ./programs/rofi;
    "swaync".source = ./programs/swaync;
    "tmux".source = ./programs/tmux;
    "waybar".source = ./programs/waybar;
    "wlogout".source = ./programs/wlogout;

    "hypr".source = ./hypr;
    "matugen".source = ./matugen;
  };
}