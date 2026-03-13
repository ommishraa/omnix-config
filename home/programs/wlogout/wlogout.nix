{ ... }:
{
  home.file.".config/wlogout/layout".source = ./layout;
  home.file.".config/wlogout/style.css".source = ./style.css;
  home.file.".config/wlogout/icons" = {
    source = ../../../wlogout/icons;
    recursive = true;
  };
}
