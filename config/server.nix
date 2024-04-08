# This is your home-manager configuration fileserver
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
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
    ../moduler/common/git.nix
    ../moduler/common/tmux.nix
    ../moduler/common/nixpkgs.nix
    ../moduler/common/lazygit.nix
    ../moduler/common/zsh-server.nix
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

  home.packages =  [
	# System
	pkgs.arion
    pkgs.wget
    pkgs.killall
    pkgs.gcc
    pkgs.gnumake
    pkgs.htop
    pkgs.openssh
    pkgs.xsel
    pkgs.unzip
    pkgs.nixops_unstable
	pkgs.cmake
    pkgs.networkmanager
	pkgs.fd
	pkgs.bat
	unstable.lego

	#Terminal	
    pkgs.git
    pkgs.yt-dlp
	pkgs.fzf
	pkgs.ripgrep

	#Desktop
    pkgs.neovim
    pkgs.lazygit

	#Dev
    pkgs.python3
    pkgs.python311Packages.pip
	pkgs.ranger
	pkgs.python311Packages.pynvim
	pkgs.ueberzugpp

	#LSP
    pkgs.nil
	pkgs.python311Packages.python-lsp-server
	pkgs.marksman
    pkgs.clojure-lsp
    pkgs.omnisharp-roslyn
    pkgs.haskell-language-server
	pkgs.java-language-server
	pkgs.nodePackages_latest.bash-language-server
	pkgs.dockerfile-language-server-nodejs
	pkgs.yaml-language-server
	pkgs.ansible-language-server
	pkgs.lua-language-server
	pkgs.tree-sitter
	pkgs.nodejs_21
	pkgs.nodePackages_latest.vls
	pkgs.nodePackages_latest.volar
	pkgs.vscode-langservers-extracted

    #VPN
    pkgs.openvpn
    pkgs.networkmanagerapplet
    pkgs.networkmanager-l2tp
    pkgs.strongswan
    pkgs.ansible
  ];
  programs.home-manager.enable = true;

  home.username = "fw";
  home.homeDirectory = "/home/fw";


  home.stateVersion = "23.11"; # Did you read the comment?

  systemd.user.startServices = "sd-switch";
}
