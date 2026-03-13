{ ... }:
{
  programs.rofi.enable = true;
  home.file.".config/rofi/config.rasi".source = ./config.rasi;
}
