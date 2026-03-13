{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  home.file.".config/hypr/keybinds.conf".source = ./keybinds.conf;
  home.file.".config/hypr/animations.conf".source = ./animations.conf;
  home.file.".config/hypr/theme.conf".source = ./theme.conf;
  home.file.".config/hypr/input.conf".source = ./input.conf;
  home.file.".config/hypr/windowrules.conf".source = ./windowrules.conf;
  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;
  home.file.".config/hypr/hypridle.conf".source = ./hypridle.conf;

  home.file.".config/hypr/scripts" = {
    source = ./scripts;
    recursive = true;
  };
}
