# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  myhostname,
  ...
}:
{

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
	# Bluetooth
    bluez
    bluez-tools

	# Zathura
    poppler_utils

	# Transform
    imagemagick
    pandoc

	# Sound
    alsa-utils

	# Monitor
    brightnessctl
  	
    # System
	sops
    libnotify
    unzip
    zip
    wget
    htop
    procps
    btop
    procs
    dysk
    grc
    vim
    fastfetch

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

	# Files
    fzf
    eza
    rsync
    dust
    ripgrep
    fd

	# Misc
    lolcat
    fortune
    cowsay

	# Security
    openssl

	# Git
    lazygit

	# Terminal Stuff
    chawan
    go-passbolt-cli

    # Typesetting
    typst
    typstyle
    tinymist
    websocat
    nix-search-cli
    libsixel

    (
      let
        base = pkgs.appimageTools.defaultFhsEnvArgs;
      in
      pkgs.buildFHSEnv (
        base
        // {
          name = "fhs";
          targetPkgs =
            pkgs:
            # pkgs.buildFHSUserEnv provides only a minimal FHS environment,
            # lacking many basic packages needed by most software.
            # Therefore, we need to add them manually.
            #
            # pkgs.appimageTools provides basic packages required by most software.
            (base.targetPkgs pkgs)
            ++ (with pkgs; [
              pkg-config
              ncurses
              # Feel free to add more packages here if needed.
            ]);
          profile = "export FHS=1";
          runScript = "bash";
          extraOutputsToInstall = [ "dev" ];
        }
      )
    )
  ];
}
