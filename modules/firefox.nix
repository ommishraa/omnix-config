# modules/firefox.nix
# omnix-config — Firefox with declarative extensions
{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;

    # ── Extensions ────────────────────────────────────────
    policies = {
      ExtensionSettings = {
        # Vimium C — keyboard shortcuts for browser navigation
        "{d07ccf11-c0cd-4938-a265-2a4d6ad01189}" = {
          install_url        = "https://addons.mozilla.org/firefox/downloads/latest/vimium-c/latest.xpi";
          installation_mode  = "force_installed";  # always installed, can't be removed by user
        };

        # uBlock Origin — while we're at it, essential
        "uBlock0@raymondhill.net" = {
          install_url        = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode  = "force_installed";
        };
      };

      # ── Firefox preferences ─────────────────────────────
      # Disable telemetry
      DisableTelemetry          = true;
      DisableFirefoxStudies     = true;
      DisablePocket             = true;
      DisableFirefoxAccounts    = false;

      # New tab
      OverrideFirstRunPage      = "";
      OverridePostUpdatePage    = "";

      # DRM for streaming (Netflix etc)
      EncryptedMediaExtensions = {
        Enabled = true;
        Locked  = false;
      };
    };
  };
}
