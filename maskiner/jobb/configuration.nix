# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  inputs,
  lib,
  config,
  pkgs,
  myhostname,
  ...
}: {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
	../../config/users.nix
	../../config/network.nix
	../../config/programs.nix
	../../config/system.nix
	../../config/dev.nix
	../../config/lsp.nix
	../../config/sway.nix
    ];

	#  services.greetd = {                                                      
	#  enable = true;                                                         
	#  settings = {                                                           
	# 	default_session = {                                                  
	# 	 command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd hyprland";
	# 	 user = "greeter";                                                  
	# 	};                                                                   
	#  };                                                                     
	# };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

fonts.packages = with pkgs; [
    nerd-fonts.comic-shanns-mono
	nerd-fonts.fira-code
  ];

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Disable = "Headset";
        };
      };
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


  networking.hostName = myhostname; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
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

  # Enable the X11 windowing system.


services = {
	#tailscale.enable = true;
    picom.enable = true;
    openssh = {
      enable = true;
    };
    blueman = {
      enable = true;
    };
  };

  # Configure console keymap
  console.keyMap = "sv-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  virtualisation.docker = {
	  enable = true;
	};


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fw = {
    isNormalUser = true;
    description = "Fredrik Wastring";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.xserver.dpi = 140;

  system.stateVersion = "25.05"; # Did you read the comment?
}
