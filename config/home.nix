# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  myhostname,
  ...
}:
{
  imports = [
    ../shared/dwm.nix
    ../shared/vscode.nix
    # ../shared/dmenu.nix
    # ../shared/rofi.nix
    # ../shared/mpv.nix
    ../shared/kitty.nix
    ../shared/alacritty.nix
    ../shared/tmux.nix
    ../shared/vim.nix
    ../shared/fish.nix
    ../shared/git.nix
    ../shared/nixpkgs.nix
    ../shared/firefox.nix
    ../shared/zathura.nix
    ../shared/lazygit.nix
    ../shared/ssh.nix
    ../shared/aerc.nix
    ../shared/oh-my-posh.nix
  ];

  nixpkgs = {
    overlays = [ ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home.packages = with pkgs; [
    # System
    xsel
    unzip
    zip
    wget
    alsa-utils
    upower
    gcc
    gnumake
    cmake
    arion
    htop
    pavucontrol
    procps
    openssh
    networkmanager
    fd
    bat
    bluez
    bluez-tools
    # tmux
    fzf
    eza
    btop
    thttpd
    xcolor
    openssl
    dig
    jq
    wireguard-tools
    acpi
    light
	# dmenu-rs-enable-plugins

    # Dev
    argocd
    gh
    ngrok
    tailwindcss
    yarn
    plantuml
    go
    templ
    goa
    prettierd

    #Tools
    qrencode
    air
    unstable.k9s
    git
    lazydocker
    kubectl

    # UI
    pastel
    imagemagick

    #VPN
    openvpn
    networkmanagerapplet
    networkmanager-l2tp
    strongswan
    networkmanager_strongswan

    # Display
    scrot
    xbanish
    feh
    brightnessctl
    dunst

    # Documents
    ripgrep
    grc
    texliveFull
    pandoc
    poppler_utils

    #Desktop
    unstable.feishin
    libreoffice
    unstable.signal-desktop
    pinta
    zathura
    vial
    thunderbird
    alacritty
    fastfetch
    lazygit
    byzanz
    remmina
    obsidian

    # Utils
    speedcrunch

    #Unfree
    discord
    slack
  ];
  programs.home-manager.enable = true;
  programs.fish.enable = true;
  programs.man.generateCaches = false;

  xsession.enable = true;
  xsession.windowManager.command =
    if myhostname == "laptop" then
      "/home/fw/nix/.xinitrc.laptop"
    else if myhostname == "jobb" then
      "/home/fw/nix/.xinitrc.jobb"
    else
      "/home/fw/nix/.xinitrc";

  home.username = "fw";
  home.homeDirectory = "/home/fw";

  home.stateVersion = "23.11"; # Did you read the comment?

  systemd.user.startServices = "sd-switch";
}
