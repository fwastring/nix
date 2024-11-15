# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  myhostname,
  ...
}: {
  imports = [
    ../shared/dwm.nix
    ../shared/dmenu.nix
	../shared/rofi.nix
    ../shared/kitty.nix
    ../shared/alacritty.nix
    # ../shared/dunst.nix
    ../shared/tmux.nix
    ../shared/vim.nix
    ../shared/fish.nix 
    ../shared/git.nix
    ../shared/nixpkgs.nix
    ../shared/firefox.nix
    ../shared/zathura.nix
    ../shared/lazygit.nix
    # ../shared/spotifyd.nix
    ../shared/ssh.nix
    ../shared/aerc.nix
    ../shared/rbw.nix
    ../shared/oh-my-posh.nix
    ../shared/mpv.nix
  ];

  nixpkgs = {
    overlays = [];
    config = {
      # allowUnfree = false;
      # allowUnfreePredicate = _: false;
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      permittedInsecurePackages = [
        "electron-25.9.0"
		"electron-19.1.9"
        "nix-2.16.2"
      ];
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
	appimage-run
	bluez
	bluez-tools
	betterlockscreen
	tmux
    yt-dlp
	unstable.fzf
	eza
	btop
	xcolor
	openssl

	# Dev
	kaggle
	vscode
	unstable.cargo
	unstable.rustc
	cargo-generate
	nodejs_22
	gleam
	gh-f
	gh
	yarn
	plantuml
	go
	jq
	qrencode
    git
	lazydocker
	air
	templ
	ranger
	tesseract4
	k9s
	kubectl
	ngrok

	#LSP
	yaml-language-server
    nil
	jdt-language-server
	texlab
	marksman
	nodePackages_latest.bash-language-server
	typescript
	nodePackages_latest.typescript-language-server
	nodePackages_latest.vls
	nodePackages_latest.volar
	lua-language-server
	tree-sitter
	gopls
	rust-analyzer

	# Geography
	geos

	# UI
	rofi-bluetooth
	pastel
	imagemagick

    #VPN
    openvpn
    networkmanagerapplet
    networkmanager-l2tp
    strongswan

	# Display
    scrot
    xbanish
    feh
    brightnessctl
    dunst

	# Documentas
	ripgrep
	grc
	texliveFull
	pandoc
	poppler_utils

	#Desktop
	unstable.signal-desktop
	kompare
	pinta
    zathura
    firefox
	vial
    thunderbird
	alacritty
    unstable.neovim
    fastfetch
    lazygit
	byzanz
    remmina

	# Utils
	speedcrunch
	termusic

	#Unfree
    discord
    slack
  ];
  programs.home-manager.enable = true;
  programs.fish.enable = true;
  programs.man.generateCaches = false;

  xsession.enable = true;
  xsession.windowManager.command = if myhostname == "laptop" then "/home/fw/nix/.xinitrc.laptop" else if myhostname == "jobb" then "/home/fw/nix/.xinitrc.jobb" else "/home/fw/nix/.xinitrc";

  home.username = "fw";
  home.homeDirectory = "/home/fw";

  home.stateVersion = "23.11"; # Did you read the comment?

  systemd.user.startServices = "sd-switch";
}
