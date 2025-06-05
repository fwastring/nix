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
		unstable.feishin
		pastel
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
		speedcrunch
		discord
		slack
		feh
		imagemagick
		pandoc
		texliveFull
		mpv
	];
}
