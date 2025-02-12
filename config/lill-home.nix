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
    ../shared/kitty.nix
    ../shared/alacritty.nix
    ../shared/tmux.nix
    ../shared/fish.nix 
    ../shared/git.nix
    ../shared/nixpkgs.nix
    ../shared/firefox.nix
    ../shared/zathura.nix
    ../shared/lazygit.nix
    ../shared/ssh.nix
    ../shared/oh-my-posh.nix
  ];

  nixpkgs = {
    overlays = [];
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
    acpi
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
	unstable.betterlockscreen
	tmux
	unstable.fzf
	eza
	btop
	xcolor
	openssl
	dig
	jq
	rockbox-utility
	rhythmbox
	libgpod

	# Dev
	unstable.hugo
	tailwindcss
	nodejs_22
	go

	#Tools
	qrencode
	air
    git
	lazydocker
	kubectl

	#LSP
	python312Packages.python-lsp-server
	yaml-language-server
    nil
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

	# UI
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

	# Documents
	ripgrep
	grc
	# texliveFull
	pandoc
	poppler_utils

	#Desktop
	unstable.feishin
    firefox
	unstable.signal-desktop
	pinta
    zathura
    thunderbird
	alacritty
    neovim
    fastfetch
    lazygit
	byzanz

	# Utils
	speedcrunch
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
