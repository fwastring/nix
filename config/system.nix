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

	services.pcscd.enable = true;
	programs.gnupg.agent = {
	   enable = true;
	   enableSSHSupport = true;
	};

	programs.nh = {
		enable = true;
		clean.enable = true;
		clean.extraArgs = "--keep-since 4d --keep 3";
		flake = "/home/fw/nix";
	  };


  	environment.systemPackages = with pkgs; [
		# System
		libnotify
		lf
		xsel
		xbanish
		unzip
		zip
		wget
		alsa-utils
		htop
		procps
		fzf
		eza
		btop
		xclip
		dysk
		rsync
		procs
		dust
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
		bluez
		bluez-tools
		openssl
		imagemagick
		pandoc
		texliveFull
		fastfetch
		keyutils
		pinentry-all
		(pass.withExtensions (ext: with ext; [
			pass-import
			pass-genphrase
			pass-update
		]))
		lazygit
		chawan
		go-passbolt-cli
		waypipe
		wl-clipboard
		smartmontools

		# Typesetting
		typst
		typstyle
		tinymist
		websocat
		nix-search-cli
		libsixel
	];
}
