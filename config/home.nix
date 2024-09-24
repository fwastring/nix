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
    # ../shared/kitty.nix
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
	arion
    wget
    alsa-utils
    killall
    upower
    gcc
    gnumake
    htop
    openssh
    xsel
    unzip
	zip
	imagemagick
	ghostscript
	killall
	cmake
    feh
    brightnessctl
    scrot
    dunst
    xbanish
    networkmanager
    pavucontrol
	fd
	bat
	appimage-run
	bluez
	bluez-tools
	grc
	xorg.xmodmap
	playerctl
	openssl
	libiconv
	pkg-config
	libsecret
	go
	ghorg
	libsixel
	valgrind
	soulseekqt

	#Terminal	
	jq

	gnuplot
	qrencode
	texliveFull

	python311Packages.urwid
	python311Packages.numpy
	python311Packages.matplotlib
	sysz
	betterlockscreen
	gh
    git
    tmux
    zathura
    yt-dlp
	fzf
	ripgrep
	alsa-lib
	libdbusmenu
	xorg.libxcb
	speedcrunch
	eza
	btop
	poppler_utils
	pandoc
	glow
	rustup
	openssl
	pkg-config
	lazydocker

	#Unfree
    # obsidian
    # discord
    # slack

	#Alternatives
	slack-cli
	spotify
	unstable.spotifyd
	librespot
	discordo

	#Desktop
	libreoffice-qt6-fresh
	fluent-reader
	aerc
    firefox
	vial
    thunderbird
    signal-desktop-beta
    kitty
	alacritty
    unstable.neovim
    fastfetch
    lazygit
	pdfarranger
	byzanz
	drawio
	xdotool
	pinentry
    remmina

	#Dev
    python3
    python311Packages.pip
	ranger
	python311Packages.pynvim
	ueberzugpp
	jdk
	maven

	#LSP
    nil
	python311Packages.python-lsp-server
	marksman
    clojure-lsp
    omnisharp-roslyn
    haskell-language-server
	java-language-server
	nodePackages_latest.bash-language-server
	dockerfile-language-server-nodejs
	yaml-language-server
	ansible-language-server
	lua-language-server
	tree-sitter
	nodejs_22
	nodePackages_latest.vls
	nodePackages_latest.volar
	vscode-langservers-extracted
	gopls

    #VPN
    openvpn
    networkmanagerapplet
    networkmanager-l2tp
    strongswan
    ansible
  ];
  programs.home-manager.enable = true;
  programs.fish.enable = true;

  xsession.enable = true;
  xsession.windowManager.command = if myhostname == "laptop" then "/home/fw/nix/.xinitrc.laptop" else if myhostname == "jobb" then "/home/fw/nix/.xinitrc.jobb" else "/home/fw/nix/.xinitrc";

  home.username = "fw";
  home.homeDirectory = "/home/fw";

  home.stateVersion = "23.11"; # Did you read the comment?

  systemd.user.startServices = "sd-switch";
}
