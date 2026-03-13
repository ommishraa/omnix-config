{ ... }:
{
  home.file.".config/swaync/config.json".source = ./config.json;
  home.file.".config/swaync/style.css".source = ./style.css;
  home.file.".config/swaync/icons" = {
    source = ../../../swaync/icons;
    recursive = true;
  };
}
