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

  fonts.fontDir.enable        = true;
  fonts.enableDefaultPackages = true;

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
    walker              # better app launcher
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
    pulsemixer          # audio TUI

    # bluetooth & network TUIs
    bluetui             # bluetooth TUI
    impala              # wifi TUI

    # docker
    lazydocker          # docker TUI

    # terminal extras
    peaclock            # terminal clock

    # color picker
    hyprpicker

    # themes
    rose-pine-cursor
    papirus-icon-theme
    hyprcursor
    glib
    coreutils

    # extras
    blueman
    yazi
    cava

    # shell enhancements
    starship
    zoxide
    eza
    bat
    tldr
    direnv

    # yazi extras
    ueberzugpp
    ffmpegthumbnailer
    poppler

    # ── LSP & formatters (for neovim) ───────────────────
    nixd                              # nix LSP
    alejandra                         # nix formatter
    lua-language-server               # lua LSP
    stylua                            # lua formatter
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted  # html/css/json LSP
  ];
}
