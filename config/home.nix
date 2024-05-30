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
    ../moduler/common/dwm.nix
    ../moduler/common/dmenu.nix
    ../moduler/common/kitty.nix
    ../moduler/common/tmux.nix
    ../moduler/common/vim.nix
    # ../moduler/common/zsh.nix 
    ../moduler/common/fish.nix 
    # ../moduler/common/starship.nix 
    ../moduler/common/git.nix
    ../moduler/common/nixpkgs.nix
    ../moduler/common/firefox.nix
    ../moduler/common/zathura.nix
    ../moduler/common/lazygit.nix
    ../moduler/common/spotifyd.nix
    ../moduler/common/ssh.nix
    ../moduler/common/aerc.nix
  ];

  nixpkgs = {
    overlays = [];
    config = {
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
    mpv
    gcc
    gnumake
    htop
    openssh
    xsel
    unzip
	zip
	imagemagick
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
	steam-run
	appimage-run
	bluez-tools
	grc
	xorg.xmodmap
	playerctl

	#Terminal	
	gh
    git
    tmux
    zathura
    yt-dlp
	fzf
	ripgrep
	spotify-tui
	fw-pkgs.spotify-player
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

	#Desktop
	aerc
    firefox
    thunderbird
    spotify
    signal-desktop
    darktable
    discord
    slack
    kitty
    neovim
    neofetch
    obsidian
    lazygit
	betterdiscordctl
	pdfarranger
	byzanz
	drawio
    remmina

	#Dev
    python3
    python311Packages.pip
	ranger
	python311Packages.pynvim
	ueberzugpp

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
	nodejs_21
	nodePackages_latest.vls
	nodePackages_latest.volar
	vscode-langservers-extracted

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
  xsession.windowManager.command = "exec dwm";

  home.username = "fw";
  home.homeDirectory = "/home/fw";

  home.stateVersion = "23.11"; # Did you read the comment?

  systemd.user.startServices = "sd-switch";
}
