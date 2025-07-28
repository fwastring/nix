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
  # You can import other NixOS modules here
  imports = [
    ./hardware-configuration.nix
    ../../shared/openssh.nix
	../../config/users.nix
    ../../config/dev.nix
    ../../config/lsp.nix
    ../../config/network.nix
    ../../config/system.nix
  ];
  nixpkgs = {
    overlays = [
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix.registry = (lib.mapAttrs (_: flake: { inherit flake; })) (
    (lib.filterAttrs (_: lib.isType "flake")) inputs
  );
  nix.nixPath = [ "/etc/nix/path" ];
  users.defaultUserShell = pkgs.bash;
  documentation.man.generateCaches = false;
  programs.fish.enable = true;
  programs.bash = {
    interactiveShellInit = ''
      		if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      		then
      		  shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      		  exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      		fi
      	  '';
  };
  environment.etc = lib.mapAttrs' (name: value: {
    name = "nix/path/${name}";
    value.source = value.flake;
  }) config.nix.registry;

  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  virtualisation.docker = {
    enable = true;
    liveRestore = false;
  };

  networking.networkmanager.enable = true;

  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERM = "xterm-256color";
  };

  time.timeZone = "Europe/Stockholm";

  fonts.packages = with pkgs; [
    nerd-fonts.comic-shanns-mono
	nerd-fonts.fira-code
  ];

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  console.keyMap = "sv-latin1";
boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;


  networking.hostName = myhostname;

  services.xserver.dpi = 140;

  system.stateVersion = "25.05";
}
