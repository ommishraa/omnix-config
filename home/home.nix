{ pkgs, ... }:

{
  home.username = "om";
  home.homeDirectory = "/home/om";

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.packages = with pkgs; [
    ripgrep
    fd
    nodejs
    lua-language-server
    stylua
  ];

  home.stateVersion = "25.11";
}
