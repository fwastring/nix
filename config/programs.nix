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
	services.udev = {
		extraRules = ''
			KERNEL=="ttyACM0", MODE:="666"
		'';
		packages = with pkgs; [
			vial
			via
		];
	};

  	environment.systemPackages = with pkgs; [
		unstable.feishin
		pastel
		libreoffice
		unstable.signal-desktop
		pinta
		zathura
		thunderbird
		lazygit
		byzanz
		remmina
		obsidian
		speedcrunch
		discord
		slack
		feh
		pavucontrol
		scrot
		imagemagick
		pandoc
		texliveFull
		mpv
		qutebrowser
		bitwarden-cli
		rofi
		bitwarden-menu
	];
}
