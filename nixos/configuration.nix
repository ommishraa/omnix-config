# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').
{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../modules/nvidia.nix
      ../modules/hyprland.nix
      ../modules/packages.nix
    ];

  # --- Bootloader ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # --- Kernel parameters (NVIDIA DRM) ---
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  # --- Networking ---
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # --- Timezone ---
  time.timeZone = "Asia/Kolkata";

  # --- Locale ---
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # --- Keyboard layout ---
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # --- User ---
  users.users.om = {
    isNormalUser = true;
    description = "om";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  # --- Programs ---
  programs.zsh.enable = true;

  # --- Allow unfree packages ---
  nixpkgs.config.allowUnfree = true;

  # --- Wayland + NVIDIA environment variables ---
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
  };

  # Display Manager
    services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # --- System version ---
  system.stateVersion = "25.11";
}
