# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  myhostname,
  ...
}: {

  	environment.systemPackages = with pkgs; [
		# System
		xsel
		unzip
		zip
		wget
		alsa-utils
		upower
		htop
		pavucontrol
		procps
		fzf
		eza
		btop
		acpi
		xclip
		dysk
		rsync
		procs
		dust
		scrot
		xbanish
		brightnessctl
		lolcat
		fortune
		cowsay
		ripgrep
		poppler_utils
		grc
		pkg-config
		vim
		bat
		fd
		arion
		bluez
		bluez-tools
		openssl
	];
}
