{ pkgs, ... }:
{
  home.username = "om";
  home.homeDirectory = "/home/om";

  home.file."wallpapers".source = ./wallpapers;

  imports = [
    ./programs/kitty/kitty.nix
    ./programs/rofi/rofi.nix
    ./programs/waybar/waybar.nix
    ./programs/swaync/swaync.nix
    ./programs/wlogout/wlogout.nix
    ./programs/fastfetch/fastfetch.nix
    ./programs/tmux/tmux.nix
    ./programs/zsh/zsh.nix
    ./hypr/hyprland.nix
    ./matugen/matugen.nix
  ];

  home.packages = with pkgs; [
    ripgrep
    fd
    nodejs
    lua-language-server
    stylua
  ];

  home.stateVersion = "25.11";
}
