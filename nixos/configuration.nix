# nixos/configuration.nix
{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../modules/nvidia.nix
    ../modules/hyprland.nix
    ../modules/packages.nix
    ../modules/sddm.nix
    ../modules/firefox.nix
  ];

  # --- Bootloader ---
  boot.loader.systemd-boot.enable      = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # --- Kernel parameters (NVIDIA DRM) ---
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  # --- Networking ---
  networking.hostName              = "nixos";
  networking.networkmanager.enable = true;

  # --- Timezone ---
  time.timeZone = "Asia/Kolkata";

  # --- Locale ---
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT    = "en_IN";
    LC_MONETARY       = "en_IN";
    LC_NAME           = "en_IN";
    LC_NUMERIC        = "en_IN";
    LC_PAPER          = "en_IN";
    LC_TELEPHONE      = "en_IN";
    LC_TIME           = "en_IN";
  };

  # --- Keyboard layout ---
  services.xserver.xkb = {
    layout  = "us";
    variant = "";
  };

  # --- User ---
  users.users.om = {
    isNormalUser = true;
    description  = "om";
    extraGroups  = [ "networkmanager" "wheel" "input" ];
    shell        = pkgs.zsh;
    packages     = with pkgs; [];
  };

  # --- Programs ---
  programs.zsh.enable   = true;
  programs.dconf.enable = true;

  # --- Allow unfree packages ---
  nixpkgs.config.allowUnfree = true;

  # --- Wayland + NVIDIA + Cursor environment variables ---
  environment.sessionVariables = {
    NIXOS_OZONE_WL            = "1";
    WLR_NO_HARDWARE_CURSORS   = "1";
    GBM_BACKEND               = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME         = "nvidia";
    XCURSOR_THEME             = "BreezeX-RosePine-Linux";
    XCURSOR_SIZE              = "24";
  };

  # --- System version ---
  system.stateVersion = "25.11";
}