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

  # ── Ollama (LLM runner — dolphin3 and others) ───────────
  services.ollama = {
    enable       = true;
    acceleration = "cuda"; # RTX 5060 Ti
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
    microsoft-edge

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

    # ── Security & Pentesting Tools ─────────────────────

    # Reconnaissance
    nmap              # port scanner
    masscan           # fast port scanner
    whois             # domain lookup
    dnsutils          # dig, nslookup
    theharvester      # OSINT email/domain recon
    netdiscover       # ARP network scanner

    # Web hacking
    nikto             # web server scanner
    sqlmap            # SQL injection tool
    gobuster          # directory/DNS brute forcer
    ffuf              # web fuzzer
    burpsuite         # web proxy & testing suite

    # Password cracking
    john              # John the Ripper
    hashcat           # GPU password cracker
    hydra             # network login brute forcer
    wordlists         # rockyou and other wordlists

    # Network tools
    wireshark         # packet capture & analysis
    tcpdump           # CLI packet capture
    netcat            # TCP/UDP swiss army knife
    socat             # advanced netcat
    proxychains       # route traffic through proxies
    ettercap          # MITM & network sniffing
    bettercap         # modern MITM framework

    # Wireless
    aircrack-ng       # WiFi security toolkit
    kismet            # wireless network detector

    # Exploitation
    metasploit        # exploitation framework

    # Reverse engineering
    ghidra            # NSA reverse engineering tool
    radare2           # CLI reverse engineering
    gdb               # GNU debugger
    binwalk           # firmware analysis

    # Forensics & analysis
    exiftool          # metadata extractor
    foremost          # file carving
    dcfldd            # forensic dd
    sleuthkit         # filesystem forensics

    # Scripting & exploit dev
    python3Packages.pwntools   # CTF/exploit dev library
    python3Packages.scapy      # packet manipulation
    python3Packages.requests
    python3Packages.paramiko   # SSH library

    # Misc utilities
    curl
    wget
    openssl
    tor               # anonymity network
    torsocks          # route apps through tor
  ];
}