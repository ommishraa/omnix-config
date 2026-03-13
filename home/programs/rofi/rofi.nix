{ ... }:
{
  programs.rofi = {
    enable = true;
    configPath = ".config/rofi/config-hm.rasi";
  };
  home.file.".config/rofi/config.rasi".source = ./config.rasi;
}
