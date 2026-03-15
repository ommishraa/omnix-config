# modules/packages.nix
{ pkgs, ... }:
{
  # ── Fonts ───────────────────────────────────────────────
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto
    font-awesome
    google-fonts
  ];

  fonts.fontDir.enable         = true;
  fonts.enableDefaultPackages  = true;

  # ── Shell ───────────────────────────────────────────────
  programs.zsh = {
    enable                    = true;
    enableCompletion          = true;
    autosuggestions.enable    = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable  = true;
      plugins = [
        "git"
        "z"
        "fzf"
        "direnv"
        "pay-respects"
        "colored-man-pages"
        "command-not-found"
        "copypath"
        "copyfile"
      ];
    };
  };

  # ── System packages ─────────────────────────────────────
  environment.systemPackages = with pkgs; [
    # dev
    git
    gh
    lazygit
    neovim
    vscode
    tree
    chromium
    firefox
    termius

    # monitoring
    btop

    # hyprland ecosystem
    swww
    hyprlock
    hypridle
    kitty
    waybar
    rofi
    fastfetch
    hyprpaper
    swaynotificationcenter
    libnotify
    wlogout
    cliphist
    wl-clipboard
    waypaper
    python3Packages.pillow

    # matugen workflows
    imagemagick
    fd
    ripgrep
    fzf
    jq
    tree-sitter
    gcc
    unzip
    gnumake
    python3
    nodejs
    rustc
    cargo
    python3Packages.pip
    file
    grim
    slurp
    satty
    brightnessctl
    playerctl
    networkmanagerapplet

    # theming
    matugen

    # audio
    pamixer

    # color picker
    hyprpicker

    # themes
    rose-pine-cursor
    hyprcursor
    glib
    coreutils

    # extras
    blueman
    yazi
    cava

    # ── NEW: shell enhancements ──────────────────────────
    starship        # prompt
    zoxide          # smart cd
    eza             # better ls
    bat             # better cat
    pay-respects         # auto-fix commands
    tldr            # simple man pages
    direnv          # auto .env loader

    # ── NEW: yazi extras ────────────────────────────────
    ueberzugpp      # image previews in yazi
    ffmpegthumbnailer # video thumbnails in yazi
    poppler         # PDF previews in yazi
    file            # file type detection
  ];
}
