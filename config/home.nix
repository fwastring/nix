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
	unstable.betterlockscreen
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

	# Dev
	gh
	unstable.deno
	unstable.hugo
	unstable.logstash
	ngrok
	tailwindcss
	nodejs_23
	yarn
	plantuml
	go
	# dotnetCorePackages.sdk_8_0_3xx
	dotnetCorePackages.sdk_9_0_1xx
	templ
	goa
	azuredatastudio
	mdbtools
	prettierd

	#Tools
	qrencode
	air
	k9s
    git
	lazydocker
	kubectl

	#LSP
	# roslyn
	roslyn-ls
	dockerfile-language-server-nodejs
	docker-compose-language-service
	bash-language-server
	python312Packages.python-lsp-server
	yaml-language-server
	lua-language-server
	typescript
    nil
	jdt-language-server
	texlab
	marksman
	tree-sitter
	vue-language-server
	typescript-language-server
	gopls
	rust-analyzer

	# UI
	# rofi-bluetooth
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
	fluent-reader
	unstable.feishin
	libreoffice
	unstable.signal-desktop
	pinta
    zathura
	vial
    thunderbird
	alacritty
    neovim
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
  xsession.windowManager.command = if myhostname == "laptop" then "/home/fw/nix/.xinitrc.laptop" else if myhostname == "jobb" then "/home/fw/nix/.xinitrc.jobb" else "/home/fw/nix/.xinitrc";

  home.username = "fw";
  home.homeDirectory = "/home/fw";

  home.stateVersion = "23.11"; # Did you read the comment?

  systemd.user.startServices = "sd-switch";
}
