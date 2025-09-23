# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs, myhostname,
  ...
}: {
	services.udev = {
		extraRules = ''
			KERNEL=="ttyACM0", MODE:="666"
			ACTION=="add", KERNEL=="sd[a-e][0-9]", ENV{ID_FS_UUID}=="3039-3932", RUN+="${pkgs.systemd}/bin/systemd-mount --no-block -A -G -o gid=users,fmask=113,dmask=002 /dev/%k /mnt/sdcard"
			ACTION=="add", KERNEL=="sd[a-e]", ENV{ID_FS_UUID}=="66BA-4EBA", RUN+="${pkgs.systemd}/bin/systemd-mount --no-block -A -G -o gid=users,fmask=113,dmask=002 /dev/%k /mnt/kobo"
		'';
		packages = with pkgs; [
			vial
			via
		];
	};

  	environment.systemPackages = with pkgs; [
		# GUI
		feishin
		signal-desktop
		thunderbird
		libreoffice
		discord
		slack
		speedcrunch
		remmina
		vial
		via
		drawio
		freecad-wayland
		kdePackages.okular
		angryipscanner

		# TUI
		gurk-rs

		# Browsers
		librewolf
		chawan

		# Displaying
		zathura
		feh
		mpv

		# System
		pavucontrol
		pulseaudio
		devour # Swallow windows
		caligula # Burn ISOs
		ptouch-print

		# Transforms
		yt-dlp
		imagemagick
		pandoc
		pinta
		pastel
		ffmpeg
		darktable
	];
}
