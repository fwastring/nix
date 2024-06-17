# This is your home-manager configuration fileserver
# Use this to configure your home environment (it replaces ~/.config/nixnix)
{
  inputs,
  lib,
  config,
  pkgs,
  unstable,
  myhostname,
  ...
}: {
  imports = [
    ../shared/git.nix
    ../shared/tmux.nix
    ../shared/nixpkgs.nix
    ../shared/lazygit.nix
    ../shared/zsh-server.nix
  ];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      permittedInsecurePackages = [
        "nix-2.16.2"
      ];
    };
  };

  home.packages = with pkgs; [
	# System
	arion
    wget
    killall
    gcc
    gnumake
    htop
    openssh
    xsel
    unzip
    nixops_unstable
	cmake
    networkmanager
	fd
	bat

	#Terminal	
    git
    yt-dlp
	fzf
	ripgrep

	#Desktop
    neovim
    lazygit

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

  home.username = "fw";
  home.homeDirectory = "/home/fw";


  home.stateVersion = "23.11"; # Did you read the comment?

  systemd.user.startServices = "sd-switch";
}
