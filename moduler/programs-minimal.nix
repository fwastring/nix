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
		# GUI
		unstable.feishin
		unstable.signal-desktop
		slack
		speedcrunch
		remmina
		thunderbird
		drawio
		freecad-wayland

		# Capturing
		byzanz
		scrot

		# Displaying
		zathura
		feh

		# System
		pavucontrol
		pulseaudio
		devour # Swallow windows
		caligula # Burn ISOs

		# Transforms
		imagemagick
		pandoc
	];
}
